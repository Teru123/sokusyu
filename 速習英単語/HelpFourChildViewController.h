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
@property (assign, nonatomic) NSInteger index;
@property (weak, nonatomic) IBOutlet UITextView *explanationTextView;

@end
