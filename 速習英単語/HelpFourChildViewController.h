//
//  HelpFourChildViewController.h
//  sokusyu-eitango
//
//  Created by Teru on 2014/11/27.
//  Copyright (c) 2014年 Self. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HelpFourChildViewController : UIViewController

@property (strong, nonatomic) NSArray *explanationText;
@property (strong, nonatomic) NSArray *explanationImage_1;
@property (strong, nonatomic) NSArray *explanationImage_2;
@property (assign, nonatomic) NSInteger index;
@property (weak, nonatomic) IBOutlet UITextView *explanationTextView;
@property (weak, nonatomic) IBOutlet UIImageView *explanationImageView_1;
@property (weak, nonatomic) IBOutlet UIImageView *explanationTextView_2;

@end
