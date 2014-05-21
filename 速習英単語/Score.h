//
//  Score.h
//  TestView
//
//  Created by Teru on 2013/10/06.
//  Copyright (c) 2013年 Self. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Score : NSObject
{
    int _uniqueId;
    int score;
}
@property (nonatomic, assign) int uniqueId;
@property (nonatomic, assign) int score;

-(id)initWithUniqueId:(int)uniqueId
             andScore:(int)aScore;

@end
