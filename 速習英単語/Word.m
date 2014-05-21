//
//  Person.m
//  SQLiteTutorial
//
//  Created by Teru on 2013/10/03.
//  Copyright (c) 2013年 Self. All rights reserved.
//
#import "Word.h"

@implementation Word

@synthesize word;
@synthesize uniqueId = _uniqueId;

// Custom initializer
-(id)initWithUniqueId:(int)uniqueId andWord:(NSString *)aWord
{
    self = [super init];
    if(self) {
        self.uniqueId = uniqueId;
        self.word = aWord;
    }
    return self;
}

@end