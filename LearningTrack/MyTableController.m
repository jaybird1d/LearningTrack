//
//  MyTableController.m
//  LearningTrack
//
//  Created by Jason Dunn on 4/30/13.
//  Copyright (c) 2013 Jason Dunn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Parse/Parse.h"
#import "MyTableController.h"
#import "ViewController.h"




@implementation MyTableController
@synthesize fieldName = _fieldName;
@synthesize className = _className;
@synthesize window = _window;
NSString *checkobject;

-(void) checkingobject {
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    
    if (checkobject != @"hi")
        checkobject = [standardUserDefaults objectForKey:@"updatedList"];
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object {
    static NSString *CellIdentifier = @"Cell";
    
    PFTableViewCell *cell = (PFTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[PFTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    MyTableController *controller = [[MyTableController alloc] initWithClassName:@"MOOCs"];
    [controller setTextKey:@"courseName"];
//    [controller setPaginationEnabled:TRUE];
//    [controller setPullToRefreshEnabled:TRUE];
//    [controller setObjectsPerPage:2];
    //[_controller objectsPerPage:2];
    self.objectsPerPage = 10;
    self.paginationEnabled = YES;
    self.pullToRefreshEnabled = YES;

    
    self.window.rootViewController = controller;
    
    // Configure the cell
    cell.textLabel.text = [object objectForKey:@"courseName"];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@: %@, %@", [object objectForKey:@"coursePlatform"], [object objectForKey:@"courseLength"],[object objectForKey:@"startDate"]];
 
    
    
    return cell;
}
/*
- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        // Custom the table
        
        // The className to query on
        
        // The key of the PFObject to display in the label of the default cell style
        self.textKey = @"courseName";
        
        // Uncomment the following line to specify the key of a PFFile on the PFObject to display in the imageView of the default cell style
        // self.imageKey = @"image";
        
        // Whether the built-in pull-to-refresh is enabled
        self.pullToRefreshEnabled = YES;
        
        // Whether the built-in pagination is enabled
        self.paginationEnabled = YES;
        
        // The number of objects to show per page
        self.objectsPerPage = 25;
    }
    return self;
}*/
-(NSString*)retrieveFromUserDefaults
{
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    NSString *val = nil;
    
    if (standardUserDefaults)
        val = [standardUserDefaults objectForKey:@"fieldName"];
    
    return val;
}

- (PFQuery *)queryForTable {
    PFQuery *query = [PFQuery queryWithClassName:@"MOOCs"];
    //_fieldName = @"Computer Science";
    _fieldName = [self retrieveFromUserDefaults];
    
    // If Pull To Refresh is enabled, query against the network by default.
    if (self.pullToRefreshEnabled) {
        query.cachePolicy = kPFCachePolicyNetworkOnly;
    }
    
    // If no objects are loaded in memory, we look to the cache first to fill the table
    // and then subsequently do a query against the network.
    if (self.objects.count == 0) {
        query.cachePolicy = kPFCachePolicyCacheThenNetwork;
    }
    //PFQuery *filteredQuery = [[PFQuery alloc] init];
    [query whereKey:@"Field" equalTo:_fieldName];
    //[filteredQuery whereKey:@"Field" matchesKey:_fieldName inQuery:query];
    //[filteredQuery orderByAscending:@"Field"];
    
    return query;
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    checkobject = @"fore";
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


#pragma mark - PFQueryTableViewController

- (void)objectsWillLoad {
    [super objectsWillLoad];
    
    // This method is called before a PFQuery is fired to get more objects
}

- (void)objectsDidLoad:(NSError *)error {
    [super objectsDidLoad:error];
    
    // This method is called every time objects are loaded from Parse via the PFQuery
}

/*
 // Override to customize what kind of query to perform on the class. The default is to query for
 // all objects ordered by createdAt descending.
 - (PFQuery *)queryForTable {
 PFQuery *query = [PFQuery queryWithClassName:self.className];
 
 // If Pull To Refresh is enabled, query against the network by default.
 if (self.pullToRefreshEnabled) {
 query.cachePolicy = kPFCachePolicyNetworkOnly;
 }
 
 // If no objects are loaded in memory, we look to the cache first to fill the table
 // and then subsequently do a query against the network.
 if (self.objects.count == 0) {
 query.cachePolicy = kPFCachePolicyCacheThenNetwork;
 }
 
 [query orderByDescending:@"createdAt"];
 
 return query;
 }
 */

/*
 // Override to customize the look of a cell representing an object. The default is to display
 // a UITableViewCellStyleDefault style cell with the label being the textKey in the object,
 // and the imageView being the imageKey in the object.
 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object {
 static NSString *CellIdentifier = @"Cell";
 
 PFTableViewCell *cell = (PFTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
 if (cell == nil) {
 cell = [[PFTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
 }
 
 // Configure the cell
 cell.textLabel.text = [object objectForKey:self.textKey];
 cell.imageView.file = [object objectForKey:self.imageKey];
 
 return cell;
 }
 */

/*
 // Override if you need to change the ordering of objects in the table.
 - (PFObject *)objectAtIndex:(NSIndexPath *)indexPath {
 return [self.objects objectAtIndex:indexPath.row];
 }
 */

/*
 // Override to customize the look of the cell that allows the user to load the next page of objects.
 // The default implementation is a UITableViewCellStyleDefault cell with simple labels.
 - (UITableViewCell *)tableView:(UITableView *)tableView cellForNextPageAtIndexPath:(NSIndexPath *)indexPath {
 static NSString *CellIdentifier = @"NextPage";
 
 UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
 
 if (cell == nil) {
 cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
 }
 
 cell.selectionStyle = UITableViewCellSelectionStyleNone;
 cell.textLabel.text = @"Load more...";
 
 return cell;
 }
 */

#pragma mark - UITableViewDataSource

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the object from Parse and reload the table view
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, and save it to Parse
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
    NSLog(@"%@", indexPath);
    NSString *indexfinal;
    indexfinal = [NSString stringWithFormat:@"%d-woohoo",indexPath.row];
    [self checkingobject];
    
    if (checkobject == @"fore") {
    
    NSMutableArray *mutableArray = [[NSMutableArray alloc] init];
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setObject:mutableArray forKey:@"theArray"];
    NSMutableArray *mutableArrayCopy = [[prefs objectForKey:@"theArray"] mutableCopy];
    [mutableArrayCopy addObject:indexfinal];
    [prefs setObject:mutableArrayCopy forKey:@"theArray"];
        NSLog(@"hi bobfred");
        checkobject = @"hi";
}
    else
    {
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        NSMutableArray *mutableArrayCopy = [[prefs objectForKey:@"theArray"] mutableCopy];
        [mutableArrayCopy addObject:indexfinal];
        [prefs setObject:mutableArrayCopy forKey:@"theArray"];
            NSLog(@"hi jason dunnnnnnn");}
    
    
}

//-(void)saveToUserDefaults:(NSArray*)myString
//{
//        
//    if (standardUserDefaults) {
//        [standardUserDefaults setObject:mutableArrayCopy forKey:@"theArray"];
//        [standardUserDefaults synchronize];
//    }
//}


@end
