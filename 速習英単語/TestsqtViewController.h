//
//  TestsqtViewController.h
//  TestView
//
//  Created by Teru on 2013/10/03.
//  Copyright (c) 2013年 Self. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>
#import <AVFoundation/AVFoundation.h>
//#import "NADView.h"
#import "GADBannerView.h"
#import "CorrectAnswerData.h"

@interface TestsqtViewController : UIViewController
<NSCoding, UITextFieldDelegate, UIGestureRecognizerDelegate, ADBannerViewDelegate, AVSpeechSynthesizerDelegate, GADBannerViewDelegate>
{
    int currentIndex;
    int yourScore;
    int trophyNumbers;
    int correctNumber;
    int inCorrectNumber;
    NSArray *scoreForTest;
    NSArray *changeLabel;
    NSArray *changeText;
    NSArray *changeHatuonLabel;
    NSArray *correctAnswerList;
    NSArray *dataList;
    NSMutableArray *words;
    NSString *reibunString;
    NSString *tangoString;
    GADBannerView *bannerView_;
    GetAndSetCorrectAnswerData *infoCorrectIncorrect;
    NSString *wordName;
    NSString *detailData;
    NSString *hatuonData;
    NSString *reibunData;
    NSString *detailText;
    NSString *correctWord;
    NSString *correctHatuon;
    __weak IBOutlet UILabel *yourScoreOnLabel;
    __weak IBOutlet UILabel *answerLabel;
    __weak IBOutlet UINavigationBar *navigationBar;
    __weak IBOutlet UITextView *ewTextView;
    __weak IBOutlet UILabel *hatuonLabel;
    __weak IBOutlet UIBarButtonItem *nextButton;
    __weak IBOutlet UIButton *saveButton;
    __weak IBOutlet UIButton *startButton;
    __weak IBOutlet ADBannerView *bannerForAD;
    __weak IBOutlet UILabel *reibunLabel;
    __weak IBOutlet UILabel *tangoLabel;
    __weak IBOutlet UIButton *tangoButton;
    __weak IBOutlet UIButton *reibunButton;
    __weak IBOutlet UIView *backgroundColorView;
    __weak IBOutlet UIImageView *tableViewWhite;
    __weak IBOutlet UIButton *textSizeButton;
    __weak IBOutlet UIButton *stopButton;
    __weak IBOutlet UIProgressView *progressBar;
    __weak IBOutlet UIButton *reibunPauseButton;
    __weak IBOutlet UIButton *tangoPauseButton;
    __weak IBOutlet UIBarButtonItem *menuButton;
    __weak IBOutlet UIImageView *textSizeBlue;
    __weak IBOutlet UIImageView *startBlue;
    __weak IBOutlet UIImageView *saveBlue;
    __weak IBOutlet UIButton *infoButton;
    __weak IBOutlet UIButton *showHelpViewButton;
    __weak IBOutlet UIImageView *blueImageLookStart;
    __weak IBOutlet UIButton *lookToLearnButton;
    __weak IBOutlet UIButton *showWordButton;
    __weak IBOutlet UIImageView *blueImageShowWord;
    __weak IBOutlet UILabel *progressLabel;
}
- (IBAction)startButton:(id)sender;
- (IBAction)menuButton:(id)sender;
- (IBAction)nextButton:(id)sender;
- (IBAction)saveButton:(id)sender;
- (IBAction)tangoSaisei:(id)sender;
- (IBAction)reibunSaisei:(id)sender;
- (IBAction)stopAction:(id)sender;
- (IBAction)reibunPauseAction:(id)sender;
- (IBAction)tangoPauseAction:(id)sender;
- (IBAction)showHelpView:(id)sender;
- (IBAction)lookToLearnStart:(id)sender;
- (IBAction)showWord:(id)sender;

@property(nonatomic, copy) void (^dismissblock)(void);
@property (weak, nonatomic) IBOutlet UITextField *checkTextField;
@property (nonatomic, strong) NSString *wordNo;
@property (nonatomic, strong) NSString *correctName;
@property (strong, nonatomic) AVSpeechSynthesizer *speechSynthesizer;
//@property (nonatomic, retain) NADView * nadView;

@end
