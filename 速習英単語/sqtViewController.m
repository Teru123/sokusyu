//
//  sqtViewController.m
//  TestView
//
//  Created by Teru on 2013/10/03.
//  Copyright (c) 2013年 Self. All rights reserved.
//

#import "sqtViewController.h"
#import "TestsqtViewController.h"
#import "TestFourViewController.h"
#import "Score.h"
#import "ScoreData.h"
#import "CorrectAnswerData.h"
#import "PercentageViewController.h"
#import "UITableView+Wave.h"
#import "Reachability.h"

@interface sqtViewController ()

@property (assign, nonatomic) BOOL internetActive;
@property (assign, nonatomic) BOOL hostActive;
@property (strong, nonatomic) UIAlertView *wifiAlert;

@end

@implementation sqtViewController

CAShapeLayer *openMenuShape;
#define Rgb2UIColor(r, g, b)  [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0]
@synthesize countPerfectImage;
@synthesize countScoreLabel;

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
    /*
    self.edgesForExtendedLayout=UIRectEdgeNone;
    self.extendedLayoutIncludesOpaqueBars=NO;
    self.automaticallyAdjustsScrollViewInsets=NO;
    */
    
    testNo = [NSArray arrayWithObjects:@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"11", @"12", @"13",
              @"14", @"15", @"16", @"17", @"18", @"19", @"20", @"21", @"22", @"23", @"24", @"25", @"26", @"27", @"28",
              @"29", @"30", nil];
    
    NSNumber *toCount = [[NSNumber alloc] initWithInt:0];
    detail = [NSArray arrayWithObjects:toCount,
              @"afraid - well", @"adventure - worse", @"alien - view", @"appropriate - village", @"aware - wild",
              @"advantage - wise", @"allow - therefore", @"accept - theory", @"against - wave", @"benefit - trouble",
              @"anymore - wake", @"alone - thin", @"blood - whole", @"coach - technology", @"across - yet",
              @"academy - wealth", @"appreciate - whether", @"argue - treat", @"alive - wood", @"achieve - worth",
              @"appear - various", @"actual - thief", @"advance - web", @"block - unite", @"associate - wide",
              @"advice - suggest", @"actually - value", @"band - within", @"advertise - vote", @"above - surface", nil];
   
    NSArray *details30 = [[NSArray alloc] initWithObjects:toCount, detail1, detail2, detail3, detail4, detail5, detail6, detail7, detail8, detail9, detail10, detail11, detail12, detail13, detail14, detail15, detail16, detail17, detail18, detail19, detail20, detail21, detail22, detail23, detail24, detail25, detail26, detail27, detail28, detail29, detail30, nil];
    
    for (int i = 1; i <= 30; i++) {
        UILabel *newDetail = [details30 objectAtIndex:i];
        newDetail.text = [NSString stringWithFormat:@"%@", [detail objectAtIndex:i]];
    }
    
    ScoreData *dataController = [[ScoreData alloc]init];
    [dataController initDatabaseForScores];
    NSArray* scores = [dataController scoreInfos];
    listOfScores = scores;
    
    countScoreLabel = [[NSArray alloc] initWithObjects:toCount, scoreLabel, scoreLabel2, scoreLabel3, scoreLabel4, scoreLabel5, scoreLabel6, scoreLabel7, scoreLabel8, scoreLabel9, scoreLabel10, scoreLabel11, scoreLabel12, scoreLabel13, scoreLabel14, scoreLabel15, scoreLabel16, scoreLabel17, scoreLabel18, scoreLabel19, scoreLabel20, scoreLabel21, scoreLabel22, scoreLabel23, scoreLabel24, scoreLabel25, scoreLabel26, scoreLabel27, scoreLabel28, scoreLabel29, scoreLabel30, nil];
    
    countPerfectImage = [[NSArray alloc] initWithObjects:toCount, perfectImage, perfectImage2, perfectImage3, perfectImage4, perfectImage5, perfectImage6, perfectImage7, perfectImage8, perfectImage9, perfectImage10, perfectImage11, perfectImage12, perfectImage13, perfectImage14, perfectImage15, perfectImage16, perfectImage17, perfectImage18, perfectImage19, perfectImage20, perfectImage21, perfectImage22, perfectImage23, perfectImage24, perfectImage25, perfectImage26, perfectImage27, perfectImage28, perfectImage29, perfectImage30, nil];
    
    for (int i = 0; i < [listOfScores count]; i++) {

        Score *info = [listOfScores objectAtIndex:i]; //Scoreクラスの数値を格納
        
        for (int p = 1; p <= 30; p++) {
            if ([dataController Scores:p] && info.uniqueId == p) {
                if (info.score == 20) {
                    UIImageView *newImage = [countPerfectImage objectAtIndex:p];
                    [newImage setHidden:NO];
                    UILabel *newScoreLabel = [countScoreLabel objectAtIndex:p];
                    //newScoreLabel.text = [NSString stringWithFormat:@"Perfect"];
                    newScoreLabel.text = [NSString stringWithFormat:@"Score %d", info.score];
                }else{
                    UIImageView *newImage = [countPerfectImage objectAtIndex:p];
                    [newImage setHidden:YES];
                    UILabel *newScoreLabel = [countScoreLabel objectAtIndex:p];
                    newScoreLabel.text = [NSString stringWithFormat:@"Score %d", info.score]; //数値(int)を格納
                }
            }
            
        }
    }
    
    [tableViewOutlet reloadData];
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
        TestsqtViewController *testController = [[TestsqtViewController alloc] init];
        testController.wordNo = [testNo objectAtIndex:indexPath.row];
        testController.delegate = self;
        [self presentViewController:testController animated:YES completion:nil];
    }else{
        TestFourViewController *testFourController = [[TestFourViewController alloc] init];
        testFourController.wordNo = [testNo objectAtIndex:indexPath.row];
        testFourController.delegate = self;
        [self presentViewController:testFourController animated:YES completion:nil];
    }
}

-(void)editingInfoWasFinishedonFour{
    
    ScoreData *dataController = [[ScoreData alloc]init];
    [dataController initDatabaseForScores];
    
    NSArray* scores = [dataController scoreInfos];
    listOfScores = scores;
    
    
    for (int i = 0; i < [listOfScores count]; i++) {
        
        Score *info = [listOfScores objectAtIndex:i];
        
        for (int p = 1; p <= 30; p++) {
            if ([dataController Scores:p] && info.uniqueId == p) {
                if (info.score == 20) {
                    UIImageView *newImage = [countPerfectImage objectAtIndex:p];
                    [newImage setHidden:NO];
                    UILabel *newScoreLabel = [countScoreLabel objectAtIndex:p];
                    //newScoreLabel.text = [NSString stringWithFormat:@"Perfect"];
                    newScoreLabel.text = [NSString stringWithFormat:@"Score %d", info.score];
                }else{
                    UIImageView *newImage = [countPerfectImage objectAtIndex:p];
                    [newImage setHidden:YES];
                    UILabel *newScoreLabel = [countScoreLabel objectAtIndex:p];
                    newScoreLabel.text = [NSString stringWithFormat:@"Score %d", info.score];
                }
            }
        }
    }
    
    [tableViewOutlet reloadData];
}

-(void)editingInfoWasFinished{
    ScoreData *dataController = [[ScoreData alloc]init];
    [dataController initDatabaseForScores];
    
    NSArray* scores = [dataController scoreInfos];
    listOfScores = scores;
    
    
    for (int i = 0; i < [listOfScores count]; i++) {
        
        Score *info = [listOfScores objectAtIndex:i];
        
        for (int p = 1; p <= 30; p++) {
            if ([dataController Scores:p] && info.uniqueId == p) {
                if (info.score == 20) {
                    UIImageView *newImage = [countPerfectImage objectAtIndex:p];
                    [newImage setHidden:NO];
                    UILabel *newScoreLabel = [countScoreLabel objectAtIndex:p];
                    //newScoreLabel.text = [NSString stringWithFormat:@"Perfect"];
                    newScoreLabel.text = [NSString stringWithFormat:@"Score %d", info.score];
                }else{
                    UIImageView *newImage = [countPerfectImage objectAtIndex:p];
                    [newImage setHidden:YES];
                    UILabel *newScoreLabel = [countScoreLabel objectAtIndex:p];
                    newScoreLabel.text = [NSString stringWithFormat:@"Score %d", info.score];
                }
            }
        }
    }
    
    [tableViewOutlet reloadData];
}

- (IBAction)shareAction:(id)sender {
    //[self toggleMenu];
    
    //self.tableView.contentOffset = CGPointMake(0, 0 - self.tableView.contentInset.top);
    
    PercentageViewController *percentageController = [[PercentageViewController alloc] init];
    [self presentViewController:percentageController animated:YES completion:nil];
    
}

/*
 - (IBAction)refreshScore:(id)sender {
 
 UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"更新しました" message:@"" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
 [alertView show];
 
 ScoreData *dataController = [[ScoreData alloc]init];
 [dataController initDatabaseForScores];
 
 NSArray* scores = [dataController scoreInfos];
 listOfScores = scores;
 
 
 for (int i = 0; i < [listOfScores count]; i++) {
 
 Score *info = [listOfScores objectAtIndex:i];
 
 for (int p = 1; p <= 30; p++) {
 if ([dataController Scores:p] && info.uniqueId == p) {
 if (info.score == 20) {
 UIImageView *newImage = [countPerfectImage objectAtIndex:p];
 [newImage setHidden:NO];
 UILabel *newScoreLabel = [countScoreLabel objectAtIndex:p];
 //newScoreLabel.text = [NSString stringWithFormat:@"Perfect"];
 newScoreLabel.text = [NSString stringWithFormat:@"Score %d", info.score];
 }else{
 UIImageView *newImage = [countPerfectImage objectAtIndex:p];
 [newImage setHidden:YES];
 UILabel *newScoreLabel = [countScoreLabel objectAtIndex:p];
 newScoreLabel.text = [NSString stringWithFormat:@"Score %d", info.score];
 }
 }
 }
 }
 
 [tableViewOutlet reloadData];
 
 }*/

@end
