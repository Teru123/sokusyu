//
//  CorrectAnswerData.m
//  sokusyu-eitango
//
//  Created by Teru on 2014/04/13.
//  Copyright (c) 2014年 Self. All rights reserved.
//

#import "CorrectAnswerData.h"
#import "GetAndSetCorrectAnswerData.h"

@implementation CorrectAnswerData

- (id)init
{
    if (self = [super init]) {
        NSString *sqLiteDb = [[NSBundle mainBundle] pathForResource:@"PercentageOfCorrectAnswers" ofType:@"sqlite3"];
        
        if (sqlite3_open([sqLiteDb UTF8String], &_databaseForAnswers) != SQLITE_OK) {
            /*NSLog(@"Failed to open database!");*/
        }
    }
    return self;
    sqlite3_close(_databaseForAnswers);
    /* NSLog(@"dataBaseNotOpen");*/
    
}

- (void)initDatabaseForAnswers
{
    // Create a string containing the full path to the sqlite.db inside the documents folder
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *databasePath = [documentsDirectory stringByAppendingPathComponent:@"PercentageOfCorrectAnswers.db"];
    
    // Check to see if the database file already exists
    bool databaseAlreadyExists = [[NSFileManager defaultManager] fileExistsAtPath:databasePath];
    
    // Open the database and store the handle as a data member
    if (sqlite3_open([databasePath UTF8String], &_databaseForAnswers) == SQLITE_OK)
    {
        // Create the database if it doesn't yet exists in the file system
        if (!databaseAlreadyExists)
        {
            // Create the WORD table
            const char *sqlStatement =
            "CREATE TABLE IF NOT EXISTS PercentageOfCorrectAnswers (ID INTEGER PRIMARY KEY, CORRECT DOUBLE, INCORRECT DOUBLE)";
            char *error;
            if (sqlite3_exec(_databaseForAnswers, sqlStatement, NULL, NULL, &error) == SQLITE_OK)
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
-(void)insertAnswers:(GetAndSetCorrectAnswerData *)Answers
{
    // Create insert statement for the person
    NSString *insertStatement = [NSString stringWithFormat:@"INSERT INTO PercentageOfCorrectAnswers (ID, CORRECT, INCORRECT) VALUES (\"%d\", \"%f\", \"%f\")",
                                 Answers.uniqueId, Answers.correct, Answers.incorrect];
    
    char *error;
    if ( sqlite3_exec(_databaseForAnswers, [insertStatement UTF8String], NULL, NULL, &error) == SQLITE_OK)
    {
        /*NSLog(@"Answers inserted.");*/
    }
    else
    {
        /*NSLog(@"Error: %s", error);*/
    }
}

-(void)updateCorrectAnswers:(GetAndSetCorrectAnswerData *)Answers
{
    
    // Create insert statement for the person
    NSString *updateStatement = [NSString stringWithFormat:
                                 @"UPDATE PercentageOfCorrectAnswers SET CORRECT = (\"%f\"), INCORRECT = (\"%f\") WHERE id=%d",
                                 Answers.correct, Answers.incorrect, Answers.uniqueId];
    
    char *error;
    if ( sqlite3_exec(_databaseForAnswers, [updateStatement UTF8String], NULL, NULL, &error) == SQLITE_OK)
    {
        /* NSLog(@"Answers updated.");*/
    }
    else
    {
        /* NSLog(@"Error: %s", error);*/
    }
    
}
/*
-(void)updateIncorrectAnswers:(GetAndSetCorrectAnswerData *)Answers
{
    
    // Create insert statement for the person
    NSString *updateStatement = [NSString stringWithFormat:
                                 @"UPDATE PercentageOfCorrectAnswers SET INCORRECT = (\"%d\") WHERE id=%d",
                                 Answers.incorrect,  Answers.uniqueId];
    
    char *error;
    if ( sqlite3_exec(_databaseForAnswers, [updateStatement UTF8String], NULL, NULL, &error) == SQLITE_OK)
    {
        NSLog(@"Answers updated.");
    }
    else
    {
        NSLog(@"Error: %s", error);
    }
    
}
*/

-(GetAndSetCorrectAnswerData *)Answers:(int)uniqueId
{
    GetAndSetCorrectAnswerData *retval = nil;
    NSString *query = [NSString stringWithFormat:@"SELECT ID FROM PercentageOfCorrectAnswers WHERE id=%d", uniqueId];
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(_databaseForAnswers, [query UTF8String], -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            int uniqueId = sqlite3_column_int(statement, 0);
            double correct = sqlite3_column_int(statement, 1);
            double inCorrect = sqlite3_column_int(statement, 2);
            
            retval = [[GetAndSetCorrectAnswerData alloc] initWithUniqueId:uniqueId andcorrect:correct andincorrect:inCorrect];
            break;
        }
        sqlite3_finalize(statement);
    }
    return retval;
    
}

-(GetAndSetCorrectAnswerData *)CorrectData:(int)uniqueId
{
    GetAndSetCorrectAnswerData *retval = nil;
    NSString *query = [NSString stringWithFormat:@"SELECT CORRECT FROM PercentageOfCorrectAnswers WHERE id=%d", uniqueId];
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(_databaseForAnswers, [query UTF8String], -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            int uniqueId = sqlite3_column_int(statement, 0);
            double correct = sqlite3_column_int(statement, 1);
            double inCorrect = sqlite3_column_int(statement, 2);
            
            retval = [[GetAndSetCorrectAnswerData alloc] initWithUniqueId:uniqueId andcorrect:correct andincorrect:inCorrect];
            break;
        }
        sqlite3_finalize(statement);
    }
    return retval;
    
}

-(GetAndSetCorrectAnswerData *)InCorrectData:(int)uniqueId
{
    GetAndSetCorrectAnswerData *retval = nil;
    NSString *query = [NSString stringWithFormat:@"SELECT INCORRECT FROM PercentageOfCorrectAnswers WHERE id=%d", uniqueId];
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(_databaseForAnswers, [query UTF8String], -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            int uniqueId = sqlite3_column_int(statement, 0);
            double correct = sqlite3_column_int(statement, 1);
            double inCorrect = sqlite3_column_int(statement, 2);
            
            retval = [[GetAndSetCorrectAnswerData alloc] initWithUniqueId:uniqueId andcorrect:correct andincorrect:inCorrect];
            break;
        }
        sqlite3_finalize(statement);
    }
    return retval;
    
}

- (void)deleteParticularData:(int)uniqueID
{
    NSString *query = [NSString stringWithFormat: @"delete from PercentageOfCorrectAnswers WHERE ID = %d", uniqueID];
    const char *sqlStatement = [query UTF8String];
    sqlite3_stmt *compiledStatement;
    if(sqlite3_prepare_v2(_databaseForAnswers, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
        // Loop through the results and add them to the feeds array
        
        while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
            // Read the data from the result row
            /*NSLog(@"result is here");*/
        }
        
        // Release the compiled statement from memory
        sqlite3_finalize(compiledStatement);
    }
    //sqlite3_close(_databaseForAnswers);
}

- (NSArray *)AnswersInfo
{
    NSMutableArray *retval = [[NSMutableArray alloc] init];
    NSString *query = @"SELECT ID, CORRECT, INCORRECT FROM PercentageOfCorrectAnswers";
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(_databaseForAnswers, [query UTF8String], -1, &statement, NULL) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            int uniqueId = sqlite3_column_int(statement, 0);
            double correct = sqlite3_column_int(statement, 1);
            double inCorrect = sqlite3_column_int(statement, 2);
            
            GetAndSetCorrectAnswerData *info = [[GetAndSetCorrectAnswerData alloc] initWithUniqueId:uniqueId andcorrect:correct andincorrect:inCorrect];
            [retval addObject:info];
        }
        sqlite3_finalize(statement);
    }
    return retval;
}

@end
