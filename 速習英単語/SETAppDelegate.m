//
//  SETAppDelegate.m
//  速習英単語
//
//  Created by Teru on 2013/11/12.
//  Copyright (c) 2013年 Self. All rights reserved.
//

#import "SETAppDelegate.h"
#import <AVFoundation/AVFoundation.h>

@implementation SETAppDelegate
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:0.9]
#define UIColorAlphaFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:0.0]
@synthesize speechSynthesizer;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Uncomment to change the background color of navigation bar
    [[UINavigationBar appearance] setBarTintColor:UIColorFromRGB(0x065db5)];
    
    // Uncomment to change the color of back button
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    // Uncomment to assign a custom backgroung image
    // [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"nav_bg_ios7.png"] forBarMetrics:UIBarMetricsDefault];
    
    // Uncomment to change the back indicator image
    /*
     [[UINavigationBar appearance] setBackIndicatorImage:[UIImage imageNamed:@"back_btn.png"]];
     [[UINavigationBar appearance] setBackIndicatorTransitionMaskImage:[UIImage imageNamed:@"back_btn.png"]];
     */
    
    // Uncomment to change the font style of the title
    
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8];
    shadow.shadowOffset = CGSizeMake(0, 1);
    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
                                                           [UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1.0], NSForegroundColorAttributeName,
                                                           shadow, NSShadowAttributeName,
                                                           [UIFont fontWithName:@"American Typewriter" size:21.0], NSFontAttributeName, nil]];
    // Override point for customization after application launch.
    
    [UITabBar appearance].barTintColor = UIColorAlphaFromRGB(0xffffff);
    [[UITabBar appearance] setTintColor:UIColorFromRGB(0x065db5)];
    
    /*
    UIFont *font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:10.0f];
    
    NSDictionary *attributesNormal = @{NSFontAttributeName : font,
                                       NSForegroundColorAttributeName : UIColorFromRGB(0x065db5)};
    
    [[UITabBarItem appearance] setTitleTextAttributes:attributesNormal
                                             forState:UIControlStateNormal];
    */
        
    [UITableViewCell appearance].separatorInset = UIEdgeInsetsZero;
    
    /*
    UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
    if (tabBarController.tabBar.tag == 0) {
        [self.speechSynthesizer pauseSpeakingAtBoundary:AVSpeechBoundaryImmediate];
        NSLog(@"selected");
    }else if (tabBarController.tabBar.tag == 1){
        [self.speechSynthesizer pauseSpeakingAtBoundary:AVSpeechBoundaryImmediate];
        NSLog(@"1 selected");
    }else if (tabBarController.tabBar.tag == 2){
        [self.speechSynthesizer pauseSpeakingAtBoundary:AVSpeechBoundaryImmediate];
        NSLog(@"2 selected");
    }else{
        [self.speechSynthesizer pauseSpeakingAtBoundary:AVSpeechBoundaryImmediate];
        NSLog(@"others selected");
    }*/
    
    CGSize iOSDeviceScreenSize = [[UIScreen mainScreen] bounds].size;
    
    if (iOSDeviceScreenSize.height == 480)
    {
        // Instantiate a new storyboard object using the storyboard file named Storyboard_iPhone35
        UIStoryboard *iPhone35Storyboard = [UIStoryboard storyboardWithName:@"iPhone4" bundle:nil];
        
        // Instantiate the initial view controller object from the storyboard
        UIViewController *initialViewController = [iPhone35Storyboard instantiateInitialViewController];
        
        // Instantiate a UIWindow object and initialize it with the screen size of the iOS device
        self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        
        // Set the initial view controller to be the root view controller of the window object
        self.window.rootViewController  = initialViewController;
        
        // Set the window object to be the key window and show it
        [self.window makeKeyAndVisible];
    }
    
    if (iOSDeviceScreenSize.height == 568)
    {   // iPhone 5 and iPod Touch 5th generation: 4 inch screen
        // Instantiate a new storyboard object using the storyboard file named Storyboard_iPhone4
        UIStoryboard *iPhone4Storyboard = [UIStoryboard storyboardWithName:@"iPhone5" bundle:nil];
        
        UIViewController *initialViewController = [iPhone4Storyboard instantiateInitialViewController];
        self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        self.window.rootViewController  = initialViewController;
        [self.window makeKeyAndVisible];
    }

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
