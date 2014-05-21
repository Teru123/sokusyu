//
//  YosyuID.m
//  速習英単語
//
//  Created by Teru on 2013/11/11.
//  Copyright (c) 2013年 Self. All rights reserved.
//

#import "YosyuID.h"

@implementation YosyuID

@synthesize uniqueId = _uniqueId;

-(id)initWithUniqueId:(int)uniqueId
{
    self = [super init];
    if(self) {
        self.uniqueId = uniqueId;
    }
    return self;
}

@end
