//
//  hukusyuViewController.h
//  TestView
//
//  Created by Teru on 2013/10/03.
//  Copyright (c) 2013年 Self. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWTableViewCell.h"
#import "Reachability.h"

@class HukusyusqtViewController;

@interface hukusyuViewController : UITableViewController
<UITableViewDataSource, UITableViewDelegate, UITabBarDelegate, SWTableViewCellDelegate>
{
     NSMutableArray *patterns;
    Reachability* internetReachable;
    Reachability* hostReachable;
    
    __weak IBOutlet UITableView *tableViewOutlet;
    __weak IBOutlet UITextView *textForExplanation;
    __weak IBOutlet UIView *menu;
}
@property (nonatomic, retain) NSArray *failedWordInfos;
@property (nonatomic, retain) NSArray *failedWord;
@property (nonatomic, retain) NSArray *actionButtonItems;
@property (nonatomic, retain) NSString *checkMenu;

- (IBAction)resetButton:(id)sender;
- (IBAction)refreshButton:(id)sender;

//- (IBAction)shareAction:(id)sender;


@end
