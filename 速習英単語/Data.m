//
//  Data.m
//  TestView
//
//  Created by Teru on 2013/10/03.
//  Copyright (c) 2013年 Self. All rights reserved.
//

#import "Data.h"
#import "Word.h"

@implementation Data

static Data *_database;

+ (Data*)database {
    if (_database == nil) {
        _database = [[Data alloc] init];
    }
    return _database;
}

- (id)init {
    if ((self = [super init])) {
        NSString *sqLiteDb = [[NSBundle mainBundle] pathForResource:@"Word" ofType:@"sqlite3"];
        
        if (sqlite3_open([sqLiteDb UTF8String], &_databaseHandle) != SQLITE_OK) {
            /*NSLog(@"Failed to open database!");*/
        }
    }
    return self;
}


// Method to open a database, the database will be created if it doesn't exist
-(void)initDatabase
{
    // Create a string containing the full path to the sqlite.db inside the documents folder
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *databasePath = [documentsDirectory stringByAppendingPathComponent:@"Word.db"];
    
    // Check to see if the database file already exists
    bool databaseAlreadyExists = [[NSFileManager defaultManager] fileExistsAtPath:databasePath];
    
    // Open the database and store the handle as a data member
    if (sqlite3_open([databasePath UTF8String], &_databaseHandle) == SQLITE_OK)
    {
        // Create the database if it doesn't yet exists in the file system
        if (!databaseAlreadyExists)
        {
            // Create the WORD table
            const char *sqlStatement = "CREATE TABLE IF NOT EXISTS WordList (ID INTEGER PRIMARY KEY, WORD TEXT)";
            char *error;
                if (sqlite3_exec(_databaseHandle, sqlStatement, NULL, NULL, &error) == SQLITE_OK)
                {
                    /*NSLog(@"Database and tables created.");*/
                   
                }
                else
                {
                    /*NSLog(@"Error: %s", error);*/
                }
        }
    }
}

// Method to store a person and his associated address
-(void)insertWord:(Word *)Word
{
    // Create insert statement for the person
    NSString *insertStatement = [NSString stringWithFormat:
                                 @"INSERT INTO WordList (WORD) VALUES (\"%@\")", Word.word];
    
    char *error;
    if ( sqlite3_exec(_databaseHandle, [insertStatement UTF8String], NULL, NULL, &error) == SQLITE_OK)
    {
        /*NSLog(@"Word inserted.");*/
    }
        else
        {
            /*NSLog(@"Error: %s", error);*/
        }
}

- (NSArray *)failedWordInfos {
       
    NSMutableArray *retval = [[NSMutableArray alloc] init];
    NSString *query = @"SELECT ID, WORD FROM WordList";
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(_databaseHandle, [query UTF8String], -1, &statement, NULL) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            int uniqueId = sqlite3_column_int(statement, 0);
            Word *info = [[Word alloc] initWithUniqueId:uniqueId
                                    andWord:[NSString stringWithUTF8String:(char*)sqlite3_column_text(statement, 1)]];
            [retval addObject:info];
        }
        sqlite3_finalize(statement);
   }
    return retval;
    
}

- (Word *)Words:(int)uniqueId {
    Word *retval = nil;
    NSString *query = [NSString stringWithFormat:@"SELECT ID, WORD FROM WordList WHERE id=%d", uniqueId];
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(_databaseHandle, [query UTF8String], -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            int uniqueId = sqlite3_column_int(statement, 0);
            char *wordNameChars = (char *) sqlite3_column_text(statement, 1);
            NSString *word = [[NSString alloc] initWithUTF8String:wordNameChars];
            
            retval = [[Word alloc] initWithUniqueId:uniqueId andWord:word];
            break;
        }
        sqlite3_finalize(statement);
   }
    return retval;
}

- (void)deleteData
{
    NSString *query = @"delete from WordList";
    const char *sqlStatement = [query UTF8String];
    sqlite3_stmt *compiledStatement;
    if(sqlite3_prepare_v2(_databaseHandle, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
        // Loop through the results and add them to the feeds array
        while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
            // Read the data from the result row
            /*NSLog(@"result is here");*/
        }
        
        // Release the compiled statement from memory
        sqlite3_finalize(compiledStatement);
    }
    sqlite3_close(_databaseHandle);
}

- (void)deleteParticularData:(int)uniqueID
{
    NSString *query = [NSString stringWithFormat: @"delete from WordList WHERE ID = %d", uniqueID];
    const char *sqlStatement = [query UTF8String];
    sqlite3_stmt *compiledStatement;
    if(sqlite3_prepare_v2(_databaseHandle, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
        // Loop through the results and add them to the feeds array
        
        while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
            // Read the data from the result row
            /*NSLog(@"result is here");*/
        }
        
        // Release the compiled statement from memory
        sqlite3_finalize(compiledStatement);
    }
    sqlite3_close(_databaseHandle);
}

@end
