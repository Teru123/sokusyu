//
//  TestWordsData.h
//  sokusyu-eitango
//
//  Created by Teru on 2014/05/08.
//  Copyright (c) 2014年 Self. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@class TestWords;

@interface TestWordsData : NSObject
{
    sqlite3  *_databaseHandle;
}

-(void)initDatabase;
-(void)insertWord:(NSObject*)Word;
+ (TestWordsData*)database;
- (TestWords *)Words:(int)uniqueId;
- (TestWords *)hatuon:(int)uniqueId;
- (TestWords *)reibun:(int)uniqueId;
- (TestWords *)detail:(int)uniqueId;
- (NSArray *)wordInfo;
- (void)deleteData;
- (void)deleteParticularData:(int)uniqueID;

@end
