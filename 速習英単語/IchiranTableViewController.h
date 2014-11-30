//
//  IchiranTableViewController.h
//  TestView
//
//  Created by Teru on 2013/10/09.
//  Copyright (c) 2013年 Self. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IchiranViewController.h"
#import "Reachability.h"
#import <AVFoundation/AVFoundation.h>

@interface IchiranTableViewController : UITableViewController
<UITableViewDataSource, UITableViewDelegate, UITabBarDelegate>
{
    __weak IBOutlet UITableView *tableViewOutlet;
    NSArray *wordNameForSearch;
    NSArray *hatuonForSearch;
    NSArray *imiForSearch;
    NSArray *searchResultsForWord;
    NSArray *searchResultsForImi;
    NSArray *searchResultsForHatuon;
    Reachability* internetReachable;
    Reachability* hostReachable;
}
@property (nonatomic, retain) NSArray *WordInfos;
@property (nonatomic, retain) IchiranViewController *ichiran;


@end
