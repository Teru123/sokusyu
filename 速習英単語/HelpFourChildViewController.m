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
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        // Custom initialization
    }
    
    return self;
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //NSArray arrayWithObjects の短縮形
    _explanationText = @[@"予習\n\n保存した単語を表示します。\n保存方法: テストで問題を間違えた際に、Scoreの右側にSaveボタンが表示されますので、それをタップ。その後、復習画面に戻り画面左上のボタンで更新してください。\n\n\n\n\n\n\n\n\n\n\n\n", @"復習\n\n保存した単語を表示します。\n保存方法: テストで問題を間違えた際に、Scoreの右側にSaveボタンが表示されますので、それをタップ。その後、復習画面に戻り画面左上のボタンで更新してください。", @"テスト\n\n保存した単語を表示します。\n保存方法: テストで問題を間違えた際に、Scoreの右側にSaveボタンが表示されますので、それをタップ。その後、復習画面に戻り画面左上のボタンで更新してください。", @"Free Regular Update", @"検索"];
    _explanationImage_1 = @[@"page1.png", @"page2.png", @"page3.png", @"page4.png", @"page5.png"];
    _explanationImage_2 = @[@"page1.png", @"page2.png", @"page3.png", @"page4.png", @"page5.png"];
    self.explanationTextView.text = [NSString stringWithFormat:@"%@", [_explanationText objectAtIndex:self.index]];
    NSString *imageName_1 = [NSString stringWithFormat:@"%@", [_explanationImage_1 objectAtIndex:self.index]];
    self.explanationImageView_1.image = [UIImage imageNamed:imageName_1];
    NSString *imageName_2 = [NSString stringWithFormat:@"%@", [_explanationImage_2 objectAtIndex:self.index]];
    self.explanationImageView_1.image = [UIImage imageNamed:imageName_2];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

@end
