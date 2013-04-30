//
//  FieldViewController.m
//  LearningTrack
//
//  Created by Jason Dunn on 4/30/13.
//  Copyright (c) 2013 Jason Dunn. All rights reserved.
//

#import "FieldViewController.h"
#import <Parse/Parse.h>
#import "MyTableController.h"


@interface FieldViewController ()

@end


@implementation FieldViewController

@synthesize FieldCourseTable = _FieldCourseTable;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    
    //MyTableController *controller = [[MyTableController alloc] init];
    
    
    /*UITableViewCell *cell1 = [[UITableViewCell alloc] init];
    [cell1 setBackgroundColor:[UIColor redColor]];
    [_FieldCourseTable addSubview:cell1];*/
    //[self.FieldCourseTable controller];
    /*static NSString *CellIdentifier = @"MyCell";
    UITableViewCell *cell = [_FieldCourseTable dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"courseName"];
    }
    cell.textLabel.text = @"Course Name is very very long";
    cell.detailTextLabel.text = @"Course Length";
    cell.detailTextLabel.numberOfLines = 2;
    cell.detailTextLabel.lineBreakMode = UILineBreakModeWordWrap;
    [cell setBackgroundColor:[UIColor redColor]];
	// Do any additional setup after loading the view.
    [_FieldCourseTable addSubview:cell];*/
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
