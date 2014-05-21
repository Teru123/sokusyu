//
//  yosyuCheck.h
//  速習英単語
//
//  Created by Teru on 2013/11/11.
//  Copyright (c) 2013年 Self. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "YosyuID.h"

@interface yosyuCheck : NSObject
{
    sqlite3  *_databaseForYosyu;
}

-(void)initDatabase;
-(void)insertID:(YosyuID *)ID;
-(YosyuID *)ID:(int)uniqueId;
- (NSArray *)yosyuIDs;

@end
