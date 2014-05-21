//
//  YosyuID.h
//  速習英単語
//
//  Created by Teru on 2013/11/11.
//  Copyright (c) 2013年 Self. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YosyuID : NSObject
{
    int _uniqueId;
}
@property (nonatomic, assign) int uniqueId;

-(id)initWithUniqueId:(int)uniqueId;


@end
