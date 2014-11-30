//
//  sqtViewController.h
//  TestView
//
//  Created by Teru on 2013/10/03.
//  Copyright (c) 2013年 Self. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reachability.h"

@interface sqtViewController : UITableViewController
<UITableViewDataSource, UITableViewDelegate, UITabBarDelegate, UITabBarControllerDelegate>
{
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
    NSArray *testNo;
    NSArray *detail;
    NSArray *listOfScores;
    NSArray *correctAnswerList;
    UITextView *hostingView;
    Reachability* internetReachable;
    Reachability* hostReachable;
    /*
    UITextView *percentageView1;
    UITextView *percentageView2;
    UITextView *percentageView3;
    UITextView *percentageView4;
    UITextView *percentageView5;
    UITextView *percentageView6;
    UITextView *percentageView7;
    UITextView *percentageView8;
    UITextView *percentageView9;
    UITextView *percentageView10;
    UITextView *percentageView11;
    UITextView *percentageView12;
    UITextView *percentageView13;
    UITextView *percentageView14;
    UITextView *percentageView15;
    UITextView *percentageView16;
    UITextView *percentageView17;
    UITextView *percentageView18;
    UITextView *percentageView19;
    UITextView *percentageView20;
    UITextView *percentageView21;
    UITextView *percentageView22;
    UITextView *percentageView23;
    UITextView *percentageView24;
    UITextView *percentageView25;
    UITextView *percentageView26;
    UITextView *percentageView27;
    UITextView *percentageView28;
    UITextView *percentageView29;
    UITextView *percentageView30;
     */
    __weak IBOutlet UITableView *tableViewOutlet;
    __weak IBOutlet UILabel *scoreLabel;
    __weak IBOutlet UILabel *scoreLabel2;
    __weak IBOutlet UILabel *scoreLabel3;
    __weak IBOutlet UILabel *scoreLabel4;
    __weak IBOutlet UILabel *scoreLabel5;
    __weak IBOutlet UILabel *scoreLabel6;
    __weak IBOutlet UILabel *scoreLabel7;
    __weak IBOutlet UILabel *scoreLabel8;
    __weak IBOutlet UILabel *scoreLabel9;
    __weak IBOutlet UILabel *scoreLabel10;
    __weak IBOutlet UILabel *scoreLabel11;
    __weak IBOutlet UILabel *scoreLabel12;
    __weak IBOutlet UILabel *scoreLabel13;
    __weak IBOutlet UILabel *scoreLabel14;
    __weak IBOutlet UILabel *scoreLabel15;
    __weak IBOutlet UILabel *scoreLabel16;
    __weak IBOutlet UILabel *scoreLabel17;
    __weak IBOutlet UILabel *scoreLabel18;
    __weak IBOutlet UILabel *scoreLabel19;
    __weak IBOutlet UILabel *scoreLabel20;
    __weak IBOutlet UILabel *scoreLabel21;
    __weak IBOutlet UILabel *scoreLabel22;
    __weak IBOutlet UILabel *scoreLabel23;
    __weak IBOutlet UILabel *scoreLabel24;
    __weak IBOutlet UILabel *scoreLabel25;
    __weak IBOutlet UILabel *scoreLabel26;
    __weak IBOutlet UILabel *scoreLabel27;
    __weak IBOutlet UILabel *scoreLabel28;
    __weak IBOutlet UILabel *scoreLabel29;
    __weak IBOutlet UILabel *scoreLabel30;
    __weak IBOutlet UIImageView *perfectImage;
    __weak IBOutlet UIImageView *perfectImage2;
    __weak IBOutlet UIImageView *perfectImage3;
    __weak IBOutlet UIImageView *perfectImage4;
    __weak IBOutlet UIImageView *perfectImage5;
    __weak IBOutlet UIImageView *perfectImage6;
    __weak IBOutlet UIImageView *perfectImage7;
    __weak IBOutlet UIImageView *perfectImage8;
    __weak IBOutlet UIImageView *perfectImage9;
    __weak IBOutlet UIImageView *perfectImage10;
    __weak IBOutlet UIImageView *perfectImage11;
    __weak IBOutlet UIImageView *perfectImage12;
    __weak IBOutlet UIImageView *perfectImage13;
    __weak IBOutlet UIImageView *perfectImage14;
    __weak IBOutlet UIImageView *perfectImage15;
    __weak IBOutlet UIImageView *perfectImage16;
    __weak IBOutlet UIImageView *perfectImage17;
    __weak IBOutlet UIImageView *perfectImage18;
    __weak IBOutlet UIImageView *perfectImage19;
    __weak IBOutlet UIImageView *perfectImage20;
    __weak IBOutlet UIImageView *perfectImage21;
    __weak IBOutlet UIImageView *perfectImage22;
    __weak IBOutlet UIImageView *perfectImage23;
    __weak IBOutlet UIImageView *perfectImage24;
    __weak IBOutlet UIImageView *perfectImage25;
    __weak IBOutlet UIImageView *perfectImage26;
    __weak IBOutlet UIImageView *perfectImage27;
    __weak IBOutlet UIImageView *perfectImage28;
    __weak IBOutlet UIImageView *perfectImage29;
    __weak IBOutlet UIImageView *perfectImage30;
    __weak IBOutlet UILabel *detail1;
    __weak IBOutlet UILabel *detail2;
    __weak IBOutlet UILabel *detail3;
    __weak IBOutlet UILabel *detail4;
    __weak IBOutlet UILabel *detail5;
    __weak IBOutlet UILabel *detail6;
    __weak IBOutlet UILabel *detail7;
    __weak IBOutlet UILabel *detail8;
    __weak IBOutlet UILabel *detail9;
    __weak IBOutlet UILabel *detail10;
    __weak IBOutlet UILabel *detail11;
    __weak IBOutlet UILabel *detail12;
    __weak IBOutlet UILabel *detail13;
    __weak IBOutlet UILabel *detail14;
    __weak IBOutlet UILabel *detail15;
    __weak IBOutlet UILabel *detail16;
    __weak IBOutlet UILabel *detail17;
    __weak IBOutlet UILabel *detail18;
    __weak IBOutlet UILabel *detail19;
    __weak IBOutlet UILabel *detail20;
    __weak IBOutlet UILabel *detail21;
    __weak IBOutlet UILabel *detail22;
    __weak IBOutlet UILabel *detail23;
    __weak IBOutlet UILabel *detail24;
    __weak IBOutlet UILabel *detail25;
    __weak IBOutlet UILabel *detail26;
    __weak IBOutlet UILabel *detail27;
    __weak IBOutlet UILabel *detail28;
    __weak IBOutlet UILabel *detail29;
    __weak IBOutlet UILabel *detail30;
    __weak IBOutlet UIView *menu;
    BOOL _isFadeIn;
}
- (IBAction)refreshScore:(id)sender;
- (IBAction)shareAction:(id)sender;
//- (void)drawPercentage;
@property (nonatomic, strong) NSArray *countScoreLabel;
@property (nonatomic, strong) NSArray *countPerfectImage;


@end
