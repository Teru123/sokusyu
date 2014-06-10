//
//  YosyuTableViewController.m
//  速習英単語
//
//  Created by Teru on 2013/10/16.
//  Copyright (c) 2013年 Self. All rights reserved.
//

#import "YosyuTableViewController.h"
#import "YosyusqtViewController.h"
#import "YosyuFourViewController.h"
#import "YosyuCheck.h"
//#import "Score.h"
//#import "ScoreData.h"
//#import "ScoreOfDayOfTheWeek.h"
//#import "GetAndSetScoreOfDayOfTheWeek.h"
#import "TestWordsData.h"
#import "TestWords.h"
#import "UITableView+Wave.h"
#import <Social/Social.h>

// 折れ線グラフの識別子
//NSString *const kData   = @"Data Source Plot";

@interface YosyuTableViewController ()

@end

@implementation YosyuTableViewController

@synthesize stars, detail30;
CAShapeLayer *openMenuShape;
#define Rgb2UIColor(r, g, b)  [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0]

/*
// Checks if we have an internet connection or not
- (void)testInternetConnection
{
    internetReachableFoo = [Reachability reachabilityWithHostname:@"www.google.com"];
    
    __weak YosyuTableViewController *yosyuView = self;
    
    UIAlertView *wifiAlert = [[UIAlertView alloc] initWithTitle:@"インターネット未接続"
                                                        message:@"ネット接続時にご利用可能です。\nホームボタンを2回押下してからアプリを完全に終了して下さい。"
                                                       delegate:self
                                              cancelButtonTitle:nil
                                              otherButtonTitles:nil];
    wifiAlert.delegate       = self;
    
    __weak UITabBarController *hiddenTab = self.tabBarController;

    // Internet is reachable
    internetReachableFoo.reachableBlock = ^(Reachability*reach)
    {
        // Update the UI on the main thread
        dispatch_async(dispatch_get_main_queue(), ^{
            //NSLog(@"Yayyy, we have the interwebs!");
        });
    };
    
    // Internet is not reachable
    internetReachableFoo.unreachableBlock = ^(Reachability*reach)
    {
        
        // Update the UI on the main thread
        dispatch_async(dispatch_get_main_queue(), ^{
            //NSLog(@"Someone broke the internet :(");
            [wifiAlert show];
            yosyuView.view.hidden = YES;
            [yosyuView hideTabBar:hiddenTab];
        });
    };
    
    [internetReachableFoo startNotifier];
}
 

// Method implementations
- (void)hideTabBar:(UITabBarController *) tabbarcontroller
{
    [UIView beginAnimations:nil context:NULL];
    //[UIView setAnimationDuration:0];
    
    for(UIView *view in tabbarcontroller.view.subviews)
    {
        if([view isKindOfClass:[UITabBar class]])
        {
            [view setFrame:CGRectMake(0, 800, view.frame.size.width, view.frame.size.height)];
        }
        else
        {
            [view setFrame:CGRectMake(0, 800, view.frame.size.width, view.frame.size.height)];
        }
    }
    
    [UIView commitAnimations];
}
 */

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //[self testInternetConnection];
    
    NSNumber *toCount = [[NSNumber alloc] initWithInt:0];

    wordNameForDetail = [NSArray arrayWithObjects:
                         @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"11", @"12", @"13",
                         @"14", @"15", @"16", @"17", @"18", @"19", @"20", @"21", @"22", @"23", @"24", @"25",
                         @"26", @"27", @"28", @"29", @"30", nil];

    detail = [NSArray arrayWithObjects:toCount,
              @"afraid - well", @"adventure - worse", @"alien - view", @"appropriate - village", @"aware - wild",
              @"advantage - wise", @"allow - therefore", @"accept - theory", @"against - wave", @"benefit - trouble",
              @"anymore - wake", @"alone - thin", @"blood - whole", @"coach - technology", @"across - yet",
              @"academy - wealth", @"appreciate - whether", @"argue - treat", @"alive - wood", @"achieve - worth",
              @"appear - various", @"actual - thief", @"advance - web", @"block - unite", @"associate - wide",
              @"advice - suggest", @"actually - value", @"band - within", @"advertise - vote", @"above - surface", nil];
    
    yosyuCheck *check = [[yosyuCheck alloc] init];
    [check initDatabase];
    
    stars = [[NSArray alloc] initWithObjects:toCount, star1, star2, star3, star4, star5, star6, star7, star8, star9, star10, star11, star12, star13, star14, star15, star16, star17, star18, star19, star20, star21, star22, star23, star24, star25, star26, star27, star28, star29, star30, nil];
    
    for (int i = 1; i <= 30 ; i++) {
        if ([check ID:i]) {
            UIImageView *newStarImage = [stars objectAtIndex:i];
            [newStarImage setHidden:NO];
        }
    }
    
    detail30 = [[NSArray alloc] initWithObjects:toCount, yosyuDetail1, yosyuDetail2, yosyuDetail3, yosyuDetail4, yosyuDetail5, yosyuDetail6, yosyuDetail7, yosyuDetail8, yosyuDetail9, yosyuDetail10, yosyuDetail11, yosyuDetail12, yosyuDetail13, yosyuDetail14, yosyuDetail15, yosyuDetail16, yosyuDetail17, yosyuDetail18, yosyuDetail19, yosyuDetail20, yosyuDetail21, yosyuDetail22, yosyuDetail23, yosyuDetail24, yosyuDetail25, yosyuDetail26, yosyuDetail27, yosyuDetail28, yosyuDetail29, yosyuDetail30, nil];
    
    for (int p = 1; p <= 30; p++) {
        UILabel *newDetail = [detail30 objectAtIndex:p];
        newDetail.text = [NSString stringWithFormat:@"%@", [detail objectAtIndex:p]];
    }
    
    [tableViewOutlet reloadData];
    
    // Create datacontroller and initialize database
    TestWordsData *testWordDataController = [[TestWordsData alloc]init];
    [testWordDataController initDatabase];
    [testWordDataController deleteData];
    
    [self.tableView reloadDataAnimateWithWave:RightToLeftWaveAnimation];
    
    /*
    //share, graph メニュー生成
    menu.frame = CGRectMake(0, 0, 320, 380);
    
    CGColorRef coloRef = [[UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:0.5] CGColor];
    
    UIButton *reviewButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 280, 320, 50)];
    reviewButton.backgroundColor = Rgb2UIColor(16, 131, 247);
    [reviewButton addTarget:self action:@selector(reviewButton:) forControlEvents:UIControlEventTouchUpInside];
    [reviewButton setTitle:@"レビューを書く" forState:UIControlStateNormal];
    reviewButton.titleLabel.font = [UIFont fontWithName:@"American Typewriter" size:20];
    reviewButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    reviewButton.titleLabel.textColor = [UIColor whiteColor];
    //UIImageView *reviewImage = [[UIImageView alloc] initWithFrame:CGRectMake(76, 8, 31, 31)];
    //reviewImage.image = [UIImage imageNamed:@"social-apple-white.png"];
    //[reviewButton addSubview:reviewImage];
    reviewButton.layer.borderWidth = 1.5f;
    reviewButton.layer.borderColor = coloRef;
    
    UIButton *lineButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 330, 120, 50)];
    lineButton.backgroundColor = Rgb2UIColor(90, 230, 40);
    [lineButton addTarget:self action:@selector(lineButton:) forControlEvents:UIControlEventTouchUpInside];
    UIImageView *lineImage = [[UIImageView alloc] initWithFrame:CGRectMake(16, 15, 88, 20)];
    lineImage.image = [UIImage imageNamed:@"linebutton_88x20.png"];
    [lineButton addSubview:lineImage];
    lineButton.layer.borderWidth = 1.5f;
    lineButton.layer.borderColor = coloRef;
    
    UIButton *twitterButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 330, 100, 50)];
    twitterButton.backgroundColor = Rgb2UIColor(85, 172, 238);
    [twitterButton addTarget:self action:@selector(twitterButton:) forControlEvents:UIControlEventTouchUpInside];
    UIImageView *twitterImage = [[UIImageView alloc] initWithFrame:CGRectMake(36, 13, 27, 23)];
    twitterImage.image = [UIImage imageNamed:@"Twitter_logo_white.png"];
    [twitterButton addSubview:twitterImage];
    //[twitterButton setTitle:@"Twitter" forState:UIControlStateNormal];
    //twitterButton.titleLabel.font = [UIFont fontWithName:@"Bradley Hand" size:20];
    //twitterButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    twitterButton.titleLabel.textColor = [UIColor whiteColor];
    twitterButton.layer.borderWidth = 1.5f;
    twitterButton.layer.borderColor = coloRef;
    
    UIButton *facebookButton = [[UIButton alloc] initWithFrame:CGRectMake(220, 330, 100, 50)];
    facebookButton.backgroundColor = Rgb2UIColor(59, 89, 152);
    [facebookButton addTarget:self action:@selector(facebookButton:) forControlEvents:UIControlEventTouchUpInside];
    UIImageView *facebookImage = [[UIImageView alloc] initWithFrame:CGRectMake(36, 12, 27, 27)];
    facebookImage.image = [UIImage imageNamed:@"FB-Logo-white.png"];
    [facebookButton addSubview:facebookImage];
    //[facebookButton setTitle:@"Facebook" forState:UIControlStateNormal];
    //facebookButton.titleLabel.font = [UIFont fontWithName:@"Bradley Hand" size:20];
    //facebookButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    //facebookButton.titleLabel.textColor = [UIColor whiteColor];
    facebookButton.layer.borderWidth = 1.5f;
    facebookButton.layer.borderColor = coloRef;
     */
    
    /*
    UILabel *description = [[UILabel alloc] initWithFrame:CGRectMake(0, 380, 320, 50)];
    description.backgroundColor = Rgb2UIColor(147, 199, 251);
    description.text = [NSString stringWithFormat:@"右上のボタンタップでこのメニューを閉じます"];
    description.textAlignment = NSTextAlignmentCenter;
    description.font = [UIFont fontWithName:@"American Typewriter" size:7];
    description.textColor = [UIColor whiteColor];
    UIFont *boldFont = [UIFont boldSystemFontOfSize:[UIFont systemFontSize]];
    description.font = boldFont;
    description.layer.borderWidth = 1.5f;
    description.layer.borderColor = coloRef;
    */
    
    /*
     twitterButton.layer.cornerRadius = 80.0f;
     facebookButton.layer.cornerRadius = 7.5f;
     reviewButton.layer.cornerRadius = 38.0f;
     */
    
    //[menu addSubview:lineButton];
    //[menu addSubview:twitterButton];
    //[menu addSubview:facebookButton];
    //[menu addSubview:reviewButton];
    //[menu addSubview:description];
    
    /*
    //曜日取得 Sun = 1 Mon = 2
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *comps = [gregorian components:NSWeekdayCalendarUnit fromDate:[NSDate date]];
    int weekday = [comps weekday];
    //NSLog(@"%d", weekday);
    
    // グラフに表示するデータを生成
    // X軸とY軸の両方を設定する必要がある。キーを設定し、次のようなデータ構造になっている
    // [{ x = 0; y = 0; }, { x = 1; y = 1; }, { x = 2; y = 7; },
    // { x = 3; y = 4; }, { x = 4; y = 5; }, { x = 5; y = 2; },
    // { x = 6; y = 0; }, { x = 7; y = 6; }, { x = 8; y = 6; },
    // { x = 9; y = 9; }, { x = 10: y = 3 }]
    self.scatterPlotData = [NSMutableArray array];
    
    //Score 総計
    ScoreData *dataController = [[ScoreData alloc]init];
    [dataController initDatabaseForScores];
    
    NSArray* allOfScore = [dataController scoreInfos];
    listOfScores = allOfScore;
    
    for (int i = 0; i < [listOfScores count]; i++) {
        
        Score *info = [listOfScores objectAtIndex:i];
        
        for (int p = 1; p <= 30; p++) {
            if ([dataController ScoreData:p] && info.uniqueId == p) {
                int eachScore = info.score;
                allScore += eachScore;
            }
        }
    }
    //NSLog(@"%f", allScore);
    
    ScoreOfDayOfTheWeek *scoreDataController = [[ScoreOfDayOfTheWeek alloc] init];
    [scoreDataController initDatabaseForScores];
    NSArray* score = [scoreDataController scoreInfos];
    scoreListOfDayOfTheWeek = score;
    
    //曜日毎にScore保存
    //始点のデータが無い場合の処理
    if (0 < weekday && ![scoreDataController Scores:0]){
        //前日までの曜日に0を格納
        for (int i = 0; i < weekday; i++ ) {
            GetAndSetScoreOfDayOfTheWeek *ScoreOfDayOfTheWeek  =
            [[GetAndSetScoreOfDayOfTheWeek alloc] initWithUniqueId:i andScore:0];
            // Insert the score
            [scoreDataController insertScore:ScoreOfDayOfTheWeek];
        }
        //今日の曜日のデータが無ければ格納
        if (![scoreDataController Scores:weekday]) {
            GetAndSetScoreOfDayOfTheWeek *ScoreOfDayOfTheWeek  =
            [[GetAndSetScoreOfDayOfTheWeek alloc] initWithUniqueId:weekday andScore:allScore];
            // Insert the score
            [scoreDataController insertScore:ScoreOfDayOfTheWeek];
        }
    //始点のデータがある場合の処理
    }else if (0 < weekday && [scoreDataController Scores:0]){
        //今日の曜日にスコア格納
        if (![scoreDataController Scores:weekday]) {
            GetAndSetScoreOfDayOfTheWeek *ScoreOfDayOfTheWeek  =
            [[GetAndSetScoreOfDayOfTheWeek alloc] initWithUniqueId:weekday andScore:allScore];
            // Insert the score
            [scoreDataController insertScore:ScoreOfDayOfTheWeek];
        }
        
        if (weekday == 1) {
            
            for (int i = 2; i < 8; i++) {
                if ([scoreDataController Scores:i]) {
                    [scoreDataController deleteParticularData:i];
                }
            }
        }else if (weekday == 2){
            for (int r = 3; r < 8; r++) {
                //nslog(@"5to7!");
                if ([scoreDataController Scores:r]) {
                    GetAndSetScoreOfDayOfTheWeek *scoreOfDay7 = [scoreListOfDayOfTheWeek objectAtIndex:r];
                    for (int a = 1; a < scoreListOfDayOfTheWeek.count; a++) {
                        GetAndSetScoreOfDayOfTheWeek *ScoreOfDayOfTheWeek  =
                        [[GetAndSetScoreOfDayOfTheWeek alloc] initWithUniqueId:a andScore:scoreOfDay7.score];
                        if ([scoreDataController Scores:a]) {
                            //nslog(@"Update!");
                            [scoreDataController updateScore:ScoreOfDayOfTheWeek];
                        }else if (![scoreDataController Scores:a]){
                            // Insert the score
                            [scoreDataController insertScore:ScoreOfDayOfTheWeek];
                            //nslog(@"Insert!");
                        }
                        //nslog(@"%d, %f", a, scoreOfDay7.score);
                    }
                }
            }
            for (int q = 3; q < 8; q++) {
                if ([scoreDataController Scores:q]) {
                    [scoreDataController deleteParticularData:q];
                    //nslog(@"Delete!");
                }
            }
            for (int i = 1; i < 2; i++) {
                //今日の曜日までに不足しているデータがあるかチェック
                if (![scoreDataController Scores:i]) {
                    //直近のデータを格納
                    //nslog(@"i%d", i);
                    for (int p = 1; p < scoreListOfDayOfTheWeek.count; p++) {
                        if ([scoreDataController Scores:p]) {
                            GetAndSetScoreOfDayOfTheWeek *recentScore = [scoreListOfDayOfTheWeek objectAtIndex:p];
                            GetAndSetScoreOfDayOfTheWeek *ScoreOfDayOfTheWeek  =
                            [[GetAndSetScoreOfDayOfTheWeek alloc] initWithUniqueId:i andScore:recentScore.score];
                            if ([scoreDataController Scores:i]) {
                                //nslog(@"Update!");
                                [scoreDataController updateScore:ScoreOfDayOfTheWeek];
                            }else if (![scoreDataController Scores:i]){
                                // Insert the score
                                [scoreDataController insertScore:ScoreOfDayOfTheWeek];
                                //nslog(@"Insert!");
                            }
                            //nslog(@"%d, %f", p, recentScore.score);
                        }
                    }
                }
            }
        }else if (weekday == 3){
            for (int r = 4; r < 8; r++) {
                //nslog(@"5to7!");
                if ([scoreDataController Scores:r]) {
                    GetAndSetScoreOfDayOfTheWeek *scoreOfDay7 = [scoreListOfDayOfTheWeek objectAtIndex:r];
                    for (int a = 1; a < scoreListOfDayOfTheWeek.count; a++) {
                        GetAndSetScoreOfDayOfTheWeek *ScoreOfDayOfTheWeek  =
                        [[GetAndSetScoreOfDayOfTheWeek alloc] initWithUniqueId:a andScore:scoreOfDay7.score];
                        if ([scoreDataController Scores:a]) {
                            //nslog(@"Update!");
                            [scoreDataController updateScore:ScoreOfDayOfTheWeek];
                        }else if (![scoreDataController Scores:a]){
                            // Insert the score
                            [scoreDataController insertScore:ScoreOfDayOfTheWeek];
                            //nslog(@"Insert!");
                        }
                        //nslog(@"%d, %f", a, scoreOfDay7.score);
                    }
                }
            }
            for (int q = 4; q < 8; q++) {
                if ([scoreDataController Scores:q]) {
                    [scoreDataController deleteParticularData:q];
                    //nslog(@"Delete!");
                }
            }
            for (int i = 1; i < 3; i++) {
                //今日の曜日までに不足しているデータがあるかチェック
                if (![scoreDataController Scores:i]) {
                    //直近のデータを格納
                    //nslog(@"i%d", i);
                    for (int p = 1; p < scoreListOfDayOfTheWeek.count; p++) {
                        if ([scoreDataController Scores:p]) {
                            GetAndSetScoreOfDayOfTheWeek *recentScore = [scoreListOfDayOfTheWeek objectAtIndex:p];
                            GetAndSetScoreOfDayOfTheWeek *ScoreOfDayOfTheWeek  =
                            [[GetAndSetScoreOfDayOfTheWeek alloc] initWithUniqueId:i andScore:recentScore.score];
                            if ([scoreDataController Scores:i]) {
                                //nslog(@"Update!");
                                [scoreDataController updateScore:ScoreOfDayOfTheWeek];
                            }else if (![scoreDataController Scores:i]){
                                // Insert the score
                                [scoreDataController insertScore:ScoreOfDayOfTheWeek];
                                //nslog(@"Insert!");
                            }
                            //nslog(@"%d, %f", p, recentScore.score);
                        }
                    }
                }
            }
        }else if (weekday == 4){
            for (int r = 5; r < 8; r++) {
                //nslog(@"5to7!");
                if ([scoreDataController Scores:r]) {
                    GetAndSetScoreOfDayOfTheWeek *scoreOfDay7 = [scoreListOfDayOfTheWeek objectAtIndex:r];
                    for (int a = 1; a < scoreListOfDayOfTheWeek.count; a++) {
                        GetAndSetScoreOfDayOfTheWeek *ScoreOfDayOfTheWeek  =
                        [[GetAndSetScoreOfDayOfTheWeek alloc] initWithUniqueId:a andScore:scoreOfDay7.score];
                        if ([scoreDataController Scores:a]) {
                            //nslog(@"Update!");
                            [scoreDataController updateScore:ScoreOfDayOfTheWeek];
                        }else if (![scoreDataController Scores:a]){
                            // Insert the score
                            [scoreDataController insertScore:ScoreOfDayOfTheWeek];
                            //nslog(@"Insert!");
                        }
                        //nslog(@"%d, %f", a, scoreOfDay7.score);
                    }
                }
            }
            for (int q = 5; q < 8; q++) {
                if ([scoreDataController Scores:q]) {
                    [scoreDataController deleteParticularData:q];
                    //nslog(@"Delete!");
                }
            }
            for (int i = 1; i < 4; i++) {
                //今日の曜日までに不足しているデータがあるかチェック
                if (![scoreDataController Scores:i]) {
                    //直近のデータを格納
                    //nslog(@"i%d", i);
                    for (int p = 1; p < scoreListOfDayOfTheWeek.count; p++) {
                        if ([scoreDataController Scores:p]) {
                            GetAndSetScoreOfDayOfTheWeek *recentScore = [scoreListOfDayOfTheWeek objectAtIndex:p];
                            GetAndSetScoreOfDayOfTheWeek *ScoreOfDayOfTheWeek  =
                            [[GetAndSetScoreOfDayOfTheWeek alloc] initWithUniqueId:i andScore:recentScore.score];
                            if ([scoreDataController Scores:i]) {
                                //nslog(@"Update!");
                                [scoreDataController updateScore:ScoreOfDayOfTheWeek];
                            }else if (![scoreDataController Scores:i]){
                                // Insert the score
                                [scoreDataController insertScore:ScoreOfDayOfTheWeek];
                                //nslog(@"Insert!");
                            }
                            //nslog(@"%d, %f", p, recentScore.score);
                        }
                    }
                }
            }
        }else if (weekday == 5){
            for (int r = 6; r < 8; r++) {
                //nslog(@"5to7!");
                if ([scoreDataController Scores:r]) {
                    GetAndSetScoreOfDayOfTheWeek *scoreOfDay7 = [scoreListOfDayOfTheWeek objectAtIndex:r];
                    for (int a = 1; a < scoreListOfDayOfTheWeek.count; a++) {
                        GetAndSetScoreOfDayOfTheWeek *ScoreOfDayOfTheWeek  =
                        [[GetAndSetScoreOfDayOfTheWeek alloc] initWithUniqueId:a andScore:scoreOfDay7.score];
                        if ([scoreDataController Scores:a]) {
                            //nslog(@"Update!");
                            [scoreDataController updateScore:ScoreOfDayOfTheWeek];
                        }else if (![scoreDataController Scores:a]){
                            // Insert the score
                            [scoreDataController insertScore:ScoreOfDayOfTheWeek];
                            //nslog(@"Insert!");
                        }
                        //nslog(@"%d, %f", a, scoreOfDay7.score);
                    }
                }
            }
            for (int q = 6; q < 8; q++) {
                if ([scoreDataController Scores:q]) {
                    [scoreDataController deleteParticularData:q];
                    //nslog(@"Delete!");
                }
            }
            for (int i = 1; i < 5; i++) {
                //今日の曜日までに不足しているデータがあるかチェック
                if (![scoreDataController Scores:i]) {
                    //直近のデータを格納
                    //nslog(@"i%d", i);
                    for (int p = 1; p < scoreListOfDayOfTheWeek.count; p++) {
                        if ([scoreDataController Scores:p]) {
                            GetAndSetScoreOfDayOfTheWeek *recentScore = [scoreListOfDayOfTheWeek objectAtIndex:p];
                            GetAndSetScoreOfDayOfTheWeek *ScoreOfDayOfTheWeek  =
                            [[GetAndSetScoreOfDayOfTheWeek alloc] initWithUniqueId:i andScore:recentScore.score];
                            if ([scoreDataController Scores:i]) {
                                //nslog(@"Update!");
                                [scoreDataController updateScore:ScoreOfDayOfTheWeek];
                            }else if (![scoreDataController Scores:i]){
                                // Insert the score
                                [scoreDataController insertScore:ScoreOfDayOfTheWeek];
                                //nslog(@"Insert!");
                            }
                            //nslog(@"%d, %f", p, recentScore.score);
                        }
                    }
                }
            }
        }else if (weekday == 6){
            for (int r = 7; r < 8; r++) {
                //nslog(@"5to7!");
                if ([scoreDataController Scores:r]) {
                    GetAndSetScoreOfDayOfTheWeek *scoreOfDay7 = [scoreListOfDayOfTheWeek objectAtIndex:r];
                    for (int a = 1; a < scoreListOfDayOfTheWeek.count; a++) {
                        GetAndSetScoreOfDayOfTheWeek *ScoreOfDayOfTheWeek  =
                        [[GetAndSetScoreOfDayOfTheWeek alloc] initWithUniqueId:a andScore:scoreOfDay7.score];
                        if ([scoreDataController Scores:a]) {
                            //nslog(@"Update!");
                            [scoreDataController updateScore:ScoreOfDayOfTheWeek];
                        }else if (![scoreDataController Scores:a]){
                            // Insert the score
                            [scoreDataController insertScore:ScoreOfDayOfTheWeek];
                            //nslog(@"Insert!");
                        }
                        //nslog(@"%d, %f", a, scoreOfDay7.score);
                    }
                }
            }
            for (int q = 7; q < 8; q++) {
                if ([scoreDataController Scores:q]) {
                    [scoreDataController deleteParticularData:q];
                    //nslog(@"Delete!");
                }
            }
            for (int i = 1; i < 6; i++) {
                //今日の曜日までに不足しているデータがあるかチェック
                if (![scoreDataController Scores:i]) {
                    //直近のデータを格納
                      //nslog(@"i%d", i);
                    for (int p = 1; p < scoreListOfDayOfTheWeek.count; p++) {
                        if ([scoreDataController Scores:p]) {
                            GetAndSetScoreOfDayOfTheWeek *recentScore = [scoreListOfDayOfTheWeek objectAtIndex:p];
                            GetAndSetScoreOfDayOfTheWeek *ScoreOfDayOfTheWeek  =
                            [[GetAndSetScoreOfDayOfTheWeek alloc] initWithUniqueId:i andScore:recentScore.score];
                            if ([scoreDataController Scores:i]) {
                                //nslog(@"Update!");
                                [scoreDataController updateScore:ScoreOfDayOfTheWeek];
                            }else if (![scoreDataController Scores:i]){
                                // Insert the score
                                [scoreDataController insertScore:ScoreOfDayOfTheWeek];
                                //nslog(@"Insert!");
                            }
                            //nslog(@"%d, %f", p, recentScore.score);
                        }
                    }
                }
            }
        }else if (weekday == 7){
            for (int i = 1; i < 7; i++) {
                //今日の曜日までに不足しているデータがあるかチェック
                if (![scoreDataController Scores:i]) {
                    //直近のデータを格納
                    //nslog(@"i%d", i);
                    for (int p = 1; p < scoreListOfDayOfTheWeek.count; p++) {
                        if ([scoreDataController Scores:p]) {
                            GetAndSetScoreOfDayOfTheWeek *recentScore = [scoreListOfDayOfTheWeek objectAtIndex:p];
                            GetAndSetScoreOfDayOfTheWeek *ScoreOfDayOfTheWeek  =
                            [[GetAndSetScoreOfDayOfTheWeek alloc] initWithUniqueId:i andScore:recentScore.score];
                            if ([scoreDataController Scores:i]) {
                                //nslog(@"Update!");
                                [scoreDataController updateScore:ScoreOfDayOfTheWeek];
                            }else if (![scoreDataController Scores:i]){
                                // Insert the score
                                [scoreDataController insertScore:ScoreOfDayOfTheWeek];
                                //nslog(@"Insert!");
                            }
                            //nslog(@"%d, %f", p, recentScore.score);
                        }
                    }
                }
            }
        }
    }else{ //今日の曜日のスコア Update
        GetAndSetScoreOfDayOfTheWeek *ScoreOfToday  =
        [[GetAndSetScoreOfDayOfTheWeek alloc] initWithUniqueId:weekday andScore:allScore];
        // Update the score
        [scoreDataController updateScore:ScoreOfToday];
    }
    
    if ([scoreDataController Scores:weekday]){
        GetAndSetScoreOfDayOfTheWeek *ScoreOfToday  =
        [[GetAndSetScoreOfDayOfTheWeek alloc] initWithUniqueId:weekday andScore:allScore];
        // Update the score
        [scoreDataController updateScore:ScoreOfToday];
    }
    
    for (int i = 1; i <= weekday; i++ ) {
        NSNumber *x = [NSNumber numberWithDouble:i];
        
        NSArray* score = [scoreDataController scoreInfos];
        scoreListOfDayOfTheWeek = score;
        GetAndSetScoreOfDayOfTheWeek *scoreOfDay = [scoreListOfDayOfTheWeek objectAtIndex:i];
        
        //GetAndSetScoreOfDayOfTheWeek *yScore = [scoreDataController ScoreData:i];
        NSNumber *y = [NSNumber numberWithDouble:scoreOfDay.score / 100];
        
        [self.scatterPlotData addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:x, @"x", y, @"y", nil]];
    }
    
    [self drawGraph];
    
    _isFadeIn = YES;
     */
    
    /*
    //drawopenlayer
    openMenuShape = [CAShapeLayer layer];
    [[[self view] layer] addSublayer:openMenuShape];
    // Constants to ease drawing the border and the stroke.
    int height = menu.frame.size.height - 50;
    int width = menu.frame.size.width;
    int triangleSize = 8;
    int trianglePosition = 0.87*width;
    
    // The path for the triangle (showing that the menu is open).
    UIBezierPath *triangleShape = [[UIBezierPath alloc] init];
    [triangleShape moveToPoint:CGPointMake(trianglePosition, height)];
    [triangleShape addLineToPoint:CGPointMake(trianglePosition+triangleSize, height-triangleSize)];
    [triangleShape addLineToPoint:CGPointMake(trianglePosition+2*triangleSize, height)];
    [triangleShape addLineToPoint:CGPointMake(trianglePosition, height)];
    
    [openMenuShape setPath:triangleShape.CGPath];
    //[openMenuShape setFillColor:[self.menubar.backgroundColor CGColor]];
    [openMenuShape setFillColor:[menu.backgroundColor CGColor]];
    UIBezierPath *borderPath = [[UIBezierPath alloc] init];
    [borderPath moveToPoint:CGPointMake(0, height)];
    [borderPath addLineToPoint:CGPointMake(trianglePosition, height)];
    [borderPath addLineToPoint:CGPointMake(trianglePosition+triangleSize, height-triangleSize)];
    [borderPath addLineToPoint:CGPointMake(trianglePosition+2*triangleSize, height)];
    [borderPath addLineToPoint:CGPointMake(width, height)];
    
    [openMenuShape setPath:borderPath.CGPath];
    [openMenuShape setStrokeColor:[[UIColor whiteColor] CGColor]];
    
    [openMenuShape setBounds:CGRectMake(0.0f, 0.0f, height+triangleSize, width)];
    [openMenuShape setAnchorPoint:CGPointMake(0.0f, 0.0f)];
    [openMenuShape setPosition:CGPointMake(0.0f, 0.0f)];
     */
}

- (IBAction)refreshButton:(id)sender
{
    UIAlertView *IDCheck = [[UIAlertView alloc] initWithTitle:@"更新しました" message:@"" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [IDCheck show];
    
    yosyuCheck *check = [[yosyuCheck alloc] init];
    [check initDatabase];
    
    for (int i = 1; i <= 30 ; i++) {
        if ([check ID:i]) {
            UIImageView *newStarImage = [stars objectAtIndex:i];
            [newStarImage setHidden:NO];
        }
    }
    
    /*
    [hostingView removeFromSuperview];
    
    self.scatterPlotData = [NSMutableArray array];
    
    //曜日取得 Sun = 1 Mon = 2
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *comps = [gregorian components:NSWeekdayCalendarUnit fromDate:[NSDate date]];
    int weekday = [comps weekday];
    
    ScoreOfDayOfTheWeek *scoreDataController = [[ScoreOfDayOfTheWeek alloc] init];
    [scoreDataController initDatabaseForScores];
    NSArray* score = [scoreDataController scoreInfos];
    scoreListOfDayOfTheWeek = score;
    
    //Score 総計
    ScoreData *dataController = [[ScoreData alloc]init];
    [dataController initDatabaseForScores];

    NSArray* allOfScore = [dataController scoreInfos];
    listOfScores = allOfScore;
    
    allScore = 0;
    
    for (int i = 0; i < [listOfScores count]; i++) {
        
        Score *info = [listOfScores objectAtIndex:i];
        
        for (int p = 1; p <= 30; p++) {
            if ([dataController ScoreData:p] && info.uniqueId == p) {
                int eachScore = info.score;
                allScore += eachScore;
            }
        }
    }
    
    GetAndSetScoreOfDayOfTheWeek *ScoreOfToday  =
    [[GetAndSetScoreOfDayOfTheWeek alloc] initWithUniqueId:weekday andScore:allScore];
    // Update the score
    [scoreDataController updateScore:ScoreOfToday];
    
    for (int i = 0; i <= weekday; i++ ) {
        NSNumber *x = [NSNumber numberWithDouble:i];
        
        NSArray* score = [scoreDataController scoreInfos];
        scoreListOfDayOfTheWeek = score;
        GetAndSetScoreOfDayOfTheWeek *scoreOfDay = [scoreListOfDayOfTheWeek objectAtIndex:i];
        
        //GetAndSetScoreOfDayOfTheWeek *yScore = [scoreDataController ScoreData:i];
        NSNumber *y = [NSNumber numberWithDouble:scoreOfDay.score / 100];
        
        [self.scatterPlotData addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:x, @"x", y, @"y", nil]];
    }
    
    [self drawGraph];
     */
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//セルが選択された時の挙動を決定する。
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    #define IS_IPHONE5 (([[UIScreen mainScreen] bounds].size.height-568)?NO:YES)
    if (IS_IPHONE5) {
        YosyusqtViewController *destViewController = [[YosyusqtViewController alloc] init];
        destViewController.wordNo = [wordNameForDetail objectAtIndex:indexPath.row];
        [self presentViewController:destViewController animated:YES completion:nil];
    }else{
        YosyuFourViewController *destFourViewController = [[YosyuFourViewController alloc] init];
        destFourViewController.wordNo = [wordNameForDetail objectAtIndex:indexPath.row];
        [self presentViewController:destFourViewController animated:YES completion:nil];
    }
}

/*
- (IBAction)shareAction:(id)sender {
    [self toggleMenu];

    self.tableView.contentOffset = CGPointMake(0, 0 - self.tableView.contentInset.top);
    
}

#pragma mark -
#pragma mark Plot Data Source Methods

// グラフに使用する折れ線グラフのデータ数を返す
-(NSUInteger)numberOfRecordsForPlot:(CPTPlot *)plot
{
    NSUInteger numRecords = 0;
    NSString *identifier  = (NSString *)plot.identifier;
    
    // 折れ線グラフのidentifierにより返すデータ数を変える（複数グラフを表示する場合に必要）
    if ( [identifier isEqualToString:kData] ) {
        numRecords = self.scatterPlotData.count;
    }
    
    return numRecords;
}

// グラフに使用する折れ線グラフのX軸とY軸のデータを返す
-(NSNumber *)numberForPlot:(CPTPlot *)plot field:(NSUInteger)fieldEnum recordIndex:(NSUInteger)index
{
    NSNumber *num        = nil;
    NSString *identifier = (NSString *)plot.identifier;
    
    // 折れ線グラフのidentifierにより返すデータ数を変える（複数グラフを表示する場合に必要）
    if ( [identifier isEqualToString:kData] ) {
        switch (fieldEnum) {
            case CPTScatterPlotFieldX:  // X軸の場合
                num = [[self.scatterPlotData objectAtIndex:index] valueForKey:@"x"];
                break;
            case CPTScatterPlotFieldY:  // Y軸の場合
                num = [[self.scatterPlotData objectAtIndex:index] valueForKey:@"y"];
                break;
        }
    }
    
    return num;
}

- (void)twitterButton:(UIButton *)sender{
    SLComposeViewController *tweetSheet = [SLComposeViewController
                                           composeViewControllerForServiceType:SLServiceTypeTwitter];
    //[tweetSheet setInitialText:@"英単語学習アプリ「速習英単語」 例文と音声付き 基礎英単語600語以上を収録"];
    [self presentViewController:tweetSheet animated:YES completion:nil];
    
    //[self toggleMenu];
}

- (void)facebookButton:(UIButton *)sender{
    SLComposeViewController *controller = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    
    //[controller setInitialText:@"英単語学習アプリ「速習英単語」 例文と音声付き 基礎英単語600語以上を収録"];
    [self presentViewController:controller animated:YES completion:Nil];
    
    //[self toggleMenu];
}


- (void)lineButton:(UIButton *)sender{
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"LINE"
                                                    message:@"メッセージを入力して下さい"
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"OK", nil];
    alert.delegate       = self;
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if( buttonIndex == alertView.cancelButtonIndex )
    {
        return;
    }
    
    NSString* textValue = [[alertView textFieldAtIndex:0] text];
    if( [textValue length] > 0 )
    {
        // 入力内容を利用した処理
        
        
        NSString *plainString = textValue;
        
        // escape
        NSString *contentKey = (__bridge NSString *)CFURLCreateStringByAddingPercentEscapes(
                                                                                            NULL,
                                                                                            (CFStringRef)plainString,
                                                                                            NULL,
                                                                                            (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                                                            kCFStringEncodingUTF8 );
        
        NSString *contentType = @"text";
        
        [[UIApplication sharedApplication] openURL:url];
    }else{
        // 入力内容を利用した処理
        
        
        NSString *plainString = @"";
        
        // escape
        NSString *contentKey = (__bridge NSString *)CFURLCreateStringByAddingPercentEscapes(
                                                                                            NULL,
                                                                                            (CFStringRef)plainString,
                                                                                            NULL,
                                                                                            (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                                                            kCFStringEncodingUTF8 );
        
        NSString *contentType = @"text";
        
        // LINE のサイトに遷移して、アプリが入っている場合はラインにリダイレクトする方法。
        NSString *urlString = [NSString
                               stringWithFormat: @"http://line.naver.jp/R/msg/%@/?%@",
                               contentType, contentKey];
        NSURL *url = [NSURL URLWithString:urlString];
        
        [[UIApplication sharedApplication] openURL:url];
    }
}

- (void)reviewButton:(UIButton *)sender{
    // AppStoreのレビューURLを開く (引数に AppStoreのアプリIDを指定)
    // レビュー画面の URL
    NSString *reviewUrl;
    
    // iOSのバージョンを判別
    NSString *osversion = [UIDevice currentDevice].systemVersion;
    NSArray *a = [osversion componentsSeparatedByString:@"."];
    BOOL isIOS7 = [(NSString *)[a objectAtIndex:0] intValue] >= 7;
    if (isIOS7) {
        // iOS 7以降
        reviewUrl = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/app/id%@", @"783634975"];
    } else {
        // iOS 7未満
        reviewUrl = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id=%@&onlyLatestVersion=true&pageNumber=0&sortOrdering=1&type=Purple+Software", @"783634975"];
    }
    
    // レビュー画面へ遷移
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:reviewUrl]];
    
    //[self toggleMenu];
}

- (void) toggleMenu {
    if(_isFadeIn) {
        [self showMenu];
    } else {
        [self hideMenu];
    }
    
    _isFadeIn = !_isFadeIn;
}

- (void) showMenu {
    //menu.hidden = NO;
    [UIView beginAnimations:@"fadeIn" context:nil];
    [UIView setAnimationDuration:0.8];
    
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    
    // Make the animatable changes.
    menu.alpha = 0.0;
    menu.alpha = 1.0;
    
    // Commit the changes and perform the animation.
    [UIView commitAnimations];
    
    //openMenuShape = [CAShapeLayer layer];
    //[[[self view] layer] addSublayer:openMenuShape];
}

- (void) hideMenu {
    //menu.hidden = YES;
    [UIView beginAnimations:@"fadeOut" context:nil];
    [UIView setAnimationDuration:0.8];
    
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    
    // Make the animatable changes.
    menu.alpha = 0.0;
    
    // Commit the changes and perform the animation.
    [UIView commitAnimations];
    
    //[openMenuShape removeFromSuperlayer];
}

- (void) drawGraph {
    // ホスティングビューを生成
    hostingView = [[CPTGraphHostingView alloc] initWithFrame:CGRectMake(0, -40, 320, 320)];
    // 画面にホスティングビューを追加
    [menu addSubview:hostingView];
    
    // グラフを生成
    graph = [[CPTXYGraph alloc] initWithFrame:hostingView.bounds];
    hostingView.hostedGraph = graph;
    
    // グラフのボーダー設定
    graph.plotAreaFrame.borderLineStyle = nil;
    graph.plotAreaFrame.cornerRadius    = 0.0f;
    graph.plotAreaFrame.masksToBorder   = NO;
    
    // パディング
    graph.paddingLeft   = 0.0f;
    graph.paddingRight  = 0.0f;
    graph.paddingTop    = 0.0f;
    graph.paddingBottom = 0.0f;
    
    graph.plotAreaFrame.paddingLeft   = 60.0f;
    graph.plotAreaFrame.paddingTop    = 60.0f;
    graph.plotAreaFrame.paddingRight  = 20.0f;
    graph.plotAreaFrame.paddingBottom = 65.0f;
    
    //プロット間隔の設定
    CPTXYPlotSpace *plotSpace = (CPTXYPlotSpace *)graph.defaultPlotSpace;
    //Y軸は0〜10の値で設定
    plotSpace.yRange = [CPTPlotRange plotRangeWithLocation:CPTDecimalFromInt(0) length:CPTDecimalFromInt(7)];
    //X軸は0〜10の値で設定
    plotSpace.xRange = [CPTPlotRange plotRangeWithLocation:CPTDecimalFromInt(0) length:CPTDecimalFromInt(8)];
    //plotSpace.allowsUserInteraction = YES;
    //plotSpace.delegate              = self;
    
    // テキストスタイル
    CPTMutableTextStyle *textStyle = [CPTTextStyle textStyle];
    textStyle.color                = [CPTColor colorWithComponentRed:0.024f green:0.365f blue:0.71f alpha:0.9f];
    textStyle.fontSize             = 13.0f;
    textStyle.textAlignment        = CPTTextAlignmentCenter;
    
    CPTMutableTextStyle *titleStyle = [CPTTextStyle textStyle];
    titleStyle.color                = [CPTColor colorWithComponentRed:0.024f green:0.365f blue:0.71f alpha:0.7f];
    titleStyle.fontSize             = 13.0f;
    titleStyle.textAlignment        = CPTTextAlignmentCenter;
    
    // ラインスタイル
    CPTMutableLineStyle *lineStyle = [CPTMutableLineStyle lineStyle];
    lineStyle.lineColor            = [CPTColor colorWithComponentRed:0.024f green:0.365f blue:0.71f alpha:0.2f];
    lineStyle.lineWidth            = 2.0f;
    
    // X軸のメモリ・ラベルなどの設定
    CPTXYAxisSet *axisSet = (CPTXYAxisSet *)graph.axisSet;
    CPTXYAxis *x          = axisSet.xAxis;
    x.axisLineStyle               = lineStyle;      // X軸の線にラインスタイルを適用
    x.majorTickLineStyle          = lineStyle;      // X軸の大きいメモリにラインスタイルを適用
    x.minorTickLineStyle          = lineStyle;      // X軸の小さいメモリにラインスタイルを適用
    x.majorIntervalLength         = CPTDecimalFromString(@"2"); // X軸ラベルの表示間隔
    x.orthogonalCoordinateDecimal = CPTDecimalFromString(@"0"); // X軸のY位置
    x.title                       = @"今週の進捗状況";
    x.titleTextStyle = titleStyle;
    x.titleLocation               = CPTDecimalFromFloat(4.0f);
    x.titleOffset                 = 30.0f;
    //    x.minorTickLength = 5.0f;                   // X軸のメモリの長さ ラベルを設定しているため無効ぽい
    //    x.majorTickLength = 9.0f;                   // X軸のメモリの長さ ラベルを設定しているため無効ぽい
    x.labelTextStyle = textStyle;
    
    // Y軸のメモリ・ラベルなどの設定
    CPTXYAxis *y = axisSet.yAxis;
    y.axisLineStyle               = lineStyle;      // Y軸の線にラインスタイルを適用
    y.majorTickLineStyle          = lineStyle;      // Y軸の大きいメモリにラインスタイルを適用
    y.minorTickLineStyle          = lineStyle;      // Y軸の小さいメモリにラインスタイルを適用
    y.majorTickLength = 9.0f;                   // Y軸の大きいメモリの長さ
    y.minorTickLength = 5.0f;                   // Y軸の小さいメモリの長さ
    y.majorIntervalLength         = CPTDecimalFromFloat(1.0f);  // Y軸ラベルの表示間隔
    y.orthogonalCoordinateDecimal = CPTDecimalFromFloat(0.0f);  // Y軸のX位置
    y.title                       = @"覚えた単語の総数";
    y.titleTextStyle = titleStyle;
    y.titleRotation = 90 * (M_PI / 180);
    y.titleLocation               = CPTDecimalFromFloat(3.5f);
    y.titleOffset                 = 36.0f;
    lineStyle.lineWidth = 0.5f;
    y.majorGridLineStyle = lineStyle;
    y.labelTextStyle = textStyle;
    
    NSMutableArray *xLabels = [NSMutableArray arrayWithCapacity:12];
    int idx = 1;
    for (NSString *day in @[@"日", @"月",@"火",@"水",@"木",@"金",@"土"]) // ラベルの文字列
    {
        CPTAxisLabel *label = [[CPTAxisLabel alloc] initWithText:day
                                                       textStyle:axisSet.xAxis.labelTextStyle];
        label.tickLocation = CPTDecimalFromInt(idx); // ラベルを追加するレコードの位置
        label.offset = 5.0f; // 軸からラベルまでの距離
        [xLabels addObject:label];
        ++idx;
    }
    
    // X軸に設定
    axisSet.xAxis.axisLabels = [NSSet setWithArray:xLabels];
    axisSet.xAxis.labelingPolicy = CPTAxisLabelingPolicyNone; // これ重要
    axisSet.xAxis.labelRotation  = 0 * (M_PI / 180);                // 表示角度
    
    NSMutableArray *yLabels = [NSMutableArray arrayWithCapacity:12];
    int idy = 1;
    for (NSString *var in @[@"100",@"200",@"300",@"400",@"500",@"600"]) // ラベルの文字列
    {
        CPTAxisLabel *label = [[CPTAxisLabel alloc] initWithText:var
                                                       textStyle:axisSet.xAxis.labelTextStyle];
        label.tickLocation = CPTDecimalFromInt(idy); // ラベルを追加するレコードの位置
        label.offset = 5.0f; // 軸からラベルまでの距離
        [yLabels addObject:label];
        ++idy;
    }
    
    // Y軸に設定
    axisSet.yAxis.axisLabels = [NSSet setWithArray:yLabels];
    axisSet.yAxis.labelingPolicy = CPTAxisLabelingPolicyNone; // これ重要
    axisSet.yAxis.labelRotation  = 0 * (M_PI / 180);                // 表示角度
    
    graph.fill            = [CPTFill fillWithColor:[CPTColor colorWithComponentRed:0.95 green:0.95 blue:0.95 alpha:0.05]];
    
    // 折れ線グラフのインスタンスを生成
    CPTBarPlot *barPlot = [[CPTBarPlot alloc] init];
    //CPTBarPlot *barPlot = [CPTBarPlot tubularBarPlotWithColor:[CPTColor colorWithComponentRed:0.0f green:1.0f blue:0.0f alpha:0.3f] horizontalBars:NO];
    barPlot.identifier      = kData;    // 折れ線グラフを識別するために識別子を設定
    barPlot.dataSource      = self;     // 折れ線グラフのデータソースを設定
    
    // バー表示設定
    barPlot.fill = [CPTFill fillWithColor:[CPTColor colorWithComponentRed:0.3f green:1.0f blue:0.3f alpha:1.0f]];
    
    barPlot.lineStyle = lineStyle;
    //barPlot.baseValue  = CPTDecimalFromString(@"0");
    //barPlot.dataSource = self;
    barPlot.barWidth = CPTDecimalFromFloat(0.7f);
    //barPlot.barOffset  = CPTDecimalFromFloat(0.5f);
     
    // グラフに折れ線グラフを追加
    [graph addPlot:barPlot];
    //[graph addPlot:barPlot];
}
*/

/*
//セルの内容を記述
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return cell;
}

#pragma mark - Table view data source
//セクション数を決める
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}


//セクション毎のセルの数を決定する。
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [testNo count];
}



 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

@end
