//
//  ScoreData.h
//  TestView
//
//  Created by Teru on 2013/10/06.
//  Copyright (c) 2013年 Self. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@class Score;

@interface ScoreData : NSObject
{
    sqlite3  *_databaseForScores;
}
-(void)initDatabaseForScores;
-(void)insertScore:(Score *)Score;
-(void)updateScore:(Score *)Score;
-(Score *)Scores:(int)uniqueId;
-(Score *)ScoreData:(int)uniqueId;
- (NSArray *)scoreInfos;

@end
