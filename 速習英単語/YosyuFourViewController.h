//
//  YosyuFourViewController.h
//  速習英単語
//
//  Created by Teru on 2013/12/12.
//  Copyright (c) 2013年 Self. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>
#import <AVFoundation/AVFoundation.h>
#import "NADView.h"
#import "GADBannerView.h"

@interface YosyuFourViewController : UIViewController<UIAlertViewDelegate, ADBannerViewDelegate, AVSpeechSynthesizerDelegate, NADViewDelegate, GADBannerViewDelegate>
{
    int currentIndex;
    NSArray *changeLabel;
    NSArray *changeHatuonLabel;
    NSArray *changeText;
    NSArray *tangoSound;
    NSArray *reibunSound;
    NSString *wordData;
    NSString *detailData;
    NSString *hatuonData;
    NSString *reibunData;
    NSArray *dataList;
    NSString *itsWord;
    NSString *itsDetail;
    NSString *itsHatuon;
    NSString *itsReibun;
    GADBannerView *bannerView_;
    __weak IBOutlet UITextView *ewTextView;
    __weak IBOutlet UIBarButtonItem *nextButton;
    __weak IBOutlet UINavigationBar *navigationBarForTitle;
    __weak IBOutlet UILabel *hatuonLabel;
    __weak IBOutlet UIBarButtonItem *backButton;
    __weak IBOutlet UIButton *startButton;
    __weak IBOutlet ADBannerView *bannerForAD;
    __weak IBOutlet UIButton *menuButton;
    __weak IBOutlet UILabel *tangoLabel;
    __weak IBOutlet UILabel *reibunLabel;
    __weak IBOutlet UIButton *tangoSaisei;
    __weak IBOutlet UIButton *reibunSaisei;
    __weak IBOutlet UIView *backgroundColorView;
    __weak IBOutlet UIImageView *textViewWhite;
    __weak IBOutlet UIButton *stopButton;
    __weak IBOutlet UIButton *tangoPauseButton;
    __weak IBOutlet UIButton *reibunPauseButton;
    __weak IBOutlet UILabel *sentenceLabel;
    __weak IBOutlet UIButton *textSizeButton;
    __weak IBOutlet UIProgressView *progressBar;
    __weak IBOutlet UIImageView *startButtonBlue;
    __weak IBOutlet UIImageView *menuButtonBlue;
    __weak IBOutlet UIImageView *textSizeButtonBlue;
}

@property (nonatomic, copy) void (^dismissblock)(void);
- (IBAction)menuButton:(id)sender;
- (IBAction)nextButton:(id)sender;
- (IBAction)backButton:(id)sender;
- (IBAction)startButton:(id)sender;
- (IBAction)tangoSaiseiButton:(id)sender;
- (IBAction)reibunSaiseiButton:(id)sender;
/*- (void)disabledStartButton:(NSTimer *)timer;
 - (void)enabledStartButton:(NSTimer *)timer;*/
- (IBAction)tangoPauseAction:(id)sender;
- (IBAction)reibunPauseAction:(id)sender;
- (IBAction)stopAction:(id)sender;

@property (nonatomic, strong) NSString *wordNo;
@property (strong, nonatomic) AVSpeechSynthesizer *speechSynthesizer;
@property (nonatomic, retain) NADView * nadView;

@end
