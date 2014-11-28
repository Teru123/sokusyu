//
//  PercentageViewController.m
//  sokusyu-eitango
//
//  Created by Teru on 2014/05/11.
//  Copyright (c) 2014年 Self. All rights reserved.
//

#import "PercentageViewController.h"
#import "PercentageTableViewCell.h"
#import "CorrectAnswerData.h"
#import <Social/Social.h>

@interface PercentageViewController ()

@end

@implementation PercentageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self drawPercentage];
    
    self.tableView.rowHeight = 44;
    
    // セクション名を設定する
    sectionList =  [NSArray arrayWithObjects:@" ", @"正答率", nil];
    percentageSection =  [NSArray arrayWithObjects:@" ", @"正答率", nil];
    
    // セルの項目を作成する
    NSArray *share = [NSArray arrayWithObjects:@"Webサイト", @"レビューを書く", @"速習英単語２を無料でDL", nil];
    NSArray *percentage = [NSArray arrayWithObjects:
                           @"1    afraid - well", @"2    adventure - worse", @"3    alien - view", @"4    appropriate - village", @"5    aware - wild",
                           @"6    advantage - wise", @"7    allow - therefore", @"8    accept - theory", @"9    against - wave", @"10  benefit - trouble",
                           @"11  anymore - wake", @"12  alone - thin", @"13  blood - whole", @"14  coach - technology", @"15  across - yet",
                           @"16  academy - wealth", @"17  appreciate - whether", @"18  argue - treat", @"19  alive - wood", @"20  achieve - worth",
                           @"21  appear - various", @"22  actual - thief", @"23  advance - web", @"24  block - unite", @"25  associate - wide",
                           @"26  advice - suggest", @"27  actually - value", @"28  band - within", @"29  advertise - vote", @"30  above - surface", nil];
    percentageList = [NSArray arrayWithObjects:
                      percentageString1, percentageString2, percentageString3, percentageString4, percentageString5, percentageString6, percentageString7, percentageString8, percentageString9, percentageString10, percentageString11, percentageString12, percentageString13, percentageString14, percentageString15, percentageString16, percentageString17, percentageString18, percentageString19, percentageString20, percentageString21, percentageString22, percentageString23, percentageString24, percentageString25, percentageString26, percentageString27, percentageString28, percentageString29, percentageString30,  nil];
    
    // セルの項目をまとめる
    NSArray *datas = [NSArray arrayWithObjects:share, percentage, nil];
    dataSource = [NSDictionary dictionaryWithObjects:datas forKeys:sectionList];
    
    NSArray *datas2 = [NSArray arrayWithObjects:share, percentageList, nil];
    dataPercentageSource = [NSDictionary dictionaryWithObjects:datas2 forKeys:percentageSection];
    
    
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
    NSString *cellIdentifier = @"PercentageTableViewCell";
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    PercentageTableViewCell *cell = (PercentageTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"PercentageTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    if (indexPath.section == 1)
    {
        // セクション名を取得する
        NSString *sectionName = [sectionList objectAtIndex:indexPath.section];
        NSString *sectionName2 = [percentageSection objectAtIndex:indexPath.section];
        
        // セクション名をキーにしてそのセクションの項目をすべて取得
        NSArray *items = [dataSource objectForKey:sectionName];
        NSArray *items2 = [dataPercentageSource objectForKey:sectionName2];
        
        // セルにテキストを設定
        cell.titleLabel.text = [items objectAtIndex:indexPath.row];
        cell.percentageLabel.text = [items2 objectAtIndex:indexPath.row];
        
        if ([[items2 objectAtIndex:indexPath.row] isEqualToString:@"95%"]) {
            cell.percentageLabel.textColor = [UIColor blueColor];
        }else if ([[items2 objectAtIndex:indexPath.row] isEqualToString:@"96%"]) {
            cell.percentageLabel.textColor = [UIColor blueColor];
        }else if ([[items2 objectAtIndex:indexPath.row] isEqualToString:@"97%"]) {
            cell.percentageLabel.textColor = [UIColor blueColor];
        }else if ([[items2 objectAtIndex:indexPath.row] isEqualToString:@"98%"]) {
            cell.percentageLabel.textColor = [UIColor blueColor];
        }else if ([[items2 objectAtIndex:indexPath.row] isEqualToString:@"99%"]) {
            cell.percentageLabel.textColor = [UIColor blueColor];
        }else if ([[items2 objectAtIndex:indexPath.row] isEqualToString:@"100%"]) {
            cell.percentageLabel.textColor = [UIColor blueColor];
        }else{
            cell.percentageLabel.textColor = [UIColor blackColor];
        }
        
    }else{
        // セクション名を取得する
        NSString *sectionName = [sectionList objectAtIndex:indexPath.section];
        
        // セクション名をキーにしてそのセクションの項目をすべて取得
        NSArray *items = [dataSource objectForKey:sectionName];
        
        // セルにテキストを設定
        cell.titleLabel.text = [items objectAtIndex:indexPath.row];
        cell.percentageLabel.text = @"";
    }
    
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
        if ([[items objectAtIndex:indexPath.row] isEqualToString:@"レビューを書く"]) {
            [self reviewButton];
        }else if ([[items objectAtIndex:indexPath.row] isEqualToString:@"Webサイト"]){
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.sokusyueitango.com"]];
        }else if ([[items objectAtIndex:indexPath.row] isEqualToString:@"速習英単語２を無料でDL"]){
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

- (void)drawPercentage;
{
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
    percentageString1 = [[NSString alloc] initWithFormat:@"%d%%", percentage1];
    percentageString2 = [[NSString alloc] initWithFormat:@"%d%%", percentage2];
    percentageString3 = [[NSString alloc] initWithFormat:@"%d%%", percentage3];
    percentageString4 = [[NSString alloc] initWithFormat:@"%d%%", percentage4];
    percentageString5 = [[NSString alloc] initWithFormat:@"%d%%", percentage5];
    percentageString6 = [[NSString alloc] initWithFormat:@"%d%%", percentage6];
    percentageString7 = [[NSString alloc] initWithFormat:@"%d%%", percentage7];
    percentageString8 = [[NSString alloc] initWithFormat:@"%d%%", percentage8];
    percentageString9 = [[NSString alloc] initWithFormat:@"%d%%", percentage9];
    percentageString10 = [[NSString alloc] initWithFormat:@"%d%%", percentage10];
    percentageString11 = [[NSString alloc] initWithFormat:@"%d%%", percentage11];
    percentageString12 = [[NSString alloc] initWithFormat:@"%d%%", percentage12];
    percentageString13 = [[NSString alloc] initWithFormat:@"%d%%", percentage13];
    percentageString14 = [[NSString alloc] initWithFormat:@"%d%%", percentage14];
    percentageString15 = [[NSString alloc] initWithFormat:@"%d%%", percentage15];
    percentageString16 = [[NSString alloc] initWithFormat:@"%d%%", percentage16];
    percentageString17 = [[NSString alloc] initWithFormat:@"%d%%", percentage17];
    percentageString18 = [[NSString alloc] initWithFormat:@"%d%%", percentage18];
    percentageString19 = [[NSString alloc] initWithFormat:@"%d%%", percentage19];
    percentageString20 = [[NSString alloc] initWithFormat:@"%d%%", percentage20];
    percentageString21 = [[NSString alloc] initWithFormat:@"%d%%", percentage21];
    percentageString22 = [[NSString alloc] initWithFormat:@"%d%%", percentage22];
    percentageString23 = [[NSString alloc] initWithFormat:@"%d%%", percentage23];
    percentageString24 = [[NSString alloc] initWithFormat:@"%d%%", percentage24];
    percentageString25 = [[NSString alloc] initWithFormat:@"%d%%", percentage25];
    percentageString26 = [[NSString alloc] initWithFormat:@"%d%%", percentage26];
    percentageString27 = [[NSString alloc] initWithFormat:@"%d%%", percentage27];
    percentageString28 = [[NSString alloc] initWithFormat:@"%d%%", percentage28];
    percentageString29 = [[NSString alloc] initWithFormat:@"%d%%", percentage29];
    percentageString30 = [[NSString alloc] initWithFormat:@"%d%%", percentage30];
    
}

@end
