//
//  IchiranWordsData.m
//  TestView
//
//  Created by Teru on 2013/10/09.
//  Copyright (c) 2013年 Self. All rights reserved.
//

#import "IchiranWordsData.h"
#import "IchiranWords.h"
#import "WordData.h"

@implementation IchiranWordsData

- (id)init
{
    self = [super init];
    if (self) {
        if (self) {
            wordName = [[NSMutableArray alloc] init];
            [wordName addObject:[NSString stringWithFormat:@"run"]];
    
            imi = [[NSMutableArray alloc] init];
            [imi addObject:[NSString stringWithFormat:@"〖___ (＋副詞)〗〈人動物が〉走る, 駆ける (!副詞は方向場所の表現) \n He turned to ___ back into the room. \n 彼は背を向けると走って部屋に戻った"]];
    
            for (int i = 0; i < wordName.count; i++) {
                WordData *data = [[WordData alloc] init];
                sqlite3_stmt *statement = NULL;
                IchiranWords *WordsInfo = [[IchiranWords alloc]
                                   initWithUniqueId:sqlite3_column_int(statement, 0)
                                   andWord:[NSString stringWithFormat:@"%@", [wordName objectAtIndex:i]]
                                   andimi:[NSString stringWithFormat:@"%@", [imi objectAtIndex:i]]];
                [data insertWord:WordsInfo];
            }
        }
    
    }
    return self;
}

@end
