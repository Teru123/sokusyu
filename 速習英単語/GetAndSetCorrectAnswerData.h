//
//  GetAndSetCorrectAnswerData.h
//  sokusyu-eitango
//
//  Created by Teru on 2014/04/13.
//  Copyright (c) 2014年 Self. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GetAndSetCorrectAnswerData : NSObject
{
    int _uniqueId;
    double correct;
    double incorrect;
}
@property (nonatomic, assign) int uniqueId;
@property (nonatomic, assign) double correct;
@property (nonatomic, assign) double incorrect;

-(id)initWithUniqueId:(int)uniqueId
             andcorrect:(double)aCorrect
         andincorrect:(double)aIncorrect;
@end
