//
//  MyCourses.m
//  LearningTrack
//
//  Created by Jason Dunn on 5/3/13.
//  Copyright (c) 2013 Jason Dunn. All rights reserved.
//

#import "MyCourses.h"

@interface MyCourses ()

@end

@implementation MyCourses
@synthesize myfavcourses = _myfavcourses;
@synthesize favoriteCoursesTable = _favoriteCoursesTable;


- (IBAction)clearCourses:(id)sender {
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSMutableArray *mutableArray = nil;
    [prefs setObject:mutableArray forKey:@"theArray"];
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    [standardUserDefaults setObject:@"pleaseclearcourses" forKey:@"checker"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSMutableArray *listoffavoritecourses = [[prefs objectForKey:@"theArray"] mutableCopy];
    return [listoffavoritecourses count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                 initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        NSMutableArray *coursefavs = [self retrieveFromUserDefaults];
        
        NSLog(@"Got courses:\r%@", coursefavs);
    }
    
    // Set up the cell...
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSMutableArray *mutableArray = [[prefs objectForKey:@"theArray"] mutableCopy];
    NSString *cellValue = [mutableArray objectAtIndex:indexPath.row];
    cell.textLabel.text = cellValue;
    
    return cell;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(NSMutableArray*)retrieveFromUserDefaults
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSMutableArray *mutableArray = [[prefs objectForKey:@"theArray"] mutableCopy];
    return mutableArray;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSMutableArray *coursefavs = [self retrieveFromUserDefaults];

    NSLog(@"Got statuses:\r%@", coursefavs);
//    self.myfavcourses.text = [self retrieveFromUserDefaults];
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
