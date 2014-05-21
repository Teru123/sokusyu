//
//  ScoreData.m
//  TestView
//
//  Created by Teru on 2013/10/06.
//  Copyright (c) 2013年 Self. All rights reserved.
//

#import "ScoreData.h"
#import "Score.h"

@implementation ScoreData


- (id)init
{
    if (self = [super init]) {
        NSString *sqLiteDb = [[NSBundle mainBundle] pathForResource:@"Score" ofType:@"sqlite3"];
        
        if (sqlite3_open([sqLiteDb UTF8String], &_databaseForScores) != SQLITE_OK) {
            /*NSLog(@"Failed to open database!");*/
        }
    }
    return self;
    sqlite3_close(_databaseForScores);
   /* NSLog(@"dataBaseNotOpen");*/

}

- (void)initDatabaseForScores
{
    // Create a string containing the full path to the sqlite.db inside the documents folder
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *databasePath = [documentsDirectory stringByAppendingPathComponent:@"Score.db"];
    
    // Check to see if the database file already exists
    bool databaseAlreadyExists = [[NSFileManager defaultManager] fileExistsAtPath:databasePath];
    
    // Open the database and store the handle as a data member
    if (sqlite3_open([databasePath UTF8String], &_databaseForScores) == SQLITE_OK)
    {
        // Create the database if it doesn't yet exists in the file system
        if (!databaseAlreadyExists)
        {
            // Create the WORD table
            const char *sqlStatement =
            "CREATE TABLE IF NOT EXISTS ScoreList (ID INTEGER PRIMARY KEY, SCORE INTEGER)";
            char *error;
            if (sqlite3_exec(_databaseForScores, sqlStatement, NULL, NULL, &error) == SQLITE_OK)
            {
                /*NSLog(@"Database and tables created.");*/
            }
            else
            {
               /* NSLog(@"Error: %s", error);*/
            }
        }
    }

}

// Method to store a person and his associated address
-(void)insertScore:(Score *)Score
{
    // Create insert statement for the person
    NSString *insertStatement = [NSString stringWithFormat:@"INSERT INTO ScoreList (ID, SCORE) VALUES (\"%d\", \"%d\")",
                                 Score.uniqueId, Score.score];
    
    char *error;
    if ( sqlite3_exec(_databaseForScores, [insertStatement UTF8String], NULL, NULL, &error) == SQLITE_OK)
    {
        /*NSLog(@"Score inserted.");*/
    }
    else
    {
        /*NSLog(@"Error: %s", error);*/
    }
}

-(void)updateScore:(Score *)Score
{
    
    // Create insert statement for the person
    NSString *updateStatement = [NSString stringWithFormat:
                                    @"UPDATE ScoreList SET SCORE = (\"%d\") WHERE id=%d",
                                    Score.score,  Score.uniqueId];
        
    char *error;
    if ( sqlite3_exec(_databaseForScores, [updateStatement UTF8String], NULL, NULL, &error) == SQLITE_OK)
    {
       /* NSLog(@"Score updated.");*/
    }
    else
    {
       /* NSLog(@"Error: %s", error);*/
    }
    
}


-(Score *)Scores:(int)uniqueId
{
    Score *retval = nil;
    NSString *query = [NSString stringWithFormat:@"SELECT ID FROM ScoreList WHERE id=%d", uniqueId];
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(_databaseForScores, [query UTF8String], -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            int uniqueId = sqlite3_column_int(statement, 0);
            int Scores = sqlite3_column_int(statement, 1);
            
            retval = [[Score alloc] initWithUniqueId:uniqueId andScore:Scores];
            break;
        }
        sqlite3_finalize(statement);
    }
    return retval;
    
}

-(Score *)ScoreData:(int)uniqueId
{
    Score *retval = nil;
    NSString *query = [NSString stringWithFormat:@"SELECT SCORE FROM ScoreList WHERE id=%d", uniqueId];
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(_databaseForScores, [query UTF8String], -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            int uniqueId = sqlite3_column_int(statement, 0);
            int Scores = sqlite3_column_int(statement, 1);
            
            retval = [[Score alloc] initWithUniqueId:uniqueId andScore:Scores];
            break;
        }
        sqlite3_finalize(statement);
    }
    return retval;
    
}

- (NSArray *)scoreInfos
{
    NSMutableArray *retval = [[NSMutableArray alloc] init];
    NSString *query = @"SELECT ID, SCORE FROM ScoreList";
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(_databaseForScores, [query UTF8String], -1, &statement, NULL) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            int uniqueId = sqlite3_column_int(statement, 0);
            int score = sqlite3_column_int(statement, 1);

            Score *info = [[Score alloc] initWithUniqueId:uniqueId andScore:score];
            [retval addObject:info];
        }
        sqlite3_finalize(statement);
    }
    return retval;
}

@end
