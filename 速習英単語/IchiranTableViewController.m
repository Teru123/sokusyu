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

@property (assign, nonatomic) BOOL internetActive;
@property (assign, nonatomic) BOOL hostActive;
@property (strong, nonatomic) UIAlertView *wifiAlert;

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
                         @"1. afraid", @"1. agree", @"1. angry", @"1. arrive", @"1. attack", @"1. bottom", @"1. clever", @"1. cruel", @"1. finally", @"1. hide",
                         @"1. hunt", @"1. lot", @"1. middle", @"1. moment", @"1. pleased", @"1. promise", @"1. reply", @"1. safe", @"1. trick", @"1. well",
                         @"2. adventure", @"2. approach", @"2. carefully", @"2. chemical", @"2. create", @"2. evil", @"2. experiment", @"2. kill",
                         @"2. laboratory", @"2. laugh", @"2. loud", @"2. nervous", @"2. noise", @"2. project", @"2. scare", @"2. secret",
                         @"2. shout", @"2. smell", @"2. terrible", @"2. worse", @"3. alien", @"3. among", @"3. chart", @"3. cloud", @"3. comprehend",
                         @"3. describe", @"3. ever", @"3. fail", @"3. friendly", @"3. grade", @"3. instead", @"3. library", @"3. planet", @"3. report",
                         @"3. several", @"3. solve", @"3. suddenly", @"3. suppose", @"3. universe", @"3. view", @"4. appropriate", @"4. avoid", @"4. behave",
                         @"4. calm", @"4. concern", @"4. content", @"4. expect", @"4. frequently", @"4. habit", @"4. instruct", @"4. issue", @"4. none",
                         @"4. patient", @"4. positive", @"4. punish", @"4. represent", @"4. shake", @"4. spread", @"4. stroll", @"4. village", @"5. aware",
                         @"5. badly", @"5. belong", @"5. continue", @"5. error", @"5. experience", @"5. field", @"5. hurt", @"5. judgment", @"5. likely",
                         @"5. normal", @"5. rare", @"5. relax", @"5. request", @"5. reside", @"5. result", @"5. roll", @"5. since", @"5. visible", @"5. wild",
                         
                         @"6. advantage", @"6. cause", @"6. choice", @"6. community", @"6. dead", @"6. distance", @"6. escape",
                         @"6. face", @"6. follow", @"6. fright", @"6. ghost", @"6. individual", @"6. pet", @"6. reach", @"6. return",
                         @"6. survive", @"6. upset", @"6. voice", @"6. weather", @"6. wise", @"7. allow", @"7. announce", @"7. beside",
                         @"7. challenge", @"7. claim", @"7. condition", @"7. contribute", @"7. difference", @"7. divide",
                         @"7. expert", @"7. famous", @"7. force", @"7. harm", @"7. lay", @"7. peace", @"7. prince", @"7. protect",
                         @"7. sense", @"7. sudden", @"7. therefore", @"8. accept", @"8. arrange", @"8. attend", @"8. balance",
                         @"8. contrast", @"8. encourage", @"8. familiar", @"8. grab", @"8. hang", @"8. huge", @"8. necessary",
                         @"8. pattern", @"8. propose", @"8. purpose", @"8. release", @"8. require", @"8. single", @"8. success",
                         @"8. tear", @"8. theory", @"9. against", @"9. beach", @"9. damage", @"9. discover", @"9. emotion", @"9. fix",
                         @"9. frank", @"9. identify", @"9. island", @"9. ocean", @"9. perhaps", @"9. pleasant", @"9. prevent",
                         @"9. rock", @"9. save", @"9. step", @"9. still", @"9. taste", @"9. throw", @"9. wave", @"10. benefit",
                         @"10. certain", @"10. chance", @"10. effect", @"10. essential", @"10. far", @"10. focus", @"10. function",
                         @"10. grass", @"10. guard", @"10. image", @"10. immediate", @"10. primary", @"10. proud", @"10. remain",
                         @"10. rest", @"10. separate", @"10. site", @"10. tail", @"10. trouble",
                         
                         @"11. anymore", @"11. asleep", @"11. berry", @"11. collect", @"11. compete", @"11. conversation", @"11. creature",
                         @"11. decision", @"11. either", @"11. forest", @"11. ground", @"11. introduce", @"11. marry", @"11. prepare", @"11. sail",
                         @"11. serious", @"11. spend", @"11. strange", @"11. truth", @"11. wake", @"12. alone", @"12. apartment", @"12. article",
                         @"12. artist", @"12. attitude", @"12. compare", @"12. judge", @"12. magazine", @"12. material", @"12. meal", @"12. method",
                         @"12. neighbor", @"12. professional", @"12. profit", @"12. quality", @"12. shape", @"12. space", @"12. stair", @"12. symbol",
                         @"12. thin", @"13. blood", @"13. burn", @"13. cell", @"13. contain", @"13. correct", @"13. crop", @"13. demand", @"13. equal",
                         @"13. feed", @"13. hole", @"13. increase", @"13. lord", @"13. owe", @"13. position", @"13. raise", @"13. responsible",
                         @"13. sight", @"13. spot", @"13. structure", @"13. whole", @"14. coach", @"14. control", @"14. description", @"14. direct", @"14. exam",
                         @"14. example", @"14. limit", @"14. local", @"14. magical", @"14. mail", @"14. novel", @"14. outline", @"14. poet", @"14. print",
                         @"14. scene", @"14. sheet", @"14. silly", @"14. store", @"14. suffer",@"14. technology",@"15. across",@"15. breathe",@"15. characteristic",
                         @"15. consume", @"15. excite", @"15. extreme", @"15. fear", @"15. fortunate", @"15. happen", @"15. length", @"15. mistake",
                         @"15. observe", @"15. opportunity", @"15. prize", @"15. race", @"15. realize", @"15. respond", @"15. risk", @"15. wonder", @"15. yet",
                         
                         @"16. academy", @"16. ancient", @"16. board", @"16. century", @"16. clue", @"16. concert", @"16. county",
                         @"16. dictionary", @"16. exist", @"16. flat", @"16. gentleman", @"16. hidden", @"16. maybe", @"16. officer", @"16. original",
                         @"16. pound", @"16. process", @"16. publish", @"16. theater", @"16. wealth", @"17. appreciate", @"17. available", @"17. beat",
                         @"17. bright", @"17. celebrate", @"17. determine", @"17. disappear", @"17. else", @"17. fair", @"17. flow", @"17. forward",
                         @"17. hill", @"17. level", @"17. lone", @"17. puddle", @"17. response", @"17. season", @"17. solution", @"17. waste",
                         @"17. whether", @"18. argue", @"18. communicate", @"18. crowd", @"18. depend", @"18. dish", @"18. empty", @"18. exact", @"18. fresh",
                         @"18. gather", @"18. indicate", @"18. item", @"18. offer", @"18. price", @"18. product", @"18. property", @"18. purchase",
                         @"18. recommend", @"18. select", @"18. tool", @"18. treat", @"19. alive", @"19. bone", @"19. bother", @"19. captain", @"19. conclusion",
                         @"19. doubt", @"19. explore", @"19. foreign",@"19. glad", @"19. however",@"19. injustice",@"19. international",@"19. lawyer",@"19. mention",
                         @"19. policy",@"19. social", @"19. speech", @"19. staff", @"19. toward", @"19. wood", @"20. achieve", @"20. advise", @"20. already",
                         @"20. basic", @"20. bit", @"20. consider", @"20. destroy", @"20. entertain", @"20. extra", @"20. goal", @"20. lie",
                         @"20. meat", @"20. opinion", @"20. real", @"20. reflect", @"20. regard", @"20. serve", @"20. vegetable", @"20. war", @"20. worth",
                         
                         @"21. appear", @"21. base", @"21. brain", @"21. career", @"21. clerk", @"21. effort", @"21. enter",
                         @"21. excellent", @"21. hero", @"21. hurry", @"21. inform", @"21. later", @"21. leave", @"21. locate", @"21. nurse",
                         @"21. operation", @"21. pain", @"21. refuse", @"21. though", @"21. various", @"22. actual", @"22. amaze", @"22. charge",
                         @"22. comfort", @"22. contact", @"22. customer", @"22. deliver", @"22. earn", @"22. gate", @"22. include", @"22. manage",
                         @"22. mystery", @"22. occur", @"22. opposite", @"22. plate", @"22. receive", @"22. reward", @"22. set", @"22. steal",
                         @"22. thief", @"23. advance", @"23. athlete", @"23. average", @"23. behavior", @"23. behind", @"23. course", @"23. lower", @"23. match",
                         @"23. member", @"23. mental", @"23. passenger", @"23. personality", @"23. poem", @"23. pole", @"23. remove", @"23. safety",
                         @"23. shoot", @"23. sound", @"23. swim", @"23. web", @"24. block", @"24. cheer", @"24. complex", @"24. critic", @"24. event",
                         @"24. exercise", @"24. fit", @"24. friendship", @"24. guide", @"24. lack",@"24. passage",@"24. perform",@"24. pressure", @"24. probable",
                         @"24. public",@"24. strike", @"24. support", @"24. task", @"24. term", @"24. unite", @"25. associate", @"25. environment", @"25. factory",
                         @"25. feature", @"25. instance", @"25. involve", @"25. medicine", @"25. mix", @"25. organize", @"25. period", @"25. populate",
                         @"25. produce", @"25. range", @"25. recognize", @"25. regular", @"25. sign", @"25. tip", @"25. tradition", @"25. trash", @"25. wide",
                         
                         @"26. advice", @"26. along", @"26. attention", @"26. attract", @"26. climb", @"26. drop", @"26. final",
                         @"26. further", @"26. imply", @"26. maintain", @"26. neither", @"26. otherwise", @"26. physical", @"26. prove", @"26. react", @"26. ride",
                         @"26. situated", @"26. society", @"26. standard", @"26. suggest", @"27. actually", @"27. bite", @"27. coast", @"27. deal",
                         @"27. desert", @"27. earthquake", @"27. effective", @"27. examine", @"27. false", @"27. gift", @"27. hunger", @"27. imagine",
                         @"27. journey", @"27. puzzle", @"27. quite", @"27. rather", @"27. specific", @"27. tour", @"27. trip", @"27. value",
                         @"28. band", @"28. barely", @"28. boring", @"28. cancel", @"28. driveway", @"28. garbage", @"28. instrument", @"28. list", @"28. magic",
                         @"28. message", @"28. notice", @"28. own", @"28. predict", @"28. professor", @"28. rush", @"28. schedule", @"28. share",
                         @"28. stage", @"28. storm", @"28. within", @"29. advertise", @"29. assign", @"29. audience", @"29. breakfast",
                         @"29. competition", @"29. cool",
                         @"29. gain", @"29. importance", @"29. knowledge", @"29. major", @"29. mean",@"29. prefer",@"29. president",
                         @"29. progress", @"29. respect",
                         @"29. rich",@"29. skill", @"29. somehow", @"29. strength", @"29. vote", @"30. above", @"30. ahead", @"30. amount", @"30. belief",
                         @"30. center", @"30. common", @"30. cost", @"30. demonstrate", @"30. different", @"30. evidence", @"30. honesty", @"30. idiom",
                         @"30. independent", @"30. inside", @"30. master", @"30. memory", @"30. proper", @"30. scan",
                         @"30. section", @"30. surface",
                         nil];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewWillAppear:(BOOL)animated
{
    // ハイライト解除
    [super viewWillAppear:animated];
    //[self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
}

-(void) viewWillDisappear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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
