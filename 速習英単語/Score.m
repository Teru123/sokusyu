//
//  Score.m
//  TestView
//
//  Created by Teru on 2013/10/06.
//  Copyright (c) 2013年 Self. All rights reserved.
//

#import "Score.h"

@implementation Score

@synthesize score;
@synthesize uniqueId = _uniqueId;

-(id)initWithUniqueId:(int)uniqueId
             andScore:(int)aScore
{
    self = [super init];
    if(self) {
        self.uniqueId = uniqueId;
        self.score = aScore;
    }
    return self;
}

@end
