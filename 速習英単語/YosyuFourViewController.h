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
//#import "NADView.h"
#import "GADBannerView.h"
#import "Reachability.h"

@interface YosyuFourViewController : UIViewController<UITextFieldDelegate, UIAlertViewDelegate, ADBannerViewDelegate, AVSpeechSynthesizerDelegate, GADBannerViewDelegate>
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
    Reachability* internetReachable;
    Reachability* hostReachable;
    
    __weak IBOutlet UITextField *practiceField;
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
    //__weak IBOutlet UIButton *textSizeButton;
    __weak IBOutlet UIProgressView *progressBar;
    __weak IBOutlet UIImageView *startButtonBlue;
    __weak IBOutlet UIImageView *menuButtonBlue;
    //__weak IBOutlet UIImageView *textSizeButtonBlue;
    __weak IBOutlet UIButton *helpViewButton;
    __weak IBOutlet UILabel *progressLabel;
    __weak IBOutlet UIButton *infoView;
    __weak IBOutlet UIImageView *blueImageSaveButton;
    __weak IBOutlet UIButton *saveButton;
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
- (IBAction)showHelpView:(id)sender;
- (IBAction)saveWord:(id)sender;

@property (nonatomic, strong) NSString *wordNo;
@property (strong, nonatomic) AVSpeechSynthesizer *speechSynthesizer;
//@property (nonatomic, retain) NADView * nadView;

@end
