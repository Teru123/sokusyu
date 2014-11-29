//
//  GraphTableViewController.m
//  sokusyu-eitango
//
//  Created by Teru on 2014/05/11.
//  Copyright (c) 2014年 Self. All rights reserved.
//

#import "GraphTableViewController.h"
#import "Score.h"
#import "ScoreData.h"
#import "ScoreOfDayOfTheWeek.h"
#import "GetAndSetScoreOfDayOfTheWeek.h"
#import <Social/Social.h>

// 折れ線グラフの識別子
NSString *const kData   = @"Data Source Plot";

@interface GraphTableViewController ()

@end

@implementation GraphTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // セクション名を設定する
    sectionList =  [NSArray arrayWithObjects:@" ", nil];
    
    // セルの項目を作成する
    NSArray *share = [NSArray arrayWithObjects:@"ウェブサイト お問い合わせ", @"速習英単語のレビューを書く", @"速習英単語２を無料でダウンロード", nil];
    
    // セルの項目をまとめる
    NSArray *datas = [NSArray arrayWithObjects:share, nil];
    dataSource = [NSDictionary dictionaryWithObjects:datas forKeys:sectionList];
    
    //曜日取得 Sun = 1 Mon = 2
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *comps = [gregorian components:NSWeekdayCalendarUnit fromDate:[NSDate date]];
    int weekday = (int)[comps weekday];
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
            /*
             for (int i = 1; i < 8; i++) {
             GetAndSetScoreOfDayOfTheWeek *ScoreOfDayOfTheWeek  =
             [[GetAndSetScoreOfDayOfTheWeek alloc] initWithUniqueId:0 andScore:0];
             [scoreDataController updateScore:ScoreOfDayOfTheWeek];
             
             if ([scoreDataController Scores:i]) {
             GetAndSetScoreOfDayOfTheWeek *scoreOfDay7 = [scoreListOfDayOfTheWeek objectAtIndex:i];
             GetAndSetScoreOfDayOfTheWeek *ScoreOfDayOfTheWeek  =
             [[GetAndSetScoreOfDayOfTheWeek alloc] initWithUniqueId:0 andScore:scoreOfDay7.score];
             NSLog(@"%d, %f", i, scoreOfDay7.score);
             // Update the score
             NSLog(@"Update!");
             [scoreDataController updateScore:ScoreOfDayOfTheWeek];
             }
             
             }
             
             for (int r = 2; r < 8; r++) {
             NSLog(@"5to7!");
             if ([scoreDataController Scores:r]) {
             GetAndSetScoreOfDayOfTheWeek *scoreOfDay7 = [scoreListOfDayOfTheWeek objectAtIndex:r];
             for (int a = 1; a < scoreListOfDayOfTheWeek.count; a++) {
             GetAndSetScoreOfDayOfTheWeek *ScoreOfDayOfTheWeek  =
             [[GetAndSetScoreOfDayOfTheWeek alloc] initWithUniqueId:a andScore:scoreOfDay7.score];
             if ([scoreDataController Scores:a]) {
             NSLog(@"Update!");
             [scoreDataController updateScore:ScoreOfDayOfTheWeek];
             }else if (![scoreDataController Scores:a]){
             // Insert the score
             [scoreDataController insertScore:ScoreOfDayOfTheWeek];
             NSLog(@"Insert!");
             }
             NSLog(@"%d, %f", a, scoreOfDay7.score);
             }
             }
             }
             */
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
}


- (IBAction)shareButton:(id)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"共有する"
                                                             delegate:self
                                                    cancelButtonTitle:@"Cancel"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"LINE", @"Twitter", @"Facebook", nil];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        // In this case the device is an iPad.
        [actionSheet showFromRect:[(UIButton *)sender frame] inView:self.view animated:YES];
    }
    else{
        // In this case the device is an iPhone/iPod Touch.
        [actionSheet showInView:self.view];
    }
    
    //actionSheet.tag = 100;
}

#pragma mark - UIActionSheet method implementation

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if ([[actionSheet buttonTitleAtIndex:buttonIndex] isEqualToString:@"LINE"]) {
        [self lineButton];
    }
    else if ([[actionSheet buttonTitleAtIndex:buttonIndex] isEqualToString:@"Twitter"]){
        [self twitterButton];
    }
    else if ([[actionSheet buttonTitleAtIndex:buttonIndex] isEqualToString:@"Facebook"]){
        [self facebookButton];
    }
    
    //NSLog(@"Index = %d - Title = %@", buttonIndex, [actionSheet buttonTitleAtIndex:buttonIndex]);
}

/**
 * テーブル全体のセクションの数を返す
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [sectionList count];
}

/**
 * 指定されたセクションのセクション名を返す
 */
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [sectionList objectAtIndex:section];
}

/**
 * 指定されたセクションの項目数を返す
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString *sectionName = [sectionList objectAtIndex:section];
    return [[dataSource objectForKey:sectionName ]count];
}

/**
 * 指定された箇所のセルを作成する
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    // セルが作成されていないか?
    if (!cell) { // yes
        // セルを作成
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    // セクション名を取得する
    NSString *sectionName = [sectionList objectAtIndex:indexPath.section];
    
    // セクション名をキーにしてそのセクションの項目をすべて取得
    NSArray *items = [dataSource objectForKey:sectionName];
    
    // セルにテキストを設定
    cell.textLabel.text = [items objectAtIndex:indexPath.row];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

/**
 * セルが選択されたとき
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // セクション名を取得する
    NSString *sectionName = [sectionList objectAtIndex:indexPath.section];
    if (indexPath.section == 0)
    {
        // セクション名をキーにしてそのセクションの項目をすべて取得
        NSArray *items = [dataSource objectForKey:sectionName];
        if ([[items objectAtIndex:indexPath.row] isEqualToString:@"速習英単語のレビューを書く"]) {
            [self reviewButton];
        }else if ([[items objectAtIndex:indexPath.row] isEqualToString:@"ウェブサイト お問い合わせ"]){
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.sokusyueitango.com"]];
        }else if ([[items objectAtIndex:indexPath.row] isEqualToString:@"速習英単語２を無料でダウンロード"]){
            [self reviewButton2];
        }
    }
}


- (void)twitterButton{
    SLComposeViewController *tweetSheet = [SLComposeViewController
                                           composeViewControllerForServiceType:SLServiceTypeTwitter];
    //[tweetSheet setInitialText:@"英単語学習アプリ「速習英単語」 例文と音声付き 基礎英単語600語以上を収録 http://www.sokusyueitango.com/"];
    [self presentViewController:tweetSheet animated:YES completion:nil];
    
    //[self toggleMenu];
}

- (void)facebookButton{
    SLComposeViewController *controller = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    
    //[controller setInitialText:@"英単語学習アプリ「速習英単語」 例文と音声付き 基礎英単語600語以上を収録 http://www.sokusyueitango.com/"];
    [self presentViewController:controller animated:YES completion:Nil];
    
    //[self toggleMenu];
}

- (void)lineButton{
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
        
        // LINE のサイトに遷移して、アプリが入っている場合はラインにリダイレクトする方法。
        NSString *urlString = [NSString
                               stringWithFormat: @"http://line.naver.jp/R/msg/%@/?%@",
                               contentType, contentKey];
        NSURL *url = [NSURL URLWithString:urlString];
        /*
         // LINE に直接遷移。contentType で画像を指定する事もできる。アプリが入っていない場合は何も起きない。
         NSString *urlString2 = [NSString
         stringWithFormat:@"line://msg/%@/%@",
         contentType, contentKey];
         NSURL *url = [NSURL URLWithString:urlString2];
         */
        
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
        /*
         // LINE に直接遷移。contentType で画像を指定する事もできる。アプリが入っていない場合は何も起きない。
         NSString *urlString2 = [NSString
         stringWithFormat:@"line://msg/%@/%@",
         contentType, contentKey];
         NSURL *url = [NSURL URLWithString:urlString2];
         */
        
        [[UIApplication sharedApplication] openURL:url];
    }
}

- (void)reviewButton{
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

- (void)reviewButton2{
    // AppStoreのレビューURLを開く (引数に AppStoreのアプリIDを指定)
    // レビュー画面の URL
    NSString *reviewUrl;
    
    // iOSのバージョンを判別
    NSString *osversion = [UIDevice currentDevice].systemVersion;
    NSArray *a = [osversion componentsSeparatedByString:@"."];
    BOOL isIOS7 = [(NSString *)[a objectAtIndex:0] intValue] >= 7;
    if (isIOS7) {
        // iOS 7以降
        reviewUrl = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/app/id%@", @"894481309"];
    } else {
        // iOS 7未満
        reviewUrl = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id=%@&onlyLatestVersion=true&pageNumber=0&sortOrdering=1&type=Purple+Software", @"894481309"];
    }
    
    // レビュー画面へ遷移
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:reviewUrl]];
    
    //[self toggleMenu];
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


- (void) drawGraph {
    // ホスティングビューを生成
    hostingView = [[CPTGraphHostingView alloc] initWithFrame:CGRectMake(0, -40, 320, 320)];
    // 画面にホスティングビューを追加
    [graphView addSubview:hostingView];
    
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
    textStyle.color                = [CPTColor colorWithComponentRed:0.0f green:0.706f blue:0.0f alpha:0.9f];
    textStyle.fontSize             = 13.0f;
    textStyle.textAlignment        = CPTTextAlignmentCenter;
    
    CPTMutableTextStyle *titleStyle = [CPTTextStyle textStyle];
    titleStyle.color                = [CPTColor colorWithComponentRed:0.0f green:0.706f blue:0.0f alpha:0.7f];
    titleStyle.fontSize             = 13.0f;
    titleStyle.textAlignment        = CPTTextAlignmentCenter;
    
    // ラインスタイル
    CPTMutableLineStyle *lineStyle = [CPTMutableLineStyle lineStyle];
    lineStyle.lineColor            = [CPTColor colorWithComponentRed:0.0f green:0.706f blue:0.0f alpha:0.2f];
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
    barPlot.fill = [CPTFill fillWithColor:[CPTColor colorWithComponentRed:0.259f green:0.616f blue:0.976f alpha:1.0f]];
    
    barPlot.lineStyle = lineStyle;
    //barPlot.baseValue  = CPTDecimalFromString(@"0");
    //barPlot.dataSource = self;
    barPlot.barWidth = CPTDecimalFromFloat(0.7f);
    //barPlot.barOffset  = CPTDecimalFromFloat(0.5f);
    
    /*
     // 折れ線グラフのスタイルを設定
     CPTMutableLineStyle *graphlineStyle = [scatterPlot.dataLineStyle mutableCopy];
     graphlineStyle.lineWidth = 3;                    // 太さ
     graphlineStyle.lineColor = [CPTColor greenColor];// 色
     scatterPlot.dataLineStyle = graphlineStyle;
     */
    
    // グラフに折れ線グラフを追加
    [graph addPlot:barPlot];
    //[graph addPlot:barPlot];
}


/*
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
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
