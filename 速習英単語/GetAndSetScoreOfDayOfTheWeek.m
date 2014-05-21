//
//  GetAndSetScoreOfDayOfTheWeek.m
//  sokusyu-eitango
//
//  Created by Teru on 2014/04/08.
//  Copyright (c) 2014年 Self. All rights reserved.
//

#import "GetAndSetScoreOfDayOfTheWeek.h"

@implementation GetAndSetScoreOfDayOfTheWeek

@synthesize score;
@synthesize uniqueId = _uniqueId;

-(id)initWithUniqueId:(int)uniqueId
             andScore:(double)aScore
{
    self = [super init];
    if(self) {
        self.uniqueId = uniqueId;
        self.score = aScore;
    }
    return self;
}

@end
