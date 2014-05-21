//
//  ScoreOfDayOfTheWeek.h
//  sokusyu-eitango
//
//  Created by Teru on 2014/04/08.
//  Copyright (c) 2014年 Self. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@class GetAndSetScoreOfDayOfTheWeek;

@interface ScoreOfDayOfTheWeek : NSObject
{
    sqlite3  *_databaseForGraph;
}
-(void)initDatabaseForScores;
-(void)insertScore:(GetAndSetScoreOfDayOfTheWeek *)Score;
-(void)updateScore:(GetAndSetScoreOfDayOfTheWeek *)Score;
- (void)deleteParticularData:(int)uniqueID;
-(GetAndSetScoreOfDayOfTheWeek *)Scores:(int)uniqueId;
-(GetAndSetScoreOfDayOfTheWeek *)ScoreData:(int)uniqueId;
- (NSArray *)scoreInfos;

@end
