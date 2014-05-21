//
//  yosyuCheck.m
//  速習英単語
//
//  Created by Teru on 2013/11/11.
//  Copyright (c) 2013年 Self. All rights reserved.
//

#import "yosyuCheck.h"

@implementation yosyuCheck

// Method to open a database, the database will be created if it doesn't exist
-(void)initDatabase
{
    // Create a string containing the full path to the sqlite.db inside the documents folder
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *databasePath = [documentsDirectory stringByAppendingPathComponent:@"Yosyu.db"];
    
    // Check to see if the database file already exists
    bool databaseAlreadyExists = [[NSFileManager defaultManager] fileExistsAtPath:databasePath];
    
    // Open the database and store the handle as a data member
    if (sqlite3_open([databasePath UTF8String], &_databaseForYosyu) == SQLITE_OK)
    {
        // Create the database if it doesn't yet exists in the file system
        if (!databaseAlreadyExists)
        {
            // Create the WORD table
            const char *sqlStatement = "CREATE TABLE IF NOT EXISTS YosyuCheck (ID INTEGER PRIMARY KEY)";
            char *error;
            if (sqlite3_exec(_databaseForYosyu, sqlStatement, NULL, NULL, &error) == SQLITE_OK)
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

-(void)insertID:(YosyuID *)ID
{
    // Create insert statement for the person
    NSString *insertStatement = [NSString stringWithFormat:@"INSERT INTO YosyuCheck (ID) VALUES (\"%d\")", ID.uniqueId];
    
    char *error;
    if ( sqlite3_exec(_databaseForYosyu, [insertStatement UTF8String], NULL, NULL, &error) == SQLITE_OK)
    {
       /* NSLog(@"ID inserted.");*/
    }
    else
    {
        /*NSLog(@"Error: %s", error);*/
    }
}

-(YosyuID *)ID:(int)uniqueId
{
    YosyuID *retval = nil;
    NSString *query = [NSString stringWithFormat:@"SELECT ID FROM YosyuCheck WHERE id=%d", uniqueId];
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(_databaseForYosyu, [query UTF8String], -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            int uniqueId = sqlite3_column_int(statement, 0);
            
            retval = [[YosyuID alloc] initWithUniqueId:uniqueId];
            break;
        }
        sqlite3_finalize(statement);
    }
    return retval;
}

- (NSArray *)yosyuIDs
{
    NSMutableArray *retval = [[NSMutableArray alloc] init];
    NSString *query = @"SELECT ID FROM YosyuCheck";
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(_databaseForYosyu, [query UTF8String], -1, &statement, NULL) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            int uniqueId = sqlite3_column_int(statement, 0);
            
            YosyuID *info = [[YosyuID alloc] initWithUniqueId:uniqueId];
            [retval addObject:info];
        }
        sqlite3_finalize(statement);
    }
    return retval;
}

@end
