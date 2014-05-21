//
//  TestWords.m
//  sokusyu-eitango
//
//  Created by Teru on 2014/05/08.
//  Copyright (c) 2014年 Self. All rights reserved.
//

#import "TestWords.h"
#import "TestWordsData.h"

@implementation TestWords

@synthesize word;
@synthesize detail;
@synthesize hatuon;
@synthesize reibun;
@synthesize uniqueId = _uniqueId;

// Custom initializer
-(id)initWithUniqueId:(int)uniqueId
              andWord:(NSString *)aWord
            andDetail:(NSString *)aDetail
            andHatuon:(NSString *)aHatuon
            andReibun:(NSString *)aReibun
{
    self = [super init];
    if(self) {
        self.uniqueId = uniqueId;
        self.word = aWord;
        self.detail = aDetail;
        self.hatuon = aHatuon;
        self.reibun = aReibun;
    }
    return self;
}
-(id)initWithUniqueId:(int)uniqueId
              andWord:(NSString*)aWord
{
    self = [super init];
    if(self) {
        self.uniqueId = uniqueId;
        self.word = aWord;
    }
    return self;
}

@end
