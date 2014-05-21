//
//  TestWords.h
//  sokusyu-eitango
//
//  Created by Teru on 2014/05/08.
//  Copyright (c) 2014年 Self. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TestWordsData;

@interface TestWords : NSObject
{
    int _uniqueId;
    NSString *word;
    NSString *detail;
    NSString *hatuon;
    NSString *reibun;
}
@property (nonatomic, assign) int uniqueId;
@property (nonatomic, retain) NSString* word;
@property (nonatomic, retain) NSString* detail;
@property (nonatomic, retain) NSString* hatuon;
@property (nonatomic, retain) NSString* reibun;

-(id)initWithUniqueId:(int)uniqueId
              andWord:(NSString*)aWord
            andDetail:(NSString *)aDetail
            andHatuon:(NSString *)aHatuon
            andReibun:(NSString *)aReibun;
-(id)initWithUniqueId:(int)uniqueId
              andWord:(NSString*)aWord;


@end
