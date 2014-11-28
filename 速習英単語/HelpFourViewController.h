//
//  HelpFourViewController.h
//  sokusyu-eitango
//
//  Created by Teru on 2014/11/27.
//  Copyright (c) 2014年 Self. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HelpFourViewController : UIViewController <UIPageViewControllerDataSource, UIPageViewControllerDelegate>

@property (strong, nonatomic) UIPageViewController *pageController;
- (IBAction)backToStartMenu:(id)sender;

@end
