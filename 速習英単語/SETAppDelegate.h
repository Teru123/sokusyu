//
//  SETAppDelegate.h
//  速習英単語
//
//  Created by Teru on 2013/11/12.
//  Copyright (c) 2013年 Self. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface SETAppDelegate : UIResponder <UIApplicationDelegate, AVSpeechSynthesizerDelegate>
@property (strong, nonatomic) AVSpeechSynthesizer *speechSynthesizer;
@property (strong, nonatomic) UIWindow *window;

@end
