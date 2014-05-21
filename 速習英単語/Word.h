//
//  Person.h
//  SQLiteTutorial
//
//  Created by Teru on 2013/10/03.
//  Copyright (c) 2013年 Self. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface Word : NSObject
{
    int _uniqueId;
    NSString *word;
}
@property (nonatomic, assign) int uniqueId;
@property (nonatomic, retain) NSString* word;

-(id)initWithUniqueId:(int)uniqueId
              andWord:(NSString*)aWord;

@end