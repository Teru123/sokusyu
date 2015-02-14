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
#import "Reachability.h"
#import <Social/Social.h>

// 折れ線グラフの識別子
//NSString *const kData   = @"Data Source Plot";

@interface YosyuTableViewController ()

@property (assign, nonatomic) BOOL internetActive;
@property (assign, nonatomic) BOOL hostActive;
@property (strong, nonatomic) UIAlertView *wifiAlert;

@end

@implementation YosyuTableViewController

@synthesize stars, detail30;
CAShapeLayer *openMenuShape;
#define Rgb2UIColor(r, g, b)  [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0]


-(void) viewWillAppear:(BOOL)animated
{
    // ハイライト解除
    [super viewWillAppear:animated];
    //[self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
    
}

-(void) viewWillDisappear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

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
    
    //[self.tableView reloadDataAnimateWithWave:RightToLeftWaveAnimation];
    
    
}

- (void)editingInfoWasFinishedonFour
{
    yosyuCheck *check = [[yosyuCheck alloc] init];
    [check initDatabase];
    
    for (int i = 1; i <= 30 ; i++) {
        if ([check ID:i]) {
            UIImageView *newStarImage = [stars objectAtIndex:i];
            [newStarImage setHidden:NO];
        }
    }
}

- (void)editingInfoWasFinished
{
    yosyuCheck *check = [[yosyuCheck alloc] init];
    [check initDatabase];
    
    for (int i = 1; i <= 30 ; i++) {
        if ([check ID:i]) {
            UIImageView *newStarImage = [stars objectAtIndex:i];
            [newStarImage setHidden:NO];
        }
    }
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
        destViewController.delegate = self;
        [self presentViewController:destViewController animated:YES completion:nil];
    }else{
        YosyuFourViewController *destFourViewController = [[YosyuFourViewController alloc] init];
        destFourViewController.wordNo = [wordNameForDetail objectAtIndex:indexPath.row];
        destFourViewController.delegate = self;
        [self presentViewController:destFourViewController animated:YES completion:nil];
    }
}



@end
