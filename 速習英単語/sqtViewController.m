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
    
    // check for internet connection
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(checkNetworkStatus:) name:kReachabilityChangedNotification object:nil];
    
    internetReachable = [Reachability reachabilityForInternetConnection];
    [internetReachable startNotifier];
    
    // check if a pathway to a random host exists
    hostReachable = [Reachability reachabilityWithHostName:@"www.apple.com"];
    [hostReachable startNotifier];
    
    // now patiently wait for the notification
}

-(void) checkNetworkStatus:(NSNotification *)notice
{
    // called after network status changes
    NetworkStatus internetStatus = [internetReachable currentReachabilityStatus];
    switch (internetStatus)
    {
        case NotReachable:
        {

            self.internetActive = NO;
            
            self.wifiAlert = [[UIAlertView alloc] initWithTitle:@"アプリを使用するには、機内モードをオフにするか、Wi-Fiを使用してからアプリを再起動してください" message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:nil];
            [self.wifiAlert show];
            break;
        }
        case ReachableViaWiFi:
        {
            self.internetActive = YES;
            
            break;
        }
        case ReachableViaWWAN:
        {
            self.internetActive = YES;
            
            break;
        }
    }
    
    /*
     NetworkStatus hostStatus = [hostReachable currentReachabilityStatus];
     switch (hostStatus)
     {
     case NotReachable:
     {
     NSLog(@"A gateway to the host server is down.");
     self.hostActive = NO;
     self.wifiAlert = [[UIAlertView alloc] initWithTitle:@"WiFi未接続"
     message:@"WiFi接続時にご利用可能です。"
     delegate:self
     cancelButtonTitle:@"接続を確認する"
     otherButtonTitles:nil];
     self.wifiAlert.delegate       = self;
     [self.wifiAlert show];
     self.showAlert = 1;
     break;
     }
     case ReachableViaWiFi:
     {
     NSLog(@"A gateway to the host server is working via WIFI.");
     self.hostActive = YES;
     if (self.showAlert == 1) {
     [self.wifiAlert dismissWithClickedButtonIndex:0 animated:YES];
     }
     self.showAlert = 0;
     break;
     }
     case ReachableViaWWAN:
     {
     NSLog(@"A gateway to the host server is working via WWAN.");
     self.hostActive = YES;
     
     break;
     }
     }*/
    
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
            /*
        }else if ([dataController Scores:2] && info.uniqueId == 2){
            if (info.score == 20) {
                perfectImage2.hidden = NO;
                [scoreLabel2 setText:[NSString stringWithFormat:@"Perfect"]];
            }else{
                perfectImage2.hidden = YES;
                [scoreLabel2 setText:[NSString stringWithFormat:@"HighScore %d", info.score]];
            }*/
        }
    }
    
    [tableViewOutlet reloadData];
    
    //[self.tableView reloadDataAnimateWithWave:RightToLeftWaveAnimation];
    
    /*
    menu.frame = CGRectMake(0, 0, 320, 430);
    
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
    
    /*
    [menu addSubview:lineButton];
    [menu addSubview:twitterButton];
    [menu addSubview:facebookButton];
    [menu addSubview:reviewButton];
    [menu addSubview:description];
    */
     
    /*
    //正答率算出
    CorrectAnswerData *correct = [[CorrectAnswerData alloc] init];
    [correct initDatabaseForAnswers];
    
    NSArray* answer = [correct AnswersInfo];
    correctAnswerList = answer;
    
    for (int i = 0; i < [correctAnswerList count]; i++) {
        
        GetAndSetCorrectAnswerData *infoCorrectIncorrect = [correctAnswerList objectAtIndex:i]; //Scoreクラスの数値を格納
        
        for (int p = 1; p <= 30; p++) {
            if ([correct CorrectData:p] && infoCorrectIncorrect.uniqueId == p) {
                if (p == 1) {
                    percentage1 = infoCorrectIncorrect.correct / (infoCorrectIncorrect.correct + infoCorrectIncorrect.incorrect) * 100;
                    NSLog(@"%f", infoCorrectIncorrect.correct);
                    NSLog(@"%f", infoCorrectIncorrect.incorrect);
                }
            }
        }
    }
    NSLog(@"%d", percentage1);
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
    
    //正答率表示
    //[self drawPercentage];
    
    //_isFadeIn = YES;
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
        [self presentViewController:testController animated:YES completion:nil];
    }else{
        TestFourViewController *testFourController = [[TestFourViewController alloc] init];
        testFourController.wordNo = [testNo objectAtIndex:indexPath.row];
        [self presentViewController:testFourController animated:YES completion:nil];
    }
}

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
    
    /*
    [percentageView1 removeFromSuperview];
    [percentageView2 removeFromSuperview];
    [percentageView3 removeFromSuperview];
    [percentageView4 removeFromSuperview];
    [percentageView5 removeFromSuperview];
    [percentageView6 removeFromSuperview];
    [percentageView7 removeFromSuperview];
    [percentageView8 removeFromSuperview];
    [percentageView9 removeFromSuperview];
    [percentageView10 removeFromSuperview];
    [percentageView11 removeFromSuperview];
    [percentageView12 removeFromSuperview];
    [percentageView13 removeFromSuperview];
    [percentageView14 removeFromSuperview];
    [percentageView15 removeFromSuperview];
    [percentageView16 removeFromSuperview];
    [percentageView17 removeFromSuperview];
    [percentageView18 removeFromSuperview];
    [percentageView19 removeFromSuperview];
    [percentageView20 removeFromSuperview];
    [percentageView21 removeFromSuperview];
    [percentageView22 removeFromSuperview];
    [percentageView23 removeFromSuperview];
    [percentageView24 removeFromSuperview];
    [percentageView25 removeFromSuperview];
    [percentageView26 removeFromSuperview];
    [percentageView27 removeFromSuperview];
    [percentageView28 removeFromSuperview];
    [percentageView29 removeFromSuperview];
    [percentageView30 removeFromSuperview];
    [hostingView removeFromSuperview];
    */
    
    //[self drawPercentage];
}

- (IBAction)shareAction:(id)sender {
    //[self toggleMenu];
    
    //self.tableView.contentOffset = CGPointMake(0, 0 - self.tableView.contentInset.top);
    
    PercentageViewController *percentageController = [[PercentageViewController alloc] init];
    [self presentViewController:percentageController animated:YES completion:nil];
    
}

/*
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
 */

/*
- (void)drawPercentage
{
    hostingView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, 320, 280)];
    hostingView.scrollEnabled = YES;
    hostingView.editable = NO;
    hostingView.selectable = NO;
    
    //正答率算出
    CorrectAnswerData *correct = [[CorrectAnswerData alloc] init];
    [correct initDatabaseForAnswers];
    
    NSArray* answer = [correct AnswersInfo];
    correctAnswerList = answer;
    
    for (int i = 0; i < [correctAnswerList count]; i++) {
        
        GetAndSetCorrectAnswerData *infoCorrectIncorrect = [correctAnswerList objectAtIndex:i]; //Scoreクラスの数値を格納
        
        for (int p = 1; p <= 30; p++) {
            if ([correct CorrectData:p] && infoCorrectIncorrect.uniqueId == p) {
                if (p == 1) {
                    percentage1 =
                    infoCorrectIncorrect.correct / (infoCorrectIncorrect.correct + infoCorrectIncorrect.incorrect) * 100;
                }else if (p == 2){
                    percentage2 =
                    infoCorrectIncorrect.correct / (infoCorrectIncorrect.correct + infoCorrectIncorrect.incorrect) * 100;
                }else if (p == 3){
                    percentage3 =
                    infoCorrectIncorrect.correct / (infoCorrectIncorrect.correct + infoCorrectIncorrect.incorrect) * 100;
                }else if (p == 4){
                    percentage4 =
                    infoCorrectIncorrect.correct / (infoCorrectIncorrect.correct + infoCorrectIncorrect.incorrect) * 100;
                }else if (p == 5){
                    percentage5 =
                    infoCorrectIncorrect.correct / (infoCorrectIncorrect.correct + infoCorrectIncorrect.incorrect) * 100;
                }else if (p == 6){
                    percentage6 =
                    infoCorrectIncorrect.correct / (infoCorrectIncorrect.correct + infoCorrectIncorrect.incorrect) * 100;
                }else if (p == 7){
                    percentage7 =
                    infoCorrectIncorrect.correct / (infoCorrectIncorrect.correct + infoCorrectIncorrect.incorrect) * 100;
                }else if (p == 8){
                    percentage8 =
                    infoCorrectIncorrect.correct / (infoCorrectIncorrect.correct + infoCorrectIncorrect.incorrect) * 100;
                }else if (p == 9){
                    percentage9 =
                    infoCorrectIncorrect.correct / (infoCorrectIncorrect.correct + infoCorrectIncorrect.incorrect) * 100;
                }else if (p == 10){
                    percentage10 =
                    infoCorrectIncorrect.correct / (infoCorrectIncorrect.correct + infoCorrectIncorrect.incorrect) * 100;
                }else if (p == 11){
                    percentage11 =
                    infoCorrectIncorrect.correct / (infoCorrectIncorrect.correct + infoCorrectIncorrect.incorrect) * 100;
                }else if (p == 12){
                    percentage12 =
                    infoCorrectIncorrect.correct / (infoCorrectIncorrect.correct + infoCorrectIncorrect.incorrect) * 100;
                }else if (p == 13){
                    percentage13 =
                    infoCorrectIncorrect.correct / (infoCorrectIncorrect.correct + infoCorrectIncorrect.incorrect) * 100;
                }else if (p == 14){
                    percentage14 =
                    infoCorrectIncorrect.correct / (infoCorrectIncorrect.correct + infoCorrectIncorrect.incorrect) * 100;
                }else if (p == 15){
                    percentage15 =
                    infoCorrectIncorrect.correct / (infoCorrectIncorrect.correct + infoCorrectIncorrect.incorrect) * 100;
                }else if (p == 16){
                    percentage16 =
                    infoCorrectIncorrect.correct / (infoCorrectIncorrect.correct + infoCorrectIncorrect.incorrect) * 100;
                }else if (p == 17){
                    percentage17 =
                    infoCorrectIncorrect.correct / (infoCorrectIncorrect.correct + infoCorrectIncorrect.incorrect) * 100;
                }else if (p == 18){
                    percentage18 =
                    infoCorrectIncorrect.correct / (infoCorrectIncorrect.correct + infoCorrectIncorrect.incorrect) * 100;
                }else if (p == 19){
                    percentage19 =
                    infoCorrectIncorrect.correct / (infoCorrectIncorrect.correct + infoCorrectIncorrect.incorrect) * 100;
                }else if (p == 20){
                    percentage20 =
                    infoCorrectIncorrect.correct / (infoCorrectIncorrect.correct + infoCorrectIncorrect.incorrect) * 100;
                }else if (p == 21){
                    percentage21 =
                    infoCorrectIncorrect.correct / (infoCorrectIncorrect.correct + infoCorrectIncorrect.incorrect) * 100;
                }else if (p == 22){
                    percentage22 =
                    infoCorrectIncorrect.correct / (infoCorrectIncorrect.correct + infoCorrectIncorrect.incorrect) * 100;
                }else if (p == 23){
                    percentage23 =
                    infoCorrectIncorrect.correct / (infoCorrectIncorrect.correct + infoCorrectIncorrect.incorrect) * 100;
                }else if (p == 24){
                    percentage24 =
                    infoCorrectIncorrect.correct / (infoCorrectIncorrect.correct + infoCorrectIncorrect.incorrect) * 100;
                }else if (p == 25){
                    percentage25 =
                    infoCorrectIncorrect.correct / (infoCorrectIncorrect.correct + infoCorrectIncorrect.incorrect) * 100;
                }else if (p == 26){
                    percentage26 =
                    infoCorrectIncorrect.correct / (infoCorrectIncorrect.correct + infoCorrectIncorrect.incorrect) * 100;
                }else if (p == 27){
                    percentage27 =
                    infoCorrectIncorrect.correct / (infoCorrectIncorrect.correct + infoCorrectIncorrect.incorrect) * 100;
                }else if (p == 28){
                    percentage28 =
                    infoCorrectIncorrect.correct / (infoCorrectIncorrect.correct + infoCorrectIncorrect.incorrect) * 100;
                }else if (p == 29){
                    percentage29 =
                    infoCorrectIncorrect.correct / (infoCorrectIncorrect.correct + infoCorrectIncorrect.incorrect) * 100;
                }else if (p == 30){
                    percentage30 =
                    infoCorrectIncorrect.correct / (infoCorrectIncorrect.correct + infoCorrectIncorrect.incorrect) * 100;
                }
            }
        }
    }
    //NSLog(@"%d %d %d", percentage1, percentage2, percentage3);
    
 
    
    NSString *correctN = [[NSString alloc] initWithFormat:@"正答率  ・淡緑部分を上下にスワイプしてスクロール\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"];
    [hostingView setText:correctN];
    hostingView.font = [UIFont fontWithName:@"American Typewriter" size:13];
    //hostingView.font = [UIFont boldSystemFontOfSize:13];
    hostingView.textColor = Rgb2UIColor(77, 77, 255);
    hostingView.backgroundColor = Rgb2UIColor(242, 255, 242);
    
    if (percentage1 < 80 && percentage1) {
        percentageView1 = [[UITextView alloc] initWithFrame:CGRectMake(0, 25, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"1    afraid - well              %d%%", percentage1];
        [percentageView1 setText:percentageNumber1];
        percentageView1.textColor = [UIColor redColor];
        percentageView1.backgroundColor = Rgb2UIColor(250, 250, 250);
        percentageView1.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (89 < percentage1 && percentage1){
        percentageView1 = [[UITextView alloc] initWithFrame:CGRectMake(0, 25, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"1    afraid - well              %d%%", percentage1];
        [percentageView1 setText:percentageNumber1];
        percentageView1.textColor = [UIColor blueColor];
        percentageView1.backgroundColor = Rgb2UIColor(250, 250, 250);
        percentageView1.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (79 < percentage1 < 90  && percentage1){
        percentageView1 = [[UITextView alloc] initWithFrame:CGRectMake(0, 25, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"1    afraid - well              %d%%", percentage1];
        [percentageView1 setText:percentageNumber1];
        percentageView1.textColor = [UIColor grayColor];
        percentageView1.backgroundColor = Rgb2UIColor(250, 250, 250);
        percentageView1.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (!percentage1){
        percentageView1 = [[UITextView alloc] initWithFrame:CGRectMake(0, 25, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"1    afraid - well              --%%"];
        [percentageView1 setText:percentageNumber1];
        percentageView1.textColor = [UIColor blackColor];
        percentageView1.backgroundColor = Rgb2UIColor(250, 250, 250);
        percentageView1.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }
    
    if (percentage2 < 80 && percentage2) {
        percentageView2 = [[UITextView alloc] initWithFrame:CGRectMake(0, 45, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"2    adventure - worse          %d%%", percentage2];
        [percentageView2 setText:percentageNumber1];
        percentageView2.textColor = [UIColor redColor];
        percentageView2.backgroundColor = Rgb2UIColor(240, 240, 240);
        percentageView2.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (89 < percentage2 && percentage2){
        percentageView2 = [[UITextView alloc] initWithFrame:CGRectMake(0, 45, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"2    adventure - worse          %d%%", percentage2];
        [percentageView2 setText:percentageNumber1];
        percentageView2.textColor = [UIColor blueColor];
        percentageView2.backgroundColor = Rgb2UIColor(240, 240, 240);
        percentageView2.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (79 < percentage2 < 90 && percentage2){
        percentageView2 = [[UITextView alloc] initWithFrame:CGRectMake(0, 45, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"2    adventure - worse          %d%%", percentage2];
        [percentageView2 setText:percentageNumber1];
        percentageView2.textColor = [UIColor grayColor];
        percentageView2.backgroundColor = Rgb2UIColor(240, 240, 240);
        percentageView2.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (!percentage2){
        percentageView2 = [[UITextView alloc] initWithFrame:CGRectMake(0, 45, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"2    adventure - worse          --%%"];
        [percentageView2 setText:percentageNumber1];
        percentageView2.textColor = [UIColor blackColor];
        percentageView2.backgroundColor = Rgb2UIColor(240, 240, 240);
        percentageView2.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }

    if (percentage3 < 80 && percentage3) {
        percentageView3 = [[UITextView alloc] initWithFrame:CGRectMake(0, 65, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"3    alien - view               %d%%", percentage3];
        [percentageView3 setText:percentageNumber1];
        percentageView3.textColor = [UIColor redColor];
        percentageView3.backgroundColor = Rgb2UIColor(250, 250, 250);
        percentageView3.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (89 < percentage3 && percentage3){
        percentageView3 = [[UITextView alloc] initWithFrame:CGRectMake(0, 65, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"3    alien - view               %d%%", percentage3];
        [percentageView3 setText:percentageNumber1];
        percentageView3.textColor = [UIColor blueColor];
        percentageView3.backgroundColor = Rgb2UIColor(250, 250, 250);
        percentageView3.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (79 < percentage3 < 90 && percentage3){
        percentageView3 = [[UITextView alloc] initWithFrame:CGRectMake(0, 65, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"3    alien - view               %d%%", percentage3];
        [percentageView3 setText:percentageNumber1];
        percentageView3.textColor = [UIColor grayColor];
        percentageView3.backgroundColor = Rgb2UIColor(250, 250, 250);
        percentageView3.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (!percentage3){
        percentageView3 = [[UITextView alloc] initWithFrame:CGRectMake(0, 65, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"3    alien - view               --%%"];
        [percentageView3 setText:percentageNumber1];
        percentageView3.textColor = [UIColor blackColor];
        percentageView3.backgroundColor = Rgb2UIColor(250, 250, 250);
        percentageView3.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }
    
    if (percentage4 < 80 && percentage4) {
        percentageView4 = [[UITextView alloc] initWithFrame:CGRectMake(0, 85, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"4    appropriate - village      %d%%", percentage4];
        [percentageView4 setText:percentageNumber1];
        percentageView4.textColor = [UIColor redColor];
        percentageView4.backgroundColor = Rgb2UIColor(240, 240, 240);
        percentageView4.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (89 < percentage4 && percentage4){
        percentageView4 = [[UITextView alloc] initWithFrame:CGRectMake(0, 85, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"4    appropriate - village      %d%%", percentage4];
        [percentageView4 setText:percentageNumber1];
        percentageView4.textColor = [UIColor blueColor];
        percentageView4.backgroundColor = Rgb2UIColor(240, 240, 240);
        percentageView4.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (79 < percentage4 < 90 && percentage4){
        percentageView4 = [[UITextView alloc] initWithFrame:CGRectMake(0, 85, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"4    appropriate - village      %d%%", percentage4];
        [percentageView4 setText:percentageNumber1];
        percentageView4.textColor = [UIColor grayColor];
        percentageView4.backgroundColor = Rgb2UIColor(240, 240, 240);
        percentageView4.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (!percentage4){
        percentageView4 = [[UITextView alloc] initWithFrame:CGRectMake(0, 85, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"4    appropriate - village      --%%"];
        [percentageView4 setText:percentageNumber1];
        percentageView4.textColor = [UIColor blackColor];
        percentageView4.backgroundColor = Rgb2UIColor(240, 240, 240);
        percentageView4.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }
    
    if (percentage5 < 80 && percentage5) {
        percentageView5 = [[UITextView alloc] initWithFrame:CGRectMake(0, 105, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"5    aware - wild               %d%%", percentage5];
        [percentageView5 setText:percentageNumber1];
        percentageView5.textColor = [UIColor redColor];
        percentageView5.backgroundColor = Rgb2UIColor(250, 250, 250);
        percentageView5.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (89 < percentage5 && percentage5){
        percentageView5 = [[UITextView alloc] initWithFrame:CGRectMake(0, 105, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"5    aware - wild               %d%%", percentage5];
        [percentageView5 setText:percentageNumber1];
        percentageView5.textColor = [UIColor blueColor];
        percentageView5.backgroundColor = Rgb2UIColor(250, 250, 250);
        percentageView5.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (79 < percentage5 < 90 && percentage5){
        percentageView5 = [[UITextView alloc] initWithFrame:CGRectMake(0, 105, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"5    aware - wild               %d%%", percentage5];
        [percentageView5 setText:percentageNumber1];
        percentageView5.textColor = [UIColor grayColor];
        percentageView5.backgroundColor = Rgb2UIColor(250, 250, 250);
        percentageView5.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (!percentage5){
        percentageView5 = [[UITextView alloc] initWithFrame:CGRectMake(0, 105, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"5    aware - wild               --%%"];
        [percentageView5 setText:percentageNumber1];
        percentageView5.textColor = [UIColor blackColor];
        percentageView5.backgroundColor = Rgb2UIColor(250, 250, 250);
        percentageView5.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }
    
    if (percentage6 < 80 && percentage6) {
        percentageView6 = [[UITextView alloc] initWithFrame:CGRectMake(0, 125, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"6    advantage - wise           %d%%", percentage6];
        [percentageView6 setText:percentageNumber1];
        percentageView6.textColor = [UIColor redColor];
        percentageView6.backgroundColor = Rgb2UIColor(240, 240, 240);
        percentageView6.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (89 < percentage6 && percentage6){
        percentageView6 = [[UITextView alloc] initWithFrame:CGRectMake(0, 125, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"6    advantage - wise           %d%%", percentage6];
        [percentageView6 setText:percentageNumber1];
        percentageView6.textColor = [UIColor blueColor];
        percentageView6.backgroundColor = Rgb2UIColor(240, 240, 240);
        percentageView6.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (79 < percentage6 < 90 && percentage6){
        percentageView6 = [[UITextView alloc] initWithFrame:CGRectMake(0, 125, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"6    advantage - wise           %d%%", percentage6];
        [percentageView6 setText:percentageNumber1];
        percentageView6.textColor = [UIColor grayColor];
        percentageView6.backgroundColor = Rgb2UIColor(240, 240, 240);
        percentageView6.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (!percentage6){
        percentageView6 = [[UITextView alloc] initWithFrame:CGRectMake(0, 125, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"6    advantage - wise           --%%"];
        [percentageView6 setText:percentageNumber1];
        percentageView6.textColor = [UIColor blackColor];
        percentageView6.backgroundColor = Rgb2UIColor(240, 240, 240);
        percentageView6.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }
    
    if (percentage7 < 80 && percentage7) {
        percentageView7 = [[UITextView alloc] initWithFrame:CGRectMake(0, 145, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"7    allow - therefore          %d%%", percentage7];
        [percentageView7 setText:percentageNumber1];
        percentageView7.textColor = [UIColor redColor];
        percentageView7.backgroundColor = Rgb2UIColor(250, 250, 250);
        percentageView7.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (89 < percentage7 && percentage7){
        percentageView7 = [[UITextView alloc] initWithFrame:CGRectMake(0, 145, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"7    allow - therefore          %d%%", percentage7];
        [percentageView7 setText:percentageNumber1];
        percentageView7.textColor = [UIColor blueColor];
        percentageView7.backgroundColor = Rgb2UIColor(250, 250, 250);
        percentageView7.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (79 < percentage7 < 90 && percentage7){
        percentageView7 = [[UITextView alloc] initWithFrame:CGRectMake(0, 145, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"7    allow - therefore          %d%%", percentage7];
        [percentageView7 setText:percentageNumber1];
        percentageView7.textColor = [UIColor grayColor];
        percentageView7.backgroundColor = Rgb2UIColor(250, 250, 250);
        percentageView7.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (!percentage7){
        percentageView7 = [[UITextView alloc] initWithFrame:CGRectMake(0, 145, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"7    allow - therefore          --%%"];
        [percentageView7 setText:percentageNumber1];
        percentageView7.textColor = [UIColor blackColor];
        percentageView7.backgroundColor = Rgb2UIColor(250, 250, 250);
        percentageView7.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }
    
    if (percentage8 < 80 && percentage8) {
        percentageView8 = [[UITextView alloc] initWithFrame:CGRectMake(0, 165, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"8    accept - theory            %d%%", percentage8];
        [percentageView8 setText:percentageNumber1];
        percentageView8.textColor = [UIColor redColor];
        percentageView8.backgroundColor = Rgb2UIColor(240, 240, 240);
        percentageView8.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (89 < percentage8 && percentage8){
        percentageView8 = [[UITextView alloc] initWithFrame:CGRectMake(0, 165, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"8    accept - theory            %d%%", percentage8];
        [percentageView8 setText:percentageNumber1];
        percentageView8.textColor = [UIColor blueColor];
        percentageView8.backgroundColor = Rgb2UIColor(240, 240, 240);
        percentageView8.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (79 < percentage8 < 90 && percentage8){
        percentageView8 = [[UITextView alloc] initWithFrame:CGRectMake(0, 165, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"8    accept - theory            %d%%", percentage8];
        [percentageView8 setText:percentageNumber1];
        percentageView8.textColor = [UIColor grayColor];
        percentageView8.backgroundColor = Rgb2UIColor(240, 240, 240);
        percentageView8.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (!percentage8){
        percentageView8 = [[UITextView alloc] initWithFrame:CGRectMake(0, 165, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"8    accept - theory            --%%"];
        [percentageView8 setText:percentageNumber1];
        percentageView8.textColor = [UIColor blackColor];
        percentageView8.backgroundColor = Rgb2UIColor(240, 240, 240);
        percentageView8.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }
    
    if (percentage9 < 80 && percentage9) {
        percentageView9 = [[UITextView alloc] initWithFrame:CGRectMake(0, 185, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"9    against - wave             %d%%", percentage9];
        [percentageView9 setText:percentageNumber1];
        percentageView9.textColor = [UIColor redColor];
        percentageView9.backgroundColor = Rgb2UIColor(250, 250, 250);
        percentageView9.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (89 < percentage9 && percentage9){
        percentageView9 = [[UITextView alloc] initWithFrame:CGRectMake(0, 185, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"9    against - wave             %d%%", percentage9];
        [percentageView9 setText:percentageNumber1];
        percentageView9.textColor = [UIColor blueColor];
        percentageView9.backgroundColor = Rgb2UIColor(250, 250, 250);
        percentageView9.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (79 < percentage9 < 90 && percentage9){
        percentageView9 = [[UITextView alloc] initWithFrame:CGRectMake(0, 185, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"9    against - wave             %d%%", percentage9];
        [percentageView9 setText:percentageNumber1];
        percentageView9.textColor = [UIColor grayColor];
        percentageView9.backgroundColor = Rgb2UIColor(250, 250, 250);
        percentageView9.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (!percentage9){
        percentageView9 = [[UITextView alloc] initWithFrame:CGRectMake(0, 185, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"9    against - wave             --%%"];
        [percentageView9 setText:percentageNumber1];
        percentageView9.textColor = [UIColor blackColor];
        percentageView9.backgroundColor = Rgb2UIColor(250, 250, 250);
        percentageView9.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }
    
    if (percentage10 < 80 && percentage10) {
        percentageView10 = [[UITextView alloc] initWithFrame:CGRectMake(0, 205, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"10  benefit - trouble           %d%%", percentage10];
        [percentageView10 setText:percentageNumber1];
        percentageView10.textColor = [UIColor redColor];
        percentageView10.backgroundColor = Rgb2UIColor(240, 240, 240);
        percentageView10.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (89 < percentage10 && percentage10){
        percentageView10 = [[UITextView alloc] initWithFrame:CGRectMake(0, 205, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"10  benefit - trouble           %d%%", percentage10];
        [percentageView10 setText:percentageNumber1];
        percentageView10.textColor = [UIColor blueColor];
        percentageView10.backgroundColor = Rgb2UIColor(240, 240, 240);
        percentageView10.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (79 < percentage10 < 90 && percentage10){
        percentageView10 = [[UITextView alloc] initWithFrame:CGRectMake(0, 205, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"10  benefit - trouble           %d%%", percentage10];
        [percentageView10 setText:percentageNumber1];
        percentageView10.textColor = [UIColor grayColor];
        percentageView10.backgroundColor = Rgb2UIColor(240, 240, 240);
        percentageView10.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (!percentage10){
        percentageView10 = [[UITextView alloc] initWithFrame:CGRectMake(0, 205, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"10  benefit - trouble           --%%"];
        [percentageView10 setText:percentageNumber1];
        percentageView10.textColor = [UIColor blackColor];
        percentageView10.backgroundColor = Rgb2UIColor(240, 240, 240);
        percentageView10.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }
    
    if (percentage11 < 80 && percentage11) {
        percentageView11 = [[UITextView alloc] initWithFrame:CGRectMake(0, 225, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"11  anymore - wake              %d%%", percentage11];
        [percentageView11 setText:percentageNumber1];
        percentageView11.textColor = [UIColor redColor];
        percentageView11.backgroundColor = Rgb2UIColor(250, 250, 250);
        percentageView11.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (89 < percentage11 && percentage11){
        percentageView11 = [[UITextView alloc] initWithFrame:CGRectMake(0, 225, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"11  anymore - wake              %d%%", percentage11];
        [percentageView11 setText:percentageNumber1];
        percentageView11.textColor = [UIColor blueColor];
        percentageView11.backgroundColor = Rgb2UIColor(250, 250, 250);
        percentageView11.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (79 < percentage11 < 90 && percentage11){
        percentageView11 = [[UITextView alloc] initWithFrame:CGRectMake(0, 225, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"11  anymore - wake              %d%%", percentage11];
        [percentageView11 setText:percentageNumber1];
        percentageView11.textColor = [UIColor grayColor];
        percentageView11.backgroundColor = Rgb2UIColor(250, 250, 250);
        percentageView11.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (!percentage11){
        percentageView11 = [[UITextView alloc] initWithFrame:CGRectMake(0, 225, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"11  anymore - wake              --%%"];
        [percentageView11 setText:percentageNumber1];
        percentageView11.textColor = [UIColor blackColor];
        percentageView11.backgroundColor = Rgb2UIColor(250, 250, 250);
        percentageView11.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }
    
    if (percentage12 < 80 && percentage12) {
        percentageView12 = [[UITextView alloc] initWithFrame:CGRectMake(0, 245, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"12  alone - thin                %d%%", percentage12];
        [percentageView12 setText:percentageNumber1];
        percentageView12.textColor = [UIColor redColor];
        percentageView12.backgroundColor = Rgb2UIColor(240, 240, 240);
        percentageView12.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (89 < percentage12 && percentage12){
        percentageView12 = [[UITextView alloc] initWithFrame:CGRectMake(0, 245, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"12  alone - thin                %d%%", percentage12];
        [percentageView12 setText:percentageNumber1];
        percentageView12.textColor = [UIColor blueColor];
        percentageView12.backgroundColor = Rgb2UIColor(240, 240, 240);
        percentageView12.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (79 < percentage12 < 90 && percentage12){
        percentageView12 = [[UITextView alloc] initWithFrame:CGRectMake(0, 245, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"12  alone - thin                %d%%", percentage12];
        [percentageView12 setText:percentageNumber1];
        percentageView12.textColor = [UIColor grayColor];
        percentageView12.backgroundColor = Rgb2UIColor(240, 240, 240);
        percentageView12.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (!percentage12){
        percentageView12 = [[UITextView alloc] initWithFrame:CGRectMake(0, 245, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"12  alone - thin                --%%"];
        [percentageView12 setText:percentageNumber1];
        percentageView12.textColor = [UIColor blackColor];
        percentageView12.backgroundColor = Rgb2UIColor(240, 240, 240);
        percentageView12.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }
    
    if (percentage13 < 80 && percentage13) {
        percentageView13 = [[UITextView alloc] initWithFrame:CGRectMake(0, 265, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"13  blood - whole               %d%%", percentage13];
        [percentageView13 setText:percentageNumber1];
        percentageView13.textColor = [UIColor redColor];
        percentageView13.backgroundColor = Rgb2UIColor(250, 250, 250);
        percentageView13.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (89 < percentage13 && percentage13){
        percentageView13 = [[UITextView alloc] initWithFrame:CGRectMake(0, 265, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"13  blood - whole               %d%%", percentage13];
        [percentageView13 setText:percentageNumber1];
        percentageView13.textColor = [UIColor blueColor];
        percentageView13.backgroundColor = Rgb2UIColor(250, 250, 250);
        percentageView13.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (79 < percentage13 < 90 && percentage13){
        percentageView13 = [[UITextView alloc] initWithFrame:CGRectMake(0, 265, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"13  blood - whole               %d%%", percentage13];
        [percentageView13 setText:percentageNumber1];
        percentageView13.textColor = [UIColor grayColor];
        percentageView13.backgroundColor = Rgb2UIColor(250, 250, 250);
        percentageView13.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (!percentage13){
        percentageView13 = [[UITextView alloc] initWithFrame:CGRectMake(0, 265, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"13  blood - whole               --%%"];
        [percentageView13 setText:percentageNumber1];
        percentageView13.textColor = [UIColor blackColor];
        percentageView13.backgroundColor = Rgb2UIColor(250, 250, 250);
        percentageView13.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }
    
    if (percentage14 < 80 && percentage14) {
        percentageView14 = [[UITextView alloc] initWithFrame:CGRectMake(0, 285, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"14  coach - technology          %d%%", percentage14];
        [percentageView14 setText:percentageNumber1];
        percentageView14.textColor = [UIColor redColor];
        percentageView14.backgroundColor = Rgb2UIColor(240, 240, 240);
        percentageView14.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (89 < percentage14 && percentage14){
        percentageView14 = [[UITextView alloc] initWithFrame:CGRectMake(0, 285, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"14  coach - technology          %d%%", percentage14];
        [percentageView14 setText:percentageNumber1];
        percentageView14.textColor = [UIColor blueColor];
        percentageView14.backgroundColor = Rgb2UIColor(240, 240, 240);
        percentageView14.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (79 < percentage14 < 90 && percentage14){
        percentageView14 = [[UITextView alloc] initWithFrame:CGRectMake(0, 285, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"14  coach - technology          %d%%", percentage14];
        [percentageView14 setText:percentageNumber1];
        percentageView14.textColor = [UIColor grayColor];
        percentageView14.backgroundColor = Rgb2UIColor(240, 240, 240);
        percentageView14.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (!percentage14){
        percentageView14 = [[UITextView alloc] initWithFrame:CGRectMake(0, 285, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"14  coach - technology          --%%"];
        [percentageView14 setText:percentageNumber1];
        percentageView14.textColor = [UIColor blackColor];
        percentageView14.backgroundColor = Rgb2UIColor(240, 240, 240);
        percentageView14.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }
    
    if (percentage15 < 80 && percentage15) {
        percentageView15 = [[UITextView alloc] initWithFrame:CGRectMake(0, 305, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"15  across - yet                %d%%", percentage15];
        [percentageView15 setText:percentageNumber1];
        percentageView15.textColor = [UIColor redColor];
        percentageView15.backgroundColor = Rgb2UIColor(250, 250, 250);
        percentageView15.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (89 < percentage15 && percentage15){
        percentageView15 = [[UITextView alloc] initWithFrame:CGRectMake(0, 305, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"15  across - yet                %d%%", percentage15];
        [percentageView15 setText:percentageNumber1];
        percentageView15.textColor = [UIColor blueColor];
        percentageView15.backgroundColor = Rgb2UIColor(250, 250, 250);
        percentageView15.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (79 < percentage15 < 90 && percentage15){
        percentageView15 = [[UITextView alloc] initWithFrame:CGRectMake(0, 305, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"15  across - yet                %d%%", percentage15];
        [percentageView15 setText:percentageNumber1];
        percentageView15.textColor = [UIColor grayColor];
        percentageView15.backgroundColor = Rgb2UIColor(250, 250, 250);
        percentageView15.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (!percentage15){
        percentageView15 = [[UITextView alloc] initWithFrame:CGRectMake(0, 305, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"15  across - yet                --%%"];
        [percentageView15 setText:percentageNumber1];
        percentageView15.textColor = [UIColor blackColor];
        percentageView15.backgroundColor = Rgb2UIColor(250, 250, 250);
        percentageView15.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }
    
    if (percentage16 < 80 && percentage16) {
        percentageView16 = [[UITextView alloc] initWithFrame:CGRectMake(0, 325, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"16  academy - wealth            %d%%", percentage16];
        [percentageView16 setText:percentageNumber1];
        percentageView16.textColor = [UIColor redColor];
        percentageView16.backgroundColor = Rgb2UIColor(240, 240, 240);
        percentageView16.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (89 < percentage16 && percentage16){
        percentageView16 = [[UITextView alloc] initWithFrame:CGRectMake(0, 325, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"16  academy - wealth            %d%%", percentage16];
        [percentageView16 setText:percentageNumber1];
        percentageView16.textColor = [UIColor blueColor];
        percentageView16.backgroundColor = Rgb2UIColor(240, 240, 240);
        percentageView16.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (79 < percentage16 < 90 && percentage16){
        percentageView16 = [[UITextView alloc] initWithFrame:CGRectMake(0, 325, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"16  academy - wealth            %d%%", percentage16];
        [percentageView16 setText:percentageNumber1];
        percentageView16.textColor = [UIColor grayColor];
        percentageView16.backgroundColor = Rgb2UIColor(240, 240, 240);
        percentageView16.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (!percentage16){
        percentageView16 = [[UITextView alloc] initWithFrame:CGRectMake(0, 325, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"16  academy - wealth            --%%"];
        [percentageView16 setText:percentageNumber1];
        percentageView16.textColor = [UIColor blackColor];
        percentageView16.backgroundColor = Rgb2UIColor(240, 240, 240);
        percentageView16.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }
    
    if (percentage17 < 80 && percentage17) {
        percentageView17 = [[UITextView alloc] initWithFrame:CGRectMake(0, 345, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"17  appreciate - whether        %d%%", percentage17];
        [percentageView17 setText:percentageNumber1];
        percentageView17.textColor = [UIColor redColor];
        percentageView17.backgroundColor = Rgb2UIColor(250, 250, 250);
        percentageView17.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (89 < percentage17 && percentage17){
        percentageView17 = [[UITextView alloc] initWithFrame:CGRectMake(0, 345, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"17  appreciate - whether        %d%%", percentage17];
        [percentageView17 setText:percentageNumber1];
        percentageView17.textColor = [UIColor blueColor];
        percentageView17.backgroundColor = Rgb2UIColor(250, 250, 250);
        percentageView17.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (79 < percentage17 < 90 && percentage17){
        percentageView17 = [[UITextView alloc] initWithFrame:CGRectMake(0, 345, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"17  appreciate - whether        %d%%", percentage17];
        [percentageView17 setText:percentageNumber1];
        percentageView17.textColor = [UIColor grayColor];
        percentageView17.backgroundColor = Rgb2UIColor(250, 250, 250);
        percentageView17.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (!percentage17){
        percentageView17 = [[UITextView alloc] initWithFrame:CGRectMake(0, 345, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"17  appreciate - whether        --%%"];
        [percentageView17 setText:percentageNumber1];
        percentageView17.textColor = [UIColor blackColor];
        percentageView17.backgroundColor = Rgb2UIColor(250, 250, 250);
        percentageView17.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }
    
    if (percentage18 < 80 && percentage18) {
        percentageView18 = [[UITextView alloc] initWithFrame:CGRectMake(0, 365, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"18  argue - treat               %d%%", percentage18];
        [percentageView18 setText:percentageNumber1];
        percentageView18.textColor = [UIColor redColor];
        percentageView18.backgroundColor = Rgb2UIColor(240, 240, 240);
        percentageView18.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (89 < percentage18 && percentage18){
        percentageView18 = [[UITextView alloc] initWithFrame:CGRectMake(0, 365, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"18  argue - treat               %d%%", percentage18];
        [percentageView18 setText:percentageNumber1];
        percentageView18.textColor = [UIColor blueColor];
        percentageView18.backgroundColor = Rgb2UIColor(240, 240, 240);
        percentageView18.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (79 < percentage18 < 90 && percentage18){
        percentageView18 = [[UITextView alloc] initWithFrame:CGRectMake(0, 365, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"18  argue - treat               %d%%", percentage18];
        [percentageView18 setText:percentageNumber1];
        percentageView18.textColor = [UIColor grayColor];
        percentageView18.backgroundColor = Rgb2UIColor(240, 240, 240);
        percentageView18.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (!percentage18){
        percentageView18 = [[UITextView alloc] initWithFrame:CGRectMake(0, 365, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"18  argue - treat               --%%"];
        [percentageView18 setText:percentageNumber1];
        percentageView18.textColor = [UIColor blackColor];
        percentageView18.backgroundColor = Rgb2UIColor(240, 240, 240);
        percentageView18.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }
    
    if (percentage19 < 80 && percentage19) {
        percentageView19 = [[UITextView alloc] initWithFrame:CGRectMake(0, 385, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"19  alive - wood                %d%%", percentage19];
        [percentageView19 setText:percentageNumber1];
        percentageView19.textColor = [UIColor redColor];
        percentageView19.backgroundColor = Rgb2UIColor(250, 250, 250);
        percentageView19.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (89 < percentage19 && percentage19){
        percentageView19 = [[UITextView alloc] initWithFrame:CGRectMake(0, 385, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"19  alive - wood                %d%%", percentage19];
        [percentageView19 setText:percentageNumber1];
        percentageView19.textColor = [UIColor blueColor];
        percentageView19.backgroundColor = Rgb2UIColor(250, 250, 250);
        percentageView19.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (79 < percentage19 < 90 && percentage19){
        percentageView19 = [[UITextView alloc] initWithFrame:CGRectMake(0, 385, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"19  alive - wood                %d%%", percentage19];
        [percentageView19 setText:percentageNumber1];
        percentageView19.textColor = [UIColor grayColor];
        percentageView19.backgroundColor = Rgb2UIColor(250, 250, 250);
        percentageView19.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (!percentage19){
        percentageView19 = [[UITextView alloc] initWithFrame:CGRectMake(0, 385, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"19  alive - wood                --%%"];
        [percentageView19 setText:percentageNumber1];
        percentageView19.textColor = [UIColor blackColor];
        percentageView19.backgroundColor = Rgb2UIColor(250, 250, 250);
        percentageView19.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }
    
    if (percentage20 < 80 && percentage20) {
        percentageView20 = [[UITextView alloc] initWithFrame:CGRectMake(0, 405, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"20  achieve - worth             %d%%", percentage20];
        [percentageView20 setText:percentageNumber1];
        percentageView20.textColor = [UIColor redColor];
        percentageView20.backgroundColor = Rgb2UIColor(240, 240, 240);
        percentageView20.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (89 < percentage20 && percentage20){
        percentageView20 = [[UITextView alloc] initWithFrame:CGRectMake(0, 405, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"20  achieve - worth             %d%%", percentage20];
        [percentageView20 setText:percentageNumber1];
        percentageView20.textColor = [UIColor blueColor];
        percentageView20.backgroundColor = Rgb2UIColor(240, 240, 240);
        percentageView20.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (79 < percentage20 < 90 && percentage20){
        percentageView20 = [[UITextView alloc] initWithFrame:CGRectMake(0, 405, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"20  achieve - worth             %d%%", percentage20];
        [percentageView20 setText:percentageNumber1];
        percentageView20.textColor = [UIColor grayColor];
        percentageView20.backgroundColor = Rgb2UIColor(240, 240, 240);
        percentageView20.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (!percentage20){
        percentageView20 = [[UITextView alloc] initWithFrame:CGRectMake(0, 405, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"20  achieve - worth             --%%"];
        [percentageView20 setText:percentageNumber1];
        percentageView20.textColor = [UIColor blackColor];
        percentageView20.backgroundColor = Rgb2UIColor(240, 240, 240);
        percentageView20.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }
    
    if (percentage21 < 80 && percentage21) {
        percentageView21 = [[UITextView alloc] initWithFrame:CGRectMake(0, 425, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"21  appear - various            %d%%", percentage21];
        [percentageView21 setText:percentageNumber1];
        percentageView21.textColor = [UIColor redColor];
        percentageView21.backgroundColor = Rgb2UIColor(250, 250, 250);
        percentageView21.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (89 < percentage21 && percentage21){
        percentageView21 = [[UITextView alloc] initWithFrame:CGRectMake(0, 425, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"21  appear - various            %d%%", percentage21];
        [percentageView21 setText:percentageNumber1];
        percentageView21.textColor = [UIColor blueColor];
        percentageView21.backgroundColor = Rgb2UIColor(250, 250, 250);
        percentageView21.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (79 < percentage21 < 90 && percentage21){
        percentageView21 = [[UITextView alloc] initWithFrame:CGRectMake(0, 425, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"21  appear - various            %d%%", percentage21];
        [percentageView21 setText:percentageNumber1];
        percentageView21.textColor = [UIColor grayColor];
        percentageView21.backgroundColor = Rgb2UIColor(250, 250, 250);
        percentageView21.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (!percentage21){
        percentageView21 = [[UITextView alloc] initWithFrame:CGRectMake(0, 425, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"21  appear - various            --%%"];
        [percentageView21 setText:percentageNumber1];
        percentageView21.textColor = [UIColor blackColor];
        percentageView21.backgroundColor = Rgb2UIColor(250, 250, 250);
        percentageView21.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }
    
    if (percentage22 < 80 && percentage22) {
        percentageView22 = [[UITextView alloc] initWithFrame:CGRectMake(0, 445, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"22  actual - thief              %d%%", percentage22];
        [percentageView22 setText:percentageNumber1];
        percentageView22.textColor = [UIColor redColor];
        percentageView22.backgroundColor = Rgb2UIColor(240, 240, 240);
        percentageView22.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (89 < percentage22 && percentage22){
        percentageView22 = [[UITextView alloc] initWithFrame:CGRectMake(0, 445, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"22  actual - thief              %d%%", percentage22];
        [percentageView22 setText:percentageNumber1];
        percentageView22.textColor = [UIColor blueColor];
        percentageView22.backgroundColor = Rgb2UIColor(240, 240, 240);
        percentageView22.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (79 < percentage22 < 90 && percentage22){
        percentageView22 = [[UITextView alloc] initWithFrame:CGRectMake(0, 445, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"22  actual - thief              %d%%", percentage22];
        [percentageView22 setText:percentageNumber1];
        percentageView22.textColor = [UIColor grayColor];
        percentageView22.backgroundColor = Rgb2UIColor(240, 240, 240);
        percentageView22.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (!percentage22){
        percentageView22 = [[UITextView alloc] initWithFrame:CGRectMake(0, 445, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"22  actual - thief              --%%"];
        [percentageView22 setText:percentageNumber1];
        percentageView22.textColor = [UIColor blackColor];
        percentageView22.backgroundColor = Rgb2UIColor(240, 240, 240);
        percentageView22.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }
    
    if (percentage23 < 80 && percentage23) {
        percentageView23 = [[UITextView alloc] initWithFrame:CGRectMake(0, 465, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"23  advance - web               %d%%", percentage23];
        [percentageView23 setText:percentageNumber1];
        percentageView23.textColor = [UIColor redColor];
        percentageView23.backgroundColor = Rgb2UIColor(250, 250, 250);
        percentageView23.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (89 < percentage23 && percentage23){
        percentageView23 = [[UITextView alloc] initWithFrame:CGRectMake(0, 465, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"23  advance - web               %d%%", percentage23];
        [percentageView23 setText:percentageNumber1];
        percentageView23.textColor = [UIColor blueColor];
        percentageView23.backgroundColor = Rgb2UIColor(250, 250, 250);
        percentageView23.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (79 < percentage23 < 90 && percentage23){
        percentageView23 = [[UITextView alloc] initWithFrame:CGRectMake(0, 465, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"23  advance - web               %d%%", percentage23];
        [percentageView23 setText:percentageNumber1];
        percentageView23.textColor = [UIColor grayColor];
        percentageView23.backgroundColor = Rgb2UIColor(250, 250, 250);
        percentageView23.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (!percentage23){
        percentageView23 = [[UITextView alloc] initWithFrame:CGRectMake(0, 465, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"23  advance - web               --%%"];
        [percentageView23 setText:percentageNumber1];
        percentageView23.textColor = [UIColor blackColor];
        percentageView23.backgroundColor = Rgb2UIColor(250, 250, 250);
        percentageView23.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }
    
    if (percentage24 < 80 && percentage24) {
        percentageView24 = [[UITextView alloc] initWithFrame:CGRectMake(0, 485, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"24  block - unite               %d%%", percentage24];
        [percentageView24 setText:percentageNumber1];
        percentageView24.textColor = [UIColor redColor];
        percentageView24.backgroundColor = Rgb2UIColor(240, 240, 240);
        percentageView24.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (89 < percentage24 && percentage24){
        percentageView24 = [[UITextView alloc] initWithFrame:CGRectMake(0, 485, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"24  block - unite               %d%%", percentage24];
        [percentageView24 setText:percentageNumber1];
        percentageView24.textColor = [UIColor blueColor];
        percentageView24.backgroundColor = Rgb2UIColor(240, 240, 240);
        percentageView24.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (79 < percentage24 < 90 && percentage24){
        percentageView24 = [[UITextView alloc] initWithFrame:CGRectMake(0, 485, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"24  block - unite               %d%%", percentage24];
        [percentageView24 setText:percentageNumber1];
        percentageView24.textColor = [UIColor grayColor];
        percentageView24.backgroundColor = Rgb2UIColor(240, 240, 240);
        percentageView24.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (!percentage24){
        percentageView24 = [[UITextView alloc] initWithFrame:CGRectMake(0, 485, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"24  block - unite               --%%"];
        [percentageView24 setText:percentageNumber1];
        percentageView24.textColor = [UIColor blackColor];
        percentageView24.backgroundColor = Rgb2UIColor(240, 240, 240);
        percentageView24.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }
    
    if (percentage25 < 80 && percentage25) {
        percentageView25 = [[UITextView alloc] initWithFrame:CGRectMake(0, 505, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"25  associate - wide            %d%%", percentage25];
        [percentageView25 setText:percentageNumber1];
        percentageView25.textColor = [UIColor redColor];
        percentageView25.backgroundColor = Rgb2UIColor(250, 250, 250);
        percentageView25.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (89 < percentage25 && percentage25){
        percentageView25 = [[UITextView alloc] initWithFrame:CGRectMake(0, 505, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"25  associate - wide            %d%%", percentage25];
        [percentageView25 setText:percentageNumber1];
        percentageView25.textColor = [UIColor blueColor];
        percentageView25.backgroundColor = Rgb2UIColor(250, 250, 250);
        percentageView25.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (79 < percentage25 < 90 && percentage25){
        percentageView25 = [[UITextView alloc] initWithFrame:CGRectMake(0, 505, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"25  associate - wide            %d%%", percentage25];
        [percentageView25 setText:percentageNumber1];
        percentageView25.textColor = [UIColor grayColor];
        percentageView25.backgroundColor = Rgb2UIColor(250, 250, 250);
        percentageView25.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (!percentage25){
        percentageView25 = [[UITextView alloc] initWithFrame:CGRectMake(0, 505, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"25  associate - wide            --%%"];
        [percentageView25 setText:percentageNumber1];
        percentageView25.textColor = [UIColor blackColor];
        percentageView25.backgroundColor = Rgb2UIColor(250, 250, 250);
        percentageView25.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }
    
    if (percentage26 < 80 && percentage26) {
        percentageView26 = [[UITextView alloc] initWithFrame:CGRectMake(0, 525, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"26  advice - suggest            %d%%", percentage26];
        [percentageView26 setText:percentageNumber1];
        percentageView26.textColor = [UIColor redColor];
        percentageView26.backgroundColor = Rgb2UIColor(240, 240, 240);
        percentageView26.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (89 < percentage26 && percentage26){
        percentageView26 = [[UITextView alloc] initWithFrame:CGRectMake(0, 525, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"26  advice - suggest            %d%%", percentage26];
        [percentageView26 setText:percentageNumber1];
        percentageView26.textColor = [UIColor blueColor];
        percentageView26.backgroundColor = Rgb2UIColor(240, 240, 240);
        percentageView26.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (79 < percentage26 < 90 && percentage26){
        percentageView26 = [[UITextView alloc] initWithFrame:CGRectMake(0, 525, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"26  advice - suggest            %d%%", percentage26];
        [percentageView26 setText:percentageNumber1];
        percentageView26.textColor = [UIColor grayColor];
        percentageView26.backgroundColor = Rgb2UIColor(240, 240, 240);
        percentageView26.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (!percentage26){
        percentageView26 = [[UITextView alloc] initWithFrame:CGRectMake(0, 525, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"26  advice - suggest            --%%"];
        [percentageView26 setText:percentageNumber1];
        percentageView26.textColor = [UIColor blackColor];
        percentageView26.backgroundColor = Rgb2UIColor(240, 240, 240);
        percentageView26.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }
    
    if (percentage27 < 80 && percentage27) {
        percentageView27 = [[UITextView alloc] initWithFrame:CGRectMake(0, 545, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"27  actually - value            %d%%", percentage27];
        [percentageView27 setText:percentageNumber1];
        percentageView27.textColor = [UIColor redColor];
        percentageView27.backgroundColor = Rgb2UIColor(250, 250, 250);
        percentageView27.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (89 < percentage27 && percentage27){
        percentageView27 = [[UITextView alloc] initWithFrame:CGRectMake(0, 545, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"27  actually - value            %d%%", percentage27];
        [percentageView27 setText:percentageNumber1];
        percentageView27.textColor = [UIColor blueColor];
        percentageView27.backgroundColor = Rgb2UIColor(250, 250, 250);
        percentageView27.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (79 < percentage27 < 90 && percentage27){
        percentageView27 = [[UITextView alloc] initWithFrame:CGRectMake(0, 545, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"27  actually - value            %d%%", percentage27];
        [percentageView27 setText:percentageNumber1];
        percentageView27.textColor = [UIColor grayColor];
        percentageView27.backgroundColor = Rgb2UIColor(250, 250, 250);
        percentageView27.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (!percentage27){
        percentageView27 = [[UITextView alloc] initWithFrame:CGRectMake(0, 545, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"27  actually - value            --%%"];
        [percentageView27 setText:percentageNumber1];
        percentageView27.textColor = [UIColor blackColor];
        percentageView27.backgroundColor = Rgb2UIColor(250, 250, 250);
        percentageView27.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }
    
    if (percentage28 < 80 && percentage28) {
        percentageView28 = [[UITextView alloc] initWithFrame:CGRectMake(0, 565, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"28  band - within               %d%%", percentage28];
        [percentageView28 setText:percentageNumber1];
        percentageView28.textColor = [UIColor redColor];
        percentageView28.backgroundColor = Rgb2UIColor(240, 240, 240);
        percentageView28.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (89 < percentage28 && percentage28){
        percentageView28 = [[UITextView alloc] initWithFrame:CGRectMake(0, 565, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"28  band - within               %d%%", percentage28];
        [percentageView28 setText:percentageNumber1];
        percentageView28.textColor = [UIColor blueColor];
        percentageView28.backgroundColor = Rgb2UIColor(240, 240, 240);
        percentageView28.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (79 < percentage28 < 90 && percentage28){
        percentageView28 = [[UITextView alloc] initWithFrame:CGRectMake(0, 565, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"28  band - within               %d%%", percentage28];
        [percentageView28 setText:percentageNumber1];
        percentageView28.textColor = [UIColor grayColor];
        percentageView28.backgroundColor = Rgb2UIColor(240, 240, 240);
        percentageView28.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (!percentage28){
        percentageView28 = [[UITextView alloc] initWithFrame:CGRectMake(0, 565, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"28  band - within               --%%"];
        [percentageView28 setText:percentageNumber1];
        percentageView28.textColor = [UIColor blackColor];
        percentageView28.backgroundColor = Rgb2UIColor(240, 240, 240);
        percentageView28.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }
    
    if (percentage29 < 80 && percentage29) {
        percentageView29 = [[UITextView alloc] initWithFrame:CGRectMake(0, 585, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"29  advertise - vote            %d%%", percentage29];
        [percentageView29 setText:percentageNumber1];
        percentageView29.textColor = [UIColor redColor];
        percentageView29.backgroundColor = Rgb2UIColor(250, 250, 250);
        percentageView29.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (89 < percentage29 && percentage29){
        percentageView29 = [[UITextView alloc] initWithFrame:CGRectMake(0, 585, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"29  advertise - vote            %d%%", percentage29];
        [percentageView29 setText:percentageNumber1];
        percentageView29.textColor = [UIColor blueColor];
        percentageView29.backgroundColor = Rgb2UIColor(250, 250, 250);
        percentageView29.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (79 < percentage29 < 90 && percentage29){
        percentageView29 = [[UITextView alloc] initWithFrame:CGRectMake(0, 585, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"29  advertise - vote            %d%%", percentage29];
        [percentageView29 setText:percentageNumber1];
        percentageView29.textColor = [UIColor grayColor];
        percentageView29.backgroundColor = Rgb2UIColor(250, 250, 250);
        percentageView29.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (!percentage29){
        percentageView29 = [[UITextView alloc] initWithFrame:CGRectMake(0, 585, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"29  advertise - vote            --%%"];
        [percentageView29 setText:percentageNumber1];
        percentageView29.textColor = [UIColor blackColor];
        percentageView29.backgroundColor = Rgb2UIColor(250, 250, 250);
        percentageView29.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }
    
    if (percentage30 < 80 && percentage30) {
        percentageView30 = [[UITextView alloc] initWithFrame:CGRectMake(0, 605, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"30  above - surface             %d%%", percentage30];
        [percentageView30 setText:percentageNumber1];
        percentageView30.textColor = [UIColor redColor];
        percentageView30.backgroundColor = Rgb2UIColor(240, 240, 240);
        percentageView30.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (89 < percentage30 && percentage30){
        percentageView30 = [[UITextView alloc] initWithFrame:CGRectMake(0, 605, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"30  above - surface             %d%%", percentage30];
        [percentageView30 setText:percentageNumber1];
        percentageView30.textColor = [UIColor blueColor];
        percentageView30.backgroundColor = Rgb2UIColor(240, 240, 240);
        percentageView30.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (79 < percentage30 < 90 && percentage30){
        percentageView30 = [[UITextView alloc] initWithFrame:CGRectMake(0, 605, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"30  above - surface             %d%%", percentage30];
        [percentageView30 setText:percentageNumber1];
        percentageView30.textColor = [UIColor grayColor];
        percentageView30.backgroundColor = Rgb2UIColor(240, 240, 240);
        percentageView30.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }else if (!percentage30){
        percentageView30 = [[UITextView alloc] initWithFrame:CGRectMake(0, 605, 215, 20)];
        NSString *percentageNumber1 = [[NSString alloc] initWithFormat:@"30  above - surface             --%%"];
        [percentageView30 setText:percentageNumber1];
        percentageView30.textColor = [UIColor blackColor];
        percentageView30.backgroundColor = Rgb2UIColor(240, 240, 240);
        percentageView30.font = [UIFont fontWithName:@"American Typewriter" size:13];
    }
    
    percentageView1.contentInset = UIEdgeInsetsMake(-5, 0, 0, 0);
    [hostingView addSubview:percentageView1];
    percentageView1.editable = NO;
    percentageView1.selectable = NO;
    
    percentageView2.contentInset = UIEdgeInsetsMake(-5, 0, 0, 0);
    [hostingView addSubview:percentageView2];
    percentageView2.editable = NO;
    percentageView2.selectable = NO;
    
    percentageView3.contentInset = UIEdgeInsetsMake(-5, 0, 0, 0);
    [hostingView addSubview:percentageView3];
    percentageView3.editable = NO;
    percentageView3.selectable = NO;
    
    percentageView4.contentInset = UIEdgeInsetsMake(-5, 0, 0, 0);
    [hostingView addSubview:percentageView4];
    percentageView4.editable = NO;
    percentageView4.selectable = NO;
    
    percentageView5.contentInset = UIEdgeInsetsMake(-5, 0, 0, 0);
    [hostingView addSubview:percentageView5];
    percentageView5.editable = NO;
    percentageView5.selectable = NO;
    
    percentageView6.contentInset = UIEdgeInsetsMake(-5, 0, 0, 0);
    [hostingView addSubview:percentageView6];
    percentageView6.editable = NO;
    percentageView6.selectable = NO;
    
    percentageView7.contentInset = UIEdgeInsetsMake(-5, 0, 0, 0);
    [hostingView addSubview:percentageView7];
    percentageView7.editable = NO;
    percentageView7.selectable = NO;
    
    percentageView8.contentInset = UIEdgeInsetsMake(-5, 0, 0, 0);
    [hostingView addSubview:percentageView8];
    percentageView8.editable = NO;
    percentageView8.selectable = NO;
    
    percentageView9.contentInset = UIEdgeInsetsMake(-5, 0, 0, 0);
    [hostingView addSubview:percentageView9];
    percentageView9.editable = NO;
    percentageView9.selectable = NO;
    
    percentageView10.contentInset = UIEdgeInsetsMake(-5, 0, 0, 0);
    [hostingView addSubview:percentageView10];
    percentageView10.editable = NO;
    percentageView10.selectable = NO;
    
    percentageView11.contentInset = UIEdgeInsetsMake(-5, 0, 0, 0);
    [hostingView addSubview:percentageView11];
    percentageView11.editable = NO;
    percentageView11.selectable = NO;
    
    percentageView12.contentInset = UIEdgeInsetsMake(-5, 0, 0, 0);
    [hostingView addSubview:percentageView12];
    percentageView12.editable = NO;
    percentageView12.selectable = NO;
    
    percentageView13.contentInset = UIEdgeInsetsMake(-5, 0, 0, 0);
    [hostingView addSubview:percentageView13];
    percentageView13.editable = NO;
    percentageView13.selectable = NO;
    
    percentageView14.contentInset = UIEdgeInsetsMake(-5, 0, 0, 0);
    [hostingView addSubview:percentageView14];
    percentageView14.editable = NO;
    percentageView14.selectable = NO;
    
    percentageView15.contentInset = UIEdgeInsetsMake(-5, 0, 0, 0);
    [hostingView addSubview:percentageView15];
    percentageView15.editable = NO;
    percentageView15.selectable = NO;
    
    percentageView16.contentInset = UIEdgeInsetsMake(-5, 0, 0, 0);
    [hostingView addSubview:percentageView16];
    percentageView16.editable = NO;
    percentageView16.selectable = NO;
    
    percentageView17.contentInset = UIEdgeInsetsMake(-5, 0, 0, 0);
    [hostingView addSubview:percentageView17];
    percentageView17.editable = NO;
    percentageView17.selectable = NO;
    
    percentageView18.contentInset = UIEdgeInsetsMake(-5, 0, 0, 0);
    [hostingView addSubview:percentageView18];
    percentageView18.editable = NO;
    percentageView18.selectable = NO;
    
    percentageView19.contentInset = UIEdgeInsetsMake(-5, 0, 0, 0);
    [hostingView addSubview:percentageView19];
    percentageView19.editable = NO;
    percentageView19.selectable = NO;
    
    percentageView20.contentInset = UIEdgeInsetsMake(-5, 0, 0, 0);
    [hostingView addSubview:percentageView20];
    percentageView20.editable = NO;
    percentageView20.selectable = NO;
    
    percentageView21.contentInset = UIEdgeInsetsMake(-5, 0, 0, 0);
    [hostingView addSubview:percentageView21];
    percentageView21.editable = NO;
    percentageView21.selectable = NO;
    
    percentageView22.contentInset = UIEdgeInsetsMake(-5, 0, 0, 0);
    [hostingView addSubview:percentageView22];
    percentageView22.editable = NO;
    percentageView22.selectable = NO;
    
    percentageView23.contentInset = UIEdgeInsetsMake(-5, 0, 0, 0);
    [hostingView addSubview:percentageView23];
    percentageView23.editable = NO;
    percentageView23.selectable = NO;
    
    percentageView24.contentInset = UIEdgeInsetsMake(-5, 0, 0, 0);
    [hostingView addSubview:percentageView24];
    percentageView24.editable = NO;
    percentageView24.selectable = NO;
    
    percentageView25.contentInset = UIEdgeInsetsMake(-5, 0, 0, 0);
    [hostingView addSubview:percentageView25];
    percentageView25.editable = NO;
    percentageView25.selectable = NO;
    
    percentageView26.contentInset = UIEdgeInsetsMake(-5, 0, 0, 0);
    [hostingView addSubview:percentageView26];
    percentageView26.editable = NO;
    percentageView26.selectable = NO;
    
    percentageView27.contentInset = UIEdgeInsetsMake(-5, 0, 0, 0);
    [hostingView addSubview:percentageView27];
    percentageView27.editable = NO;
    percentageView27.selectable = NO;
    
    percentageView28.contentInset = UIEdgeInsetsMake(-5, 0, 0, 0);
    [hostingView addSubview:percentageView28];
    percentageView28.editable = NO;
    percentageView28.selectable = NO;

    percentageView29.contentInset = UIEdgeInsetsMake(-5, 0, 0, 0);
    [hostingView addSubview:percentageView29];
    percentageView29.editable = NO;
    percentageView29.selectable = NO;
    
    percentageView30.contentInset = UIEdgeInsetsMake(-5, 0, 0, 0);
    [hostingView addSubview:percentageView30];
    percentageView30.editable = NO;
    percentageView30.selectable = NO;

    // 画面にホスティングビューを追加
    [menu addSubview:hostingView];
    
}*/

@end
