//
//  GraphTableViewController.h
//  sokusyu-eitango
//
//  Created by Teru on 2014/05/11.
//  Copyright (c) 2014年 Self. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CorePlot-CocoaTouch.h"

@interface GraphTableViewController : UITableViewController<UIActionSheetDelegate, CPTPlotSpaceDelegate,
CPTPlotDataSource, CPTScatterPlotDelegate>
{
    NSArray *sectionList;
    NSArray *percentageSection;
    NSDictionary *dataSource;
    
    __weak IBOutlet UIView *graphView;
    NSMutableArray *listOfWords;
    NSArray *wordNameForDetail;
    NSArray *testNo;
    NSArray *detail;
    NSArray *listOfScores;
    NSArray *scoreListOfDayOfTheWeek;
    double allScore;
    CPTGraphHostingView *hostingView;
    @private
    // グラフ表示領域（この領域に円グラフを追加する）
    CPTGraph *graph;
    NSArray *plotData;
}

- (void) drawGraph;

// 円グラフで表示するデータを保持する配列
@property (readwrite, nonatomic) NSMutableArray *scatterPlotData;
- (IBAction)shareButton:(id)sender;

@end
