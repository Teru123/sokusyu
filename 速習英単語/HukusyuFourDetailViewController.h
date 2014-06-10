//
//  HukusyuFourDetailViewController.h
//  sokusyu-eitango
//
//  Created by Teru on 2014/05/20.
//  Copyright (c) 2014年 Self. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>
#import <AVFoundation/AVFoundation.h>
//#import "NADView.h"
//#import "GADBannerView.h"

@interface HukusyuFourDetailViewController : UIViewController
<UITextFieldDelegate, UIGestureRecognizerDelegate, ADBannerViewDelegate, AVSpeechSynthesizerDelegate, UIActionSheetDelegate>
{
    __weak IBOutlet UITextView *ewTextView;
    __weak IBOutlet UILabel *hatuonLabel;
    __weak IBOutlet ADBannerView *bannerForAD;
    __weak IBOutlet UIView *backgroundColorView;
    __weak IBOutlet UILabel *tangoLabel;
    __weak IBOutlet UILabel *reibunLabel;
    __weak IBOutlet UIButton *stopButton;
    __weak IBOutlet UIButton *textSizeButton;
    __weak IBOutlet UIImageView *textViewWhite;
    __weak IBOutlet UIImageView *textSizeBlue;
    __weak IBOutlet UIButton *tangoButton;
    __weak IBOutlet UIButton *reibunButton;
    __weak IBOutlet UIButton *tangoPause;
    __weak IBOutlet UIButton *reibunPause;
    __weak IBOutlet UINavigationBar *navigationTitle;
    __weak IBOutlet UIBarButtonItem *menuButton;
    int _uniqueId;
    NSString *reibun;
    //GADBannerView *bannerView_;
}
@property(nonatomic, copy) void (^dismissblock)(void);
@property(nonatomic, getter=isHidden) BOOL hidden;
@property (nonatomic, strong) NSString *wordNameForString;
@property (weak, nonatomic) IBOutlet UITextView *ewTextViewFour;
- (IBAction)tangoSaisei:(id)sender;
- (IBAction)reibunSaisei:(id)sender;
- (IBAction)stopAction:(id)sender;
- (IBAction)tangoPauseAction:(id)sender;
- (IBAction)reibunPauseAction:(id)sender;
- (IBAction)MenuButton:(id)sender;
- (IBAction)shareButton:(id)sender;

@property (strong, nonatomic) AVSpeechSynthesizer *speechSynthesizer;
//@property (nonatomic, retain) NADView * nadView;
@end
