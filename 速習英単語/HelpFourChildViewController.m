//
//  HelpFourChildViewController.m
//  sokusyu-eitango
//
//  Created by Teru on 2014/11/27.
//  Copyright (c) 2014年 Self. All rights reserved.
//

#import "HelpFourChildViewController.h"

@interface HelpFourChildViewController ()

@end

@implementation HelpFourChildViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    self = [super initWithNibName:@"HelpFourChildViewController" bundle:nibBundleOrNil];
    
    if (self) {
        // Custom initialization
    }
    
    return self;
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //NSArray arrayWithObjects の短縮形
    _explanationText = @[@"予習の使い方\n\n・各単元20問あります。\n・左スワイプまたは進むタップで次の単語を表示します。右スワイプまたは戻るタップで前の単語を表示します。\n・単語練習スペースを利用して単語を書いて覚えることが出来ます。\n・テキスト内の調べたい単語をロングタップするとCopy, Defineと表示されるのでDefineをタップしてください。iPhoneの内蔵辞書で指定した単語を調べることが出来ます。\n・保存ボタンを押すと表示されている単語を保存できます。保存した単語は復習画面に表示されます。詳しくは復習の使い方をご覧下さい。\n・メニューに戻る時はMenuボタンをタップしてください。", @"テストの使い方\n\n・各単元20問あります。見て覚えるまたは書いて覚えるをタップするとテストが始まります。\n・見て覚えるを選択すると単語を見るボタンが表示されます。問題の解答を見る時にタップしてください。書いて覚えるを選択した場合、画面上部に単語を入力する箇所があるので問題の解答を入力してください。入力後にDoneをタップすると自動で答え合わせされます。<!>単語の入力方法が手書きでない場合は予測変換を使用しないでください。綴りが合っていても間違いとなります。\n・単語を見るタップ後または解答入力後に左スワイプ、進むタップで次の単語を表示します。\n・書いて覚えるを選択した場合はスコアが加算されていきます。全問解答後、メニューに戻るとスコアとグラフが更新されます。詳しくはグラフの説明をご覧下さい。また、書いて覚えるを選択してメニューに戻ると正答率が更新されます。正答率は全問解答していない場合も更新されます。", @"復習の使い方\n\n・予習とテストで保存した単語を表示します。\n・表示された単語を左にスライドすると削除、右にスライドすると検索ボタンが表示されます。削除をタップして指定した単語を削除、検索をタップして指定した単語の意味等を表示&音声が再生できます。\n・メニューに戻る時はMenuボタンをタップしてください。", @"索引の使い方\n\n・単語と単元番号を入力して検索できます。タップした単語の意味等を表示&音声が再生できます。", @"グラフ\n\n・予習画面右上のボタンをタップするとグラフが表示されます。グラフは曜日毎に合計スコアを元にして更新されます。毎週日曜日に先週の合計スコアを元にして自動で更新されます。\n例: 先週金曜日の合計スコア100、先週土曜日はスコアに変化なしの場合、今週日曜日の合計スコアは100となります。\n\n\n正答率\n\n・テスト画面右上のボタンをタップすると各単元の正答率が表示されます。"];
    self.explanationTextView.text = [NSString stringWithFormat:@"%@", [_explanationText objectAtIndex:self.index]];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

@end
