//
//  GetAndSetCorrectAnswerData.m
//  sokusyu-eitango
//
//  Created by Teru on 2014/04/13.
//  Copyright (c) 2014年 Self. All rights reserved.
//

#import "GetAndSetCorrectAnswerData.h"

@implementation GetAndSetCorrectAnswerData
@synthesize correct;
@synthesize uniqueId = _uniqueId;
@synthesize incorrect;

-(id)initWithUniqueId:(int)uniqueId
           andcorrect:(double)aCorrect
         andincorrect:(double)aIncorrect
{
    self = [super init];
    if(self) {
        self.uniqueId = uniqueId;
        self.correct = aCorrect;
        self.incorrect = aIncorrect;
    }
    return self;
}

@end
