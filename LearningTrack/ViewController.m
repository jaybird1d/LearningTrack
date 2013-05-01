//
//  ViewController.m
//  LearningTrack
//
//  Created by Jason Dunn on 4/17/13.
//  Copyright (c) 2013 Jason Dunn. All rights reserved.
//

#import "ViewController.h"
#import "MyTableController.h"

@interface ViewController ()
@end

@implementation ViewController
@synthesize fieldName = _fieldName;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([[segue identifier] isEqualToString:@"loadCourseList"])
    {
        MyTableController *destinationVC = [segue destinationViewController];
        [destinationVC setFieldName:[[sender textLabel] text]];
    }
    
}
@end
