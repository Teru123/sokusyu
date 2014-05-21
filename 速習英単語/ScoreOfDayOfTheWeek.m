//
//  ScoreOfDayOfTheWeek.m
//  sokusyu-eitango
//
//  Created by Teru on 2014/04/08.
//  Copyright (c) 2014年 Self. All rights reserved.
//

#import "ScoreOfDayOfTheWeek.h"
#import "GetAndSetScoreOfDayOfTheWeek.h"

@implementation ScoreOfDayOfTheWeek

- (id)init
{
    if (self = [super init]) {
        NSString *sqLiteDb = [[NSBundle mainBundle] pathForResource:@"ScoreOfDayOfTheWeek" ofType:@"sqlite3"];
        
        if (sqlite3_open([sqLiteDb UTF8String], &_databaseForGraph) != SQLITE_OK) {
            /*NSLog(@"Failed to open database!");*/
        }
    }
    return self;
    sqlite3_close(_databaseForGraph);
    /* NSLog(@"dataBaseNotOpen");*/
    
}

- (void)initDatabaseForScores
{
    // Create a string containing the full path to the sqlite.db inside the documents folder
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *databasePath = [documentsDirectory stringByAppendingPathComponent:@"ScoreOfDayOfTheWeek.db"];
    
    // Check to see if the database file already exists
    bool databaseAlreadyExists = [[NSFileManager defaultManager] fileExistsAtPath:databasePath];
    
    // Open the database and store the handle as a data member
    if (sqlite3_open([databasePath UTF8String], &_databaseForGraph) == SQLITE_OK)
    {
        // Create the database if it doesn't yet exists in the file system
        if (!databaseAlreadyExists)
        {
            // Create the WORD table
            const char *sqlStatement =
            "CREATE TABLE IF NOT EXISTS ScoreOfDayOfTheWeek (ID INTEGER PRIMARY KEY, SCORE DOUBLE)";
            char *error;
            if (sqlite3_exec(_databaseForGraph, sqlStatement, NULL, NULL, &error) == SQLITE_OK)
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
-(void)insertScore:(GetAndSetScoreOfDayOfTheWeek *)Score
{
    // Create insert statement for the person
    NSString *insertStatement = [NSString stringWithFormat:@"INSERT INTO ScoreOfDayOfTheWeek (ID, SCORE) VALUES (\"%d\", \"%f\")",
                                 Score.uniqueId, Score.score];
    
    char *error;
    if ( sqlite3_exec(_databaseForGraph, [insertStatement UTF8String], NULL, NULL, &error) == SQLITE_OK)
    {
        /*NSLog(@"Score inserted.");*/
    }
    else
    {
        /*NSLog(@"Error: %s", error);*/
    }
}

-(void)updateScore:(GetAndSetScoreOfDayOfTheWeek *)Score
{
    
    // Create insert statement for the person
    NSString *updateStatement = [NSString stringWithFormat:
                                 @"UPDATE ScoreOfDayOfTheWeek SET SCORE = (\"%f\") WHERE id=%d",
                                 Score.score,  Score.uniqueId];
    
    char *error;
    if ( sqlite3_exec(_databaseForGraph, [updateStatement UTF8String], NULL, NULL, &error) == SQLITE_OK)
    {
        /* NSLog(@"Score updated.");*/
    }
    else
    {
        /* NSLog(@"Error: %s", error);*/
    }
    
}


-(GetAndSetScoreOfDayOfTheWeek *)Scores:(int)uniqueId
{
    GetAndSetScoreOfDayOfTheWeek *retval = nil;
    NSString *query = [NSString stringWithFormat:@"SELECT ID FROM ScoreOfDayOfTheWeek WHERE id=%d", uniqueId];
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(_databaseForGraph, [query UTF8String], -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            int uniqueId = sqlite3_column_int(statement, 0);
            double Scores = sqlite3_column_int(statement, 1);
            
            retval = [[GetAndSetScoreOfDayOfTheWeek alloc] initWithUniqueId:uniqueId andScore:Scores];
            break;
        }
        sqlite3_finalize(statement);
    }
    return retval;
    
}

-(GetAndSetScoreOfDayOfTheWeek *)ScoreData:(int)uniqueId
{
    GetAndSetScoreOfDayOfTheWeek *retval = nil;
    NSString *query = [NSString stringWithFormat:@"SELECT SCORE FROM ScoreOfDayOfTheWeek WHERE id=%d", uniqueId];
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(_databaseForGraph, [query UTF8String], -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            int uniqueId = sqlite3_column_int(statement, 0);
            double Scores = sqlite3_column_int(statement, 1);
            
            retval = [[GetAndSetScoreOfDayOfTheWeek alloc] initWithUniqueId:uniqueId andScore:Scores];
            break;
        }
        sqlite3_finalize(statement);
    }
    return retval;
    
}

- (void)deleteParticularData:(int)uniqueID
{
    NSString *query = [NSString stringWithFormat: @"delete from ScoreOfDayOfTheWeek WHERE ID = %d", uniqueID];
    const char *sqlStatement = [query UTF8String];
    sqlite3_stmt *compiledStatement;
    if(sqlite3_prepare_v2(_databaseForGraph, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
        // Loop through the results and add them to the feeds array
        
        while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
            // Read the data from the result row
            /*NSLog(@"result is here");*/
        }
        
        // Release the compiled statement from memory
        sqlite3_finalize(compiledStatement);
    }
    //sqlite3_close(_databaseForGraph);
}

- (NSArray *)scoreInfos
{
    NSMutableArray *retval = [[NSMutableArray alloc] init];
    NSString *query = @"SELECT ID, SCORE FROM ScoreOfDayOfTheWeek";
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(_databaseForGraph, [query UTF8String], -1, &statement, NULL) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            int uniqueId = sqlite3_column_int(statement, 0);
            double score = sqlite3_column_int(statement, 1);
            
            GetAndSetScoreOfDayOfTheWeek *info = [[GetAndSetScoreOfDayOfTheWeek alloc] initWithUniqueId:uniqueId andScore:score];
            [retval addObject:info];
        }
        sqlite3_finalize(statement);
    }
    return retval;
}


@end
