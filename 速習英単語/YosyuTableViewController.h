//
//  YosyuTableViewController.h
//  速習英単語
//
//  Created by Teru on 2013/10/16.
//  Copyright (c) 2013年 Self. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>
#import "Reachability.h"

@interface YosyuTableViewController : UITableViewController<UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *listOfWords;
    NSArray *wordNameForDetail;
    NSArray *testNo;
    NSArray *detail;
    NSArray *listOfScores;
    Reachability *internetReachableFoo;
    
    //NSArray *scoreListOfDayOfTheWeek;
    //double allScore;
    //CPTGraphHostingView *hostingView;
    __weak IBOutlet UITableView *tableViewOutlet;
    __weak IBOutlet UILabel *yosyuDetail1;
    __weak IBOutlet UILabel *yosyuDetail2;
    __weak IBOutlet UILabel *yosyuDetail3;
    __weak IBOutlet UILabel *yosyuDetail4;
    __weak IBOutlet UILabel *yosyuDetail5;
    __weak IBOutlet UILabel *yosyuDetail6;
    __weak IBOutlet UILabel *yosyuDetail7;
    __weak IBOutlet UILabel *yosyuDetail8;
    __weak IBOutlet UILabel *yosyuDetail9;
    __weak IBOutlet UILabel *yosyuDetail10;
    __weak IBOutlet UILabel *yosyuDetail11;
    __weak IBOutlet UILabel *yosyuDetail12;
    __weak IBOutlet UILabel *yosyuDetail13;
    __weak IBOutlet UILabel *yosyuDetail14;
    __weak IBOutlet UILabel *yosyuDetail15;
    __weak IBOutlet UILabel *yosyuDetail16;
    __weak IBOutlet UILabel *yosyuDetail17;
    __weak IBOutlet UILabel *yosyuDetail18;
    __weak IBOutlet UILabel *yosyuDetail19;
    __weak IBOutlet UILabel *yosyuDetail20;
    __weak IBOutlet UILabel *yosyuDetail21;
    __weak IBOutlet UILabel *yosyuDetail22;
    __weak IBOutlet UILabel *yosyuDetail23;
    __weak IBOutlet UILabel *yosyuDetail24;
    __weak IBOutlet UILabel *yosyuDetail25;
    __weak IBOutlet UILabel *yosyuDetail26;
    __weak IBOutlet UILabel *yosyuDetail27;
    __weak IBOutlet UILabel *yosyuDetail28;
    __weak IBOutlet UILabel *yosyuDetail29;
    __weak IBOutlet UILabel *yosyuDetail30;
    __weak IBOutlet UIImageView *star1;
    __weak IBOutlet UIImageView *star2;
    __weak IBOutlet UIImageView *star3;
    __weak IBOutlet UIImageView *star4;
    __weak IBOutlet UIImageView *star5;
    __weak IBOutlet UIImageView *star6;
    __weak IBOutlet UIImageView *star7;
    __weak IBOutlet UIImageView *star8;
    __weak IBOutlet UIImageView *star9;
    __weak IBOutlet UIImageView *star10;
    __weak IBOutlet UIImageView *star11;
    __weak IBOutlet UIImageView *star12;
    __weak IBOutlet UIImageView *star13;
    __weak IBOutlet UIImageView *star14;
    __weak IBOutlet UIImageView *star15;
    __weak IBOutlet UIImageView *star16;
    __weak IBOutlet UIImageView *star17;
    __weak IBOutlet UIImageView *star18;
    __weak IBOutlet UIImageView *star19;
    __weak IBOutlet UIImageView *star20;
    __weak IBOutlet UIImageView *star21;
    __weak IBOutlet UIImageView *star22;
    __weak IBOutlet UIImageView *star23;
    __weak IBOutlet UIImageView *star24;
    __weak IBOutlet UIImageView *star25;
    __weak IBOutlet UIImageView *star26;
    __weak IBOutlet UIImageView *star27;
    __weak IBOutlet UIImageView *star28;
    __weak IBOutlet UIImageView *star29;
    __weak IBOutlet UIImageView *star30;
    /*
    __weak IBOutlet UIView *menu;
    BOOL _isFadeIn;
    
    @private
    // グラフ表示領域（この領域に円グラフを追加する）
    CPTGraph *graph;
    NSArray *plotData;
     */
}
@property (nonatomic, strong) NSArray *stars;
@property (nonatomic, strong) NSArray *detail30;
//- (IBAction)shareAction:(id)sender;
- (IBAction)refreshButton:(id)sender;
/*
- (void)twitterButton:(UIButton *)sender;
- (void)facebookButton:(UIButton *)sender;
- (void)lineButton:(UIButton *)sender;
- (void) toggleMenu;
- (void) showMenu;
- (void) hideMenu;
- (void) drawGraph;

// 円グラフで表示するデータを保持する配列
@property (readwrite, nonatomic) NSMutableArray *scatterPlotData;
*/
 
@end
