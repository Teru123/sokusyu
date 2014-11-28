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
#import <Social/Social.h>

@interface hukusyuViewController ()

@end

@implementation hukusyuViewController

@synthesize failedWordInfos, failedWord;
@synthesize actionButtonItems, checkMenu;
CAShapeLayer *openMenuShape;
#define Rgb2UIColor(r, g, b)  [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0]

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
    /*
    UIBarButtonItem *refreshItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refreshItem:)];
    UIBarButtonItem *trashItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(trashItem:)];
    
    actionButtonItems = @[trashItem, refreshItem];
    self.navigationItem.leftBarButtonItems = actionButtonItems;
    */
    if ([failedWordInfos count] > 0) {
        textForExplanation.text = [NSString stringWithFormat:@"表示された単語を左右にスライドすることで単語を検索、削除する事が出来ます。\n\n左にスライドして削除タップで削除\n右にスライドして検索タップで自動検索"];
        textForExplanation.textAlignment = NSTextAlignmentCenter;
        textForExplanation.backgroundColor = Rgb2UIColor(6, 93, 181);
        textForExplanation.textColor = [UIColor whiteColor];
        UIFont *boldFont = [UIFont boldSystemFontOfSize:[UIFont systemFontSize]];
        textForExplanation.font = boldFont;
        textForExplanation.font = [UIFont fontWithName:@"American Typewriter" size:15];
    }else{
        textForExplanation.text = [NSString stringWithFormat:@"保存した単語を表示します。\n保存方法: テストで問題を間違えた際に、Scoreの右側にSaveボタンが表示されますので、それをタップ。その後、復習画面に戻り画面左上のボタンで更新してください。"];
        textForExplanation.textAlignment = NSTextAlignmentCenter;
        textForExplanation.backgroundColor = Rgb2UIColor(6, 93, 181);
        textForExplanation.textColor = [UIColor whiteColor];
        UIFont *boldFont = [UIFont boldSystemFontOfSize:[UIFont systemFontSize]];
        textForExplanation.font = boldFont;
        textForExplanation.font = [UIFont fontWithName:@"American Typewriter" size:15];
    }
}
/*
-(void)refreshItem:(UIBarButtonItem *)sender{
        UIAlertView *alertViewForWords = [[UIAlertView alloc] initWithTitle:@"更新完了" message:@"" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertViewForWords show];
        
        Data *dataController = [[Data alloc]init];
        [dataController initDatabase];
        
        NSArray* words = [dataController failedWordInfos];
        failedWordInfos = words;
        
        if ([failedWordInfos count] > 0) {
            textForExplanation.text = [NSString stringWithFormat:@"左にスライドしてDeleteタップで単語を削除"];
            textForExplanation.textAlignment = NSTextAlignmentCenter;
            textForExplanation.backgroundColor = Rgb2UIColor(6, 93, 181);
            textForExplanation.textColor = [UIColor whiteColor];
            UIFont *boldFont = [UIFont boldSystemFontOfSize:[UIFont systemFontSize]];
            textForExplanation.font = boldFont;
            textForExplanation.font = [UIFont fontWithName:@"American Typewriter" size:15];
        }else{
            textForExplanation.text = [NSString stringWithFormat:@"保存した単語を更新実行で表示"];
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

-(void)trashItem:(UIBarButtonItem *)sender{
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"削除しますか？" message:@"未更新単語を含め全て削除" delegate:self cancelButtonTitle:@"いいえ" otherButtonTitles:@"はい", nil];
        [alertView show];
}
*/
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

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

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
        textForExplanation.text = [NSString stringWithFormat:@"保存した単語を表示します。\n保存方法: テストで問題を間違えた際に、Scoreの右側にSaveボタンが表示されますので、それをタップ。その後、復習画面に戻り画面左上のボタンで更新してください。"];
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
            textForExplanation.text = [NSString stringWithFormat:@"保存した単語を表示します。\n保存方法: テストで問題を間違えた際に、Scoreの右側にSaveボタンが表示されますので、それをタップ。その後、復習画面に戻り画面左上のボタンで更新してください。"];
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
        textForExplanation.text = [NSString stringWithFormat:@"保存した単語を表示します。\n保存方法: テストで問題を間違えた際に、Scoreの右側にSaveボタンが表示されますので、それをタップ。その後、復習画面に戻り画面左上のボタンで更新してください。"];
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

- (IBAction)resetButton:(id)sender {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"削除しますか？" message:@"未更新の単語を含め全て削除" delegate:self cancelButtonTitle:@"いいえ" otherButtonTitles:@"はい", nil];
    [alertView show];
}



/*
 //セルが選択された時の挙動を決定する。
 - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    Word *info = [failedWordInfos objectAtIndex:indexPath.row];
    UIAlertView *messageAlert = [[UIAlertView alloc]
                                 initWithTitle:@"選択完了" message:info.word delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    // Display the Hello World Message
    [messageAlert show];
    
    // Checked the selected row
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
 
    
}*/

/*
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
        if (editingStyle == UITableViewCellEditingStyleDelete) {
            Data *dataController = [[Data alloc]init];
            [dataController initDatabase];
            NSArray* words = [dataController failedWordInfos];
            failedWordInfos = words;
            Word *info = [failedWordInfos objectAtIndex:indexPath.row];
            [dataController deleteParticularData:info.uniqueId];
        }
        
        Data *dataController = [[Data alloc]init];
        [dataController initDatabase];
        
        NSArray* words = [dataController failedWordInfos];
        failedWordInfos = words;
        
        if ([failedWordInfos count] > 0) {
            textForExplanation.text = [NSString stringWithFormat:@"左にスライドしてDeleteタップで単語を削除"];
            textForExplanation.textAlignment = NSTextAlignmentCenter;
            textForExplanation.backgroundColor = Rgb2UIColor(6, 93, 181);
            textForExplanation.textColor = [UIColor whiteColor];
            UIFont *boldFont = [UIFont boldSystemFontOfSize:[UIFont systemFontSize]];
            textForExplanation.font = boldFont;
            textForExplanation.font = [UIFont fontWithName:@"American Typewriter" size:15];
        }else{
            textForExplanation.text = [NSString stringWithFormat:@"保存した単語を更新実行で表示"];
            textForExplanation.textAlignment = NSTextAlignmentCenter;
            textForExplanation.backgroundColor = Rgb2UIColor(6, 93, 181);
            textForExplanation.textColor = [UIColor whiteColor];
            UIFont *boldFont = [UIFont boldSystemFontOfSize:[UIFont systemFontSize]];
            textForExplanation.font = boldFont;
            textForExplanation.font = [UIFont fontWithName:@"American Typewriter" size:15];
        }
        
        // Request table view to reload
        [tableView reloadData];
    
}
 */
 
/*
- (IBAction)shareAction:(id)sender {
    
    menu.frame = CGRectMake(0, 35, 320, 200);
    
    UIButton *twitterButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
    twitterButton.backgroundColor = Rgb2UIColor(85, 172, 238);
    [twitterButton addTarget:self action:@selector(twitterButton:) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *twitterImage = [[UIImageView alloc] initWithFrame:CGRectMake(78, 13, 27, 23)];
    twitterImage.image = [UIImage imageNamed:@"Twitter_logo_white.png"];
    [twitterButton addSubview:twitterImage];
    
    [twitterButton setTitle:@"Twitter" forState:UIControlStateNormal];
    twitterButton.titleLabel.font = [UIFont fontWithName:@"Bradley Hand" size:18];
    twitterButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    twitterButton.titleLabel.textColor = [UIColor whiteColor];
    
    UIButton *facebookButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 50, 320, 50)];
    facebookButton.backgroundColor = Rgb2UIColor(59, 89, 152);
    [facebookButton addTarget:self action:@selector(facebookButton:) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *facebookImage = [[UIImageView alloc] initWithFrame:CGRectMake(78, 12, 27, 27)];
    facebookImage.image = [UIImage imageNamed:@"FB-Logo-white.png"];
    [facebookButton addSubview:facebookImage];
    
    [facebookButton setTitle:@"Facebook" forState:UIControlStateNormal];
    facebookButton.titleLabel.font = [UIFont fontWithName:@"Bradley Hand" size:18];
    facebookButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    facebookButton.titleLabel.textColor = [UIColor whiteColor];
    
    UIButton *reviewButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 100, 320, 50)];
    reviewButton.backgroundColor = Rgb2UIColor(126, 135, 139);
    [reviewButton addTarget:self action:@selector(reviewButton:) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *reviewImage = [[UIImageView alloc] initWithFrame:CGRectMake(76, 8, 31, 31)];
    reviewImage.image = [UIImage imageNamed:@"social-apple-white.png"];
    [reviewButton addSubview:reviewImage];
    
    [reviewButton setTitle:@"レビューを書く" forState:UIControlStateNormal];
    reviewButton.titleLabel.font = [UIFont fontWithName:@"American Typewriter" size:13];
    reviewButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    reviewButton.titleLabel.textColor = [UIColor whiteColor];
    
    UILabel *description = [[UILabel alloc] initWithFrame:CGRectMake(0, 150, 320, 50)];
    description.backgroundColor = Rgb2UIColor(78, 255, 78);
    description.text = [NSString stringWithFormat:@"右上のButtonタップでこのメニューを閉じます"];
    description.textAlignment = NSTextAlignmentCenter;
    description.font = [UIFont fontWithName:@"American Typewriter" size:7];
    description.textColor = [UIColor whiteColor];
    UIFont *boldFont = [UIFont boldSystemFontOfSize:[UIFont systemFontSize]];
    description.font = boldFont;
    
 
     twitterButton.layer.cornerRadius = 80.0f;
     facebookButton.layer.cornerRadius = 7.5f;
     reviewButton.layer.cornerRadius = 38.0f;
 
    
    [menu addSubview:twitterButton];
    [menu addSubview:facebookButton];
    [menu addSubview:reviewButton];
    [menu addSubview:description];
    
    self.tableView.contentOffset = CGPointMake(0, 0 - self.tableView.contentInset.top);
    
    [self toggleMenu];
}


- (void)twitterButton:(UIButton *)sender{
    SLComposeViewController *tweetSheet = [SLComposeViewController
                                           composeViewControllerForServiceType:SLServiceTypeTwitter];
    [tweetSheet setInitialText:@"英単語学習アプリ「速習英単語」 例文と音声付き 基礎英単語600語以上を収録 http://www.sokusyueitango.com/"];
    [self presentViewController:tweetSheet animated:YES completion:nil];
    
    [self toggleMenu];
}

- (void)facebookButton:(UIButton *)sender{
    SLComposeViewController *controller = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    
    [controller setInitialText:@"英単語学習アプリ「速習英単語」 例文と音声付き 基礎英単語600語以上を収録 http://www.sokusyueitango.com/"];
    [self presentViewController:controller animated:YES completion:Nil];
    
    [self toggleMenu];
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
    
    [self toggleMenu];
}

- (void) toggleMenu {
    if(menu.hidden) {
        [self showMenu];
    } else {
        [self hideMenu];
    }
}

- (void) showMenu {
    menu.hidden = NO;
}

- (void) hideMenu {
    menu.hidden = YES;
}
*/

@end
