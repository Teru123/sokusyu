//
//  GetAndSetScoreOfDayOfTheWeek.h
//  sokusyu-eitango
//
//  Created by Teru on 2014/04/08.
//  Copyright (c) 2014年 Self. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GetAndSetScoreOfDayOfTheWeek : NSObject
{
    int _uniqueId;
    double score;
}
@property (nonatomic, assign) int uniqueId;
@property (nonatomic, assign) double score;

-(id)initWithUniqueId:(int)uniqueId
             andScore:(double)aScore;

@end
