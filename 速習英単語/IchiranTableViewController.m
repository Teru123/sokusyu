//
//  IchiranTableViewController.m
//  TestView
//
//  Created by Teru on 2013/10/09.
//  Copyright (c) 2013年 Self. All rights reserved.
//

#import "IchiranTableViewController.h"
#import "IchiranViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface IchiranTableViewController ()

@end

@implementation IchiranTableViewController
@synthesize WordInfos;
@synthesize ichiran;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /*
    self.edgesForExtendedLayout=UIRectEdgeNone;
    self.extendedLayoutIncludesOpaqueBars=NO;
    self.automaticallyAdjustsScrollViewInsets=NO;
    */
     
    wordNameForSearch = [NSArray arrayWithObjects:
                         @"afraid", @"agree", @"angry", @"arrive", @"attack", @"bottom", @"clever", @"cruel", @"finally", @"hide",
                         @"hunt", @"lot", @"middle", @"moment", @"pleased", @"promise", @"reply", @"safe", @"trick", @"well",
                         @"adventure", @"approach", @"carefully", @"chemical", @"create", @"evil", @"experiment", @"kill",
                         @"laboratory", @"laugh", @"loud", @"nervous", @"noise", @"project", @"scare", @"secret",
                         @"shout", @"smell", @"terrible", @"worse", @"alien", @"among", @"chart", @"cloud", @"comprehend",
                         @"describe", @"ever", @"fail", @"friendly", @"grade", @"instead", @"library", @"planet", @"report",
                         @"several", @"solve", @"suddenly", @"suppose", @"universe", @"view", @"appropriate", @"avoid", @"behave",
                         @"calm", @"concern", @"content", @"expect", @"frequently", @"habit", @"instruct", @"issue", @"none",
                         @"patient", @"positive", @"punish", @"represent", @"shake", @"spread", @"stroll", @"village", @"aware",
                         @"badly", @"belong", @"continue", @"error", @"experience", @"field", @"hurt", @"judgment", @"likely",
                         @"normal", @"rare", @"relax", @"request", @"reside", @"result", @"roll", @"since", @"visible", @"wild",
                         
                         @"advantage", @"cause", @"choice", @"community", @"dead", @"distance", @"escape",
                         @"face", @"follow", @"fright", @"ghost", @"individual", @"pet", @"reach", @"return",
                         @"survive", @"upset", @"voice", @"weather", @"wise", @"allow", @"announce", @"beside",
                         @"challenge", @"claim", @"condition", @"contribute", @"difference", @"divide",
                         @"expert", @"famous", @"force", @"harm", @"lay", @"peace", @"prince", @"protect",
                         @"sense", @"sudden", @"therefore", @"accept", @"arrange", @"attend", @"balance",
                         @"contrast", @"encourage", @"familiar", @"grab", @"hang", @"huge", @"necessary",
                         @"pattern", @"propose", @"purpose", @"release", @"require", @"single", @"success",
                         @"tear", @"theory", @"against", @"beach", @"damage", @"discover", @"emotion", @"fix",
                         @"frank", @"identify", @"island", @"ocean", @"perhaps", @"pleasant", @"prevent",
                         @"rock", @"save", @"step", @"still", @"taste", @"throw", @"wave", @"benefit",
                         @"certain", @"chance", @"effect", @"essential", @"far", @"focus", @"function",
                         @"grass", @"guard", @"image", @"immediate", @"primary", @"proud", @"remain",
                         @"rest", @"separate", @"site", @"tail", @"trouble",
                         
                         @"anymore", @"asleep", @"berry", @"collect", @"compete", @"conversation", @"creature",
                         @"decision", @"either", @"forest", @"ground", @"introduce", @"marry", @"prepare", @"sail",
                         @"serious", @"spend", @"strange", @"truth", @"wake", @"alone", @"apartment", @"article",
                         @"artist", @"attitude", @"compare", @"judge", @"magazine", @"material", @"meal", @"method",
                         @"neighbor", @"professional", @"profit", @"quality", @"shape", @"space", @"stair", @"symbol",
                         @"thin", @"blood", @"burn", @"cell", @"contain", @"correct", @"crop", @"demand", @"equal",
                         @"feed", @"hole", @"increase", @"lord", @"owe", @"position", @"raise", @"responsible",
                         @"sight", @"spot", @"structure", @"whole", @"coach", @"control", @"description", @"direct", @"exam",
                         @"example", @"limit", @"local", @"magical", @"mail", @"novel", @"outline", @"poet", @"print",
                         @"scene", @"sheet", @"silly", @"store", @"suffer",@"technology",@"across",@"breathe",@"characteristic",
                         @"consume", @"excite", @"extreme", @"fear", @"fortunate", @"happen", @"length", @"mistake",
                         @"observe", @"opportunity", @"prize", @"race", @"realize", @"respond", @"risk", @"wonder", @"yet",
                         
                         @"academy", @"ancient", @"board", @"century", @"clue", @"concert", @"county",
                         @"dictionary", @"exist", @"flat", @"gentleman", @"hidden", @"maybe", @"officer", @"original",
                         @"pound", @"process", @"publish", @"theater", @"wealth", @"appreciate", @"available", @"beat",
                         @"bright", @"celebrate", @"determine", @"disappear", @"else", @"fair", @"flow", @"forward",
                         @"hill", @"level", @"lone", @"puddle", @"response", @"season", @"solution", @"waste",
                         @"whether", @"argue", @"communicate", @"crowd", @"depend", @"dish", @"empty", @"exact", @"fresh",
                         @"gather", @"indicate", @"item", @"offer", @"price", @"product", @"property", @"purchase",
                         @"recommend", @"select", @"tool", @"treat", @"alive", @"bone", @"bother", @"captain", @"conclusion",
                         @"doubt", @"explore", @"foreign",@"glad", @"however",@"injustice",@"international",@"lawyer",@"mention",
                         @"policy",@"social", @"speech", @"staff", @"toward", @"wood", @"achieve", @"advise", @"already",
                         @"basic", @"bit", @"consider", @"destroy", @"entertain", @"extra", @"goal", @"lie",
                         @"meat", @"opinion", @"real", @"reflect", @"regard", @"serve", @"vegetable", @"war", @"worth",
                         
                         @"appear", @"base", @"brain", @"career", @"clerk", @"effort", @"enter",
                         @"excellent", @"hero", @"hurry", @"inform", @"later", @"leave", @"locate", @"nurse",
                         @"operation", @"pain", @"refuse", @"though", @"various", @"actual", @"amaze", @"charge",
                         @"comfort", @"contact", @"customer", @"deliver", @"earn", @"gate", @"include", @"manage",
                         @"mystery", @"occur", @"opposite", @"plate", @"receive", @"reward", @"set", @"steal",
                         @"thief", @"advance", @"athlete", @"average", @"behavior", @"behind", @"course", @"lower", @"match",
                         @"member", @"mental", @"passenger", @"personality", @"poem", @"pole", @"remove", @"safety",
                         @"shoot", @"sound", @"swim", @"web", @"block", @"cheer", @"complex", @"critic", @"event",
                         @"exercise", @"fit", @"friendship", @"guide", @"lack",@"passage",@"perform",@"pressure", @"probable",
                         @"public",@"strike", @"support", @"task", @"term", @"unite", @"associate", @"environment", @"factory",
                         @"feature", @"instance", @"involve", @"medicine", @"mix", @"organize", @"period", @"populate",
                         @"produce", @"range", @"recognize", @"regular", @"sign", @"tip", @"tradition", @"trash", @"wide",
                         
                         @"advice", @"along", @"attention", @"attract", @"climb", @"drop", @"final",
                         @"further", @"imply", @"maintain", @"neither", @"otherwise", @"physical", @"prove", @"react", @"ride",
                         @"situated", @"society", @"standard", @"suggest", @"actually", @"bite", @"coast", @"deal",
                         @"desert", @"earthquake", @"effective", @"examine", @"false", @"gift", @"hunger", @"imagine",
                         @"journey", @"puzzle", @"quite", @"rather", @"specific", @"tour", @"trip", @"value",
                         @"band", @"barely", @"boring", @"cancel", @"driveway", @"garbage", @"instrument", @"list", @"magic",
                         @"message", @"notice", @"own", @"predict", @"professor", @"rush", @"schedule", @"share",
                         @"stage", @"storm", @"within", @"advertise", @"assign", @"audience", @"breakfast",
                         @"competition", @"cool",
                         @"gain", @"importance", @"knowledge", @"major", @"mean",@"prefer",@"president",
                         @"progress", @"respect",
                         @"rich",@"skill", @"somehow", @"strength", @"vote", @"above", @"ahead", @"amount", @"belief",
                         @"center", @"common", @"cost", @"demonstrate", @"different", @"evidence", @"honesty", @"idiom",
                         @"independent", @"inside", @"master", @"memory", @"proper", @"scan",
                         @"section", @"surface",
                         nil];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    // 行グループの数
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    // 行の数
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [searchResultsForWord count];
        
    } else {
        return [wordNameForSearch count];
        
    }
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    //cell.textLabel.font = [UIFont fontWithName:@"Bradley Hand" size:18];
    
	// セルの値を更新
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        cell.textLabel.text = [searchResultsForWord objectAtIndex:indexPath.row];
    } else {
        cell.textLabel.text = [wordNameForSearch objectAtIndex:indexPath.row];
    }
    
    return cell;
}

//セルが選択された時の挙動を決定する。
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*
    self.ichiran = [[IchiranViewController alloc] initWithNibName:@"IchiranViewController" bundle:nil];
    IchiranWords *info = [WordInfos objectAtIndex:indexPath.row];
    ichiran.uniqueId = info.uniqueId;
    [self presentViewController:self.ichiran animated:YES completion:nil];
     */
   
    
        if (tableView == self.searchDisplayController.searchResultsTableView) {
            [self performSegueWithIdentifier: @"showIchiranViewController" sender: self];
        }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
        if ([segue.identifier isEqualToString:@"showIchiranViewController"]) {
            IchiranViewController *destViewController = segue.destinationViewController;
            
            NSIndexPath *indexPath = nil;
            if ([self.searchDisplayController isActive]) {
                indexPath = [self.searchDisplayController.searchResultsTableView indexPathForSelectedRow];
                destViewController.wordNameForString = [searchResultsForWord objectAtIndex:indexPath.row];
            } else {
                indexPath = [self.tableView indexPathForSelectedRow];
                destViewController.wordNameForString = [wordNameForSearch objectAtIndex:indexPath.row];
            }
    }
}

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    NSPredicate *resultPredicate = [NSPredicate
                                    predicateWithFormat:@"SELF contains[cd] %@",
                                    searchText];
    searchResultsForWord = [wordNameForSearch filteredArrayUsingPredicate:resultPredicate];
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller
shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString
                               scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
                                      objectAtIndex:[self.searchDisplayController.searchBar
                                                     selectedScopeButtonIndex]]];
    
    return YES;
}

@end
