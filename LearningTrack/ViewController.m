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
-(void)saveToUserDefaults:(NSString*)myString
{
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    
    if (standardUserDefaults) {
        [standardUserDefaults setObject:myString forKey:@"fieldName"];
        [standardUserDefaults synchronize];
    }
}

- (IBAction)businessButton:(id)sender {
    _fieldName = [sender currentTitle];
    NSLog(@"%@", _fieldName);
    [self saveToUserDefaults:_fieldName];
}
- (IBAction)compsciButton:(id)sender {
    _fieldName = [sender currentTitle];
//    NSString *happy;
//    happy = [sender currentTitle];
//    NSLog(@"%@", happy);
    NSLog(@"%@", _fieldName);
    [self saveToUserDefaults:_fieldName];


}
- (IBAction)healthmedicine:(id)sender {
    _fieldName = [sender currentTitle];
    NSLog(@"%@", _fieldName);
    [self saveToUserDefaults:_fieldName];


}
- (IBAction)humanitiesbutton:(id)sender {
    _fieldName = [sender currentTitle];
    NSLog(@"%@", _fieldName);
    [self saveToUserDefaults:_fieldName];


}

- (IBAction)mathscience:(id)sender {
    _fieldName = [sender currentTitle];
    NSLog(@"%@", _fieldName);
    [self saveToUserDefaults:_fieldName];



}
- (IBAction)sciencebutton:(id)sender {
    _fieldName = [sender currentTitle];
    NSLog(@"%@", _fieldName);
    [self saveToUserDefaults:_fieldName];


}



-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([[segue identifier] isEqualToString:@"loadCourseList"])
    {
        MyTableController *destinationVC = [segue destinationViewController];
        [destinationVC setFieldName:[[sender textLabel] text]];
    }
    
}
@end
