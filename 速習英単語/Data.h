//
//  Data.h
//  TestView
//
//  Created by Teru on 2013/10/03.
//  Copyright (c) 2013年 Self. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@class Word;

@interface Data : NSObject
{
    sqlite3  *_databaseHandle;
}

-(void)initDatabase;
-(void)insertWord:(NSObject*)Word;
+ (Data*)database;
- (Word *)Words:(int)uniqueId;
- (NSArray *)failedWordInfos;
- (void)deleteData;
- (void)deleteParticularData:(int)uniqueID;

@end
