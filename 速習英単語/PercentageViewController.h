//
//  PercentageViewController.h
//  sokusyu-eitango
//
//  Created by Teru on 2014/05/11.
//  Copyright (c) 2014年 Self. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PercentageViewController : UITableViewController <UIActionSheetDelegate>
{
    NSArray *sectionList;
    NSArray *percentageSection;
    NSDictionary *dataSource;
    NSDictionary *dataPercentageSource;
    int percentage1;
    int percentage2;
    int percentage3;
    int percentage4;
    int percentage5;
    int percentage6;
    int percentage7;
    int percentage8;
    int percentage9;
    int percentage10;
    int percentage11;
    int percentage12;
    int percentage13;
    int percentage14;
    int percentage15;
    int percentage16;
    int percentage17;
    int percentage18;
    int percentage19;
    int percentage20;
    int percentage21;
    int percentage22;
    int percentage23;
    int percentage24;
    int percentage25;
    int percentage26;
    int percentage27;
    int percentage28;
    int percentage29;
    int percentage30;
    NSString *percentageString1;
    NSString *percentageString2;
    NSString *percentageString3;
    NSString *percentageString4;
    NSString *percentageString5;
    NSString *percentageString6;
    NSString *percentageString7;
    NSString *percentageString8;
    NSString *percentageString9;
    NSString *percentageString10;
    NSString *percentageString11;
    NSString *percentageString12;
    NSString *percentageString13;
    NSString *percentageString14;
    NSString *percentageString15;
    NSString *percentageString16;
    NSString *percentageString17;
    NSString *percentageString18;
    NSString *percentageString19;
    NSString *percentageString20;
    NSString *percentageString21;
    NSString *percentageString22;
    NSString *percentageString23;
    NSString *percentageString24;
    NSString *percentageString25;
    NSString *percentageString26;
    NSString *percentageString27;
    NSString *percentageString28;
    NSString *percentageString29;
    NSString *percentageString30;
    
    NSArray *correctAnswerList;
    NSArray *percentageList;
}
- (void)drawPercentage;
- (IBAction)shareButton:(id)sender;


@end
