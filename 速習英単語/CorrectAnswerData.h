//
//  CorrectAnswerData.h
//  sokusyu-eitango
//
//  Created by Teru on 2014/04/13.
//  Copyright (c) 2014年 Self. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "GetAndSetCorrectAnswerData.h"

@interface CorrectAnswerData : NSObject
{
    sqlite3  *_databaseForAnswers;
}
-(void)initDatabaseForAnswers;
-(void)insertAnswers:(GetAndSetCorrectAnswerData *)Answers;
-(void)updateCorrectAnswers:(GetAndSetCorrectAnswerData *)Answers;
//-(void)updateIncorrectAnswers:(GetAndSetCorrectAnswerData *)Answers;
- (void)deleteParticularData:(int)uniqueID;
-(GetAndSetCorrectAnswerData *)CorrectData:(int)uniqueId;
-(GetAndSetCorrectAnswerData *)InCorrectData:(int)uniqueId;
- (NSArray *)AnswersInfo;

@end
