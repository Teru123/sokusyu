//
//  hukusyuViewController.m
//  TestView
//
//  Created by Teru on 2013/10/03.
//  Copyright (c) 2013年 Self. All rights reserved.
//

#import "hukusyuViewController.h"
#import "sqtViewController.h"
#import "Data.h"
#import "Word.h"
#import "YosyuTableViewController.h"
#import "sqtViewController.h"
#import "HukusyuTableViewCell.h"
#import "HukusyuDetailViewController.h"
#import "HukusyuFourDetailViewController.h"
#import "Reachability.h"
#import <Social/Social.h>

@interface hukusyuViewController ()

@property (assign, nonatomic) BOOL internetActive;
@property (assign, nonatomic) BOOL hostActive;
@property (strong, nonatomic) UIAlertView *wifiAlert;

@end

@implementation hukusyuViewController

@synthesize failedWordInfos, failedWord;
@synthesize actionButtonItems, checkMenu;
CAShapeLayer *openMenuShape;
#define Rgb2UIColor(r, g, b)  [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0]

-(void) viewWillAppear:(BOOL)animated
{
    // ハイライト解除
    [super viewWillAppear:animated];
    
    // check for internet connection
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(checkNetworkStatus:) name:kReachabilityChangedNotification object:nil];
    
    internetReachable = [Reachability reachabilityForInternetConnection];
    [internetReachable startNotifier];
    
    // check if a pathway to a random host exists
    hostReachable = [Reachability reachabilityWithHostName:@"www.apple.com"];
    [hostReachable startNotifier];
    
    // now patiently wait for the notification
    
    Data *dataController = [[Data alloc]init];
    [dataController initDatabase];
    
    NSArray* words = [dataController failedWordInfos];
    failedWordInfos = words;
    
    if ([failedWordInfos count] > 0) {
        textForExplanation.text = [NSString stringWithFormat:@"表示された単語を左右にスライドすることで単語を検索、削除する事が出来ます。\n\n左にスライドして削除タップで削除\n右にスライドして検索タップで自動検索"];
        textForExplanation.textAlignment = NSTextAlignmentCenter;
        textForExplanation.backgroundColor = Rgb2UIColor(6, 93, 181);
        textForExplanation.textColor = [UIColor whiteColor];
        UIFont *boldFont = [UIFont boldSystemFontOfSize:[UIFont systemFontSize]];
        textForExplanation.font = boldFont;
        textForExplanation.font = [UIFont fontWithName:@"American Typewriter" size:15];
    }else{
        textForExplanation.text = [NSString stringWithFormat:@"\n保存した単語を表示します。\n\n詳しくは復習の使い方をご覧下さい。"];
        textForExplanation.textAlignment = NSTextAlignmentCenter;
        textForExplanation.backgroundColor = Rgb2UIColor(6, 93, 181);
        textForExplanation.textColor = [UIColor whiteColor];
        UIFont *boldFont = [UIFont boldSystemFontOfSize:[UIFont systemFontSize]];
        textForExplanation.font = boldFont;
        textForExplanation.font = [UIFont fontWithName:@"American Typewriter" size:15];
    }
    
    
    // Fetch the devices from persistent data store
    [tableViewOutlet reloadData];
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
    
}

-(void) viewWillDisappear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
    self.edgesForExtendedLayout=UIRectEdgeNone;
    self.extendedLayoutIncludesOpaqueBars=NO;
    self.automaticallyAdjustsScrollViewInsets=NO;
    */
    
    self.tableView.rowHeight = 44;
    
    Data *dataController = [[Data alloc]init];
    [dataController initDatabase];
    
    NSArray* words = [dataController failedWordInfos];
    failedWordInfos = words;
    
    // Fetch the devices from persistent data store
    [tableViewOutlet reloadData];
    
    if ([failedWordInfos count] > 0) {
        textForExplanation.text = [NSString stringWithFormat:@"表示された単語を左右にスライドすることで単語を検索、削除する事が出来ます。\n\n左にスライドして削除タップで削除\n右にスライドして検索タップで自動検索"];
        textForExplanation.textAlignment = NSTextAlignmentCenter;
        textForExplanation.backgroundColor = Rgb2UIColor(6, 93, 181);
        textForExplanation.textColor = [UIColor whiteColor];
        UIFont *boldFont = [UIFont boldSystemFontOfSize:[UIFont systemFontSize]];
        textForExplanation.font = boldFont;
        textForExplanation.font = [UIFont fontWithName:@"American Typewriter" size:15];
    }else{
        textForExplanation.text = [NSString stringWithFormat:@"\n保存した単語を表示します。\n\n詳しくは復習の使い方をご覧下さい。"];
        textForExplanation.textAlignment = NSTextAlignmentCenter;
        textForExplanation.backgroundColor = Rgb2UIColor(6, 93, 181);
        textForExplanation.textColor = [UIColor whiteColor];
        UIFont *boldFont = [UIFont boldSystemFontOfSize:[UIFont systemFontSize]];
        textForExplanation.font = boldFont;
        textForExplanation.font = [UIFont fontWithName:@"American Typewriter" size:15];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    // 行グループの数
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    // 行の数
    return [failedWordInfos count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*
    static NSString *simpleTableIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier forIndexPath:indexPath];;
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
     */
    
    static NSString *cellIdentifier = @"Cell";
    
    HukusyuTableViewCell *cell = (HukusyuTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    NSMutableArray *leftUtilityButtons = [NSMutableArray new];
    NSMutableArray *rightUtilityButtons = [NSMutableArray new];
    
    [leftUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:0.024f green:0.365f blue:0.71f alpha:0.6]
                                                title:@"検索"];
    
    [rightUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:1.0f green:0.231f blue:0.188 alpha:1.0f]
                                                title:@"削除"];
    
    cell.leftUtilityButtons = leftUtilityButtons;
    cell.rightUtilityButtons = rightUtilityButtons;
    cell.delegate = self;
    
	// セルの値を更新
    // Set up the cell...
    Word *info = [failedWordInfos objectAtIndex:indexPath.row];
    cell.patternLabel.text = info.word;
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    //[cell.textLabel  setText:info.word];
    //cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    //cell.textLabel.font = [UIFont fontWithName:@"Bradley Hand" size:18];
    
    return cell;
}

- (void)swipeableTableViewCell:(SWTableViewCell *)cell didTriggerLeftUtilityButtonWithIndex:(NSInteger)index {
    
    switch (index) {
        case 0:
        {
            #define IS_IPHONE5 (([[UIScreen mainScreen] bounds].size.height-568)?NO:YES)
            if (IS_IPHONE5) {
                NSIndexPath *cellIndexPath = [self.tableView indexPathForCell:cell];
                Word *info = [failedWordInfos objectAtIndex:cellIndexPath.row];
                HukusyuDetailViewController *detailView = [[HukusyuDetailViewController alloc] init];
                detailView.wordNameForString = info.word;
                [self presentViewController:detailView animated:YES completion:nil];
            }else{
                NSIndexPath *cellIndexPath = [self.tableView indexPathForCell:cell];
                Word *info = [failedWordInfos objectAtIndex:cellIndexPath.row];
                HukusyuFourDetailViewController *detailView = [[HukusyuFourDetailViewController alloc] init];
                detailView.wordNameForString = info.word;
                [self presentViewController:detailView animated:YES completion:nil];
            }
            break;
        }
        default:
            break;
    }
}

- (void)swipeableTableViewCell:(SWTableViewCell *)cell didTriggerRightUtilityButtonWithIndex:(NSInteger)index {
    switch (index) {
        case 0:
        {
            
            // Delete button is pressed
            NSIndexPath *cellIndexPath = [self.tableView indexPathForCell:cell];
            
            Data *dataController = [[Data alloc]init];
            [dataController initDatabase];
            
            Word *info = [failedWordInfos objectAtIndex:cellIndexPath.row];
            [dataController deleteParticularData:info.uniqueId];
            
            break;
        }
        default:
            break;
    }
    Data *dataController = [[Data alloc]init];
    [dataController initDatabase];
    
    NSArray* words = [dataController failedWordInfos];
    failedWordInfos = words;
    
    if ([failedWordInfos count] > 0) {
        textForExplanation.text = [NSString stringWithFormat:@"表示された単語を左右にスライドすることで単語を検索、削除する事が出来ます。\n\n左にスライドして削除タップで削除\n右にスライドして検索タップで自動検索"];
        textForExplanation.textAlignment = NSTextAlignmentCenter;
        textForExplanation.backgroundColor = Rgb2UIColor(6, 93, 181);
        textForExplanation.textColor = [UIColor whiteColor];
        UIFont *boldFont = [UIFont boldSystemFontOfSize:[UIFont systemFontSize]];
        textForExplanation.font = boldFont;
        textForExplanation.font = [UIFont fontWithName:@"American Typewriter" size:15];
    }else{
        textForExplanation.text = [NSString stringWithFormat:@"\n保存した単語を表示します。\n\n詳しくは復習の使い方をご覧下さい。"];
        textForExplanation.textAlignment = NSTextAlignmentCenter;
        textForExplanation.backgroundColor = Rgb2UIColor(6, 93, 181);
        textForExplanation.textColor = [UIColor whiteColor];
        UIFont *boldFont = [UIFont boldSystemFontOfSize:[UIFont systemFontSize]];
        textForExplanation.font = boldFont;
        textForExplanation.font = [UIFont fontWithName:@"American Typewriter" size:15];
    }
    
    [tableViewOutlet reloadData];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        Data *dataController = [[Data alloc]init];
        [dataController initDatabase];
        [dataController deleteData];
        
        NSArray* words = [dataController failedWordInfos];
        failedWordInfos = words;
        
        if ([failedWordInfos count] > 0) {
            textForExplanation.text = [NSString stringWithFormat:@"表示された単語を左右にスライドすることで単語を検索、削除する事が出来ます。\n\n左にスライドして削除タップで削除\n右にスライドして検索タップで自動検索"];
            textForExplanation.textAlignment = NSTextAlignmentCenter;
            textForExplanation.backgroundColor = Rgb2UIColor(6, 93, 181);
            textForExplanation.textColor = [UIColor whiteColor];
            UIFont *boldFont = [UIFont boldSystemFontOfSize:[UIFont systemFontSize]];
            textForExplanation.font = boldFont;
            textForExplanation.font = [UIFont fontWithName:@"American Typewriter" size:15];
        }else{
            textForExplanation.text = [NSString stringWithFormat:@"\n保存した単語を表示します。\n\n詳しくは復習の使い方をご覧下さい。"];
            textForExplanation.textAlignment = NSTextAlignmentCenter;
            textForExplanation.backgroundColor = Rgb2UIColor(6, 93, 181);
            textForExplanation.textColor = [UIColor whiteColor];
            UIFont *boldFont = [UIFont boldSystemFontOfSize:[UIFont systemFontSize]];
            textForExplanation.font = boldFont;
            textForExplanation.font = [UIFont fontWithName:@"American Typewriter" size:15];
        }


        [tableViewOutlet reloadData];
    }
}

- (IBAction)resetButton:(id)sender {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"削除しますか？" message:@"保存した単語を全て削除します。" delegate:self cancelButtonTitle:@"いいえ" otherButtonTitles:@"はい", nil];
    [alertView show];
}

/*
- (IBAction)refreshButton:(id)sender {
    UIAlertView *alertViewForWords = [[UIAlertView alloc] initWithTitle:@"更新しました" message:@"" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alertViewForWords show];
    
    Data *dataController = [[Data alloc]init];
    [dataController initDatabase];
    
    NSArray* words = [dataController failedWordInfos];
    failedWordInfos = words;
    
    if ([failedWordInfos count] > 0) {
        textForExplanation.text = [NSString stringWithFormat:@"表示された単語を左右にスライドすることで単語を検索、削除する事が出来ます。\n\n左にスライドして削除タップで削除\n右にスライドして検索タップで自動検索"];
        textForExplanation.textAlignment = NSTextAlignmentCenter;
        textForExplanation.backgroundColor = Rgb2UIColor(6, 93, 181);
        textForExplanation.textColor = [UIColor whiteColor];
        UIFont *boldFont = [UIFont boldSystemFontOfSize:[UIFont systemFontSize]];
        textForExplanation.font = boldFont;
        textForExplanation.font = [UIFont fontWithName:@"American Typewriter" size:15];
    }else{
        textForExplanation.text = [NSString stringWithFormat:@"\n保存した単語を表示します。\n\n詳しくは復習の使い方をご覧下さい。"];
        textForExplanation.textAlignment = NSTextAlignmentCenter;
        textForExplanation.backgroundColor = Rgb2UIColor(6, 93, 181);
        textForExplanation.textColor = [UIColor whiteColor];
        UIFont *boldFont = [UIFont boldSystemFontOfSize:[UIFont systemFontSize]];
        textForExplanation.font = boldFont;
        textForExplanation.font = [UIFont fontWithName:@"American Typewriter" size:15];
    }
    
    
    // Fetch the devices from persistent data store
    [tableViewOutlet reloadData];
}*/

@end
