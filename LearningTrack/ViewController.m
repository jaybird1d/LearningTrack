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
NSString *hello;

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

-(void) check
{
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    NSString *checkvalue = [standardUserDefaults objectForKey:@"checker"];
    if (checkvalue == @"pleaseclearcourses") {
        hello = nil;
    NSLog(hello);
    }}
-(void)saveToUserDefaults:(NSString*)myString
{
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    
    if (standardUserDefaults) {
        [standardUserDefaults setObject:myString forKey:@"fieldName"];
        [standardUserDefaults synchronize];
    }
}

-(void)saveToUserDefaults2:(NSString*)myString
{
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    if (standardUserDefaults) {
        [standardUserDefaults setObject:myString forKey:@"updatedList"];
        [standardUserDefaults synchronize];
    }
}
-(void) switch
{
    [self check];
    if (hello == nil)
    {[self saveToUserDefaults2:@"fore"];
    hello = @"hello";
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    [standardUserDefaults setObject:@"jason" forKey:@"checker"];
    }
        else
        {[self saveToUserDefaults2:@"hello"];
            NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
            [standardUserDefaults setObject:@"quit" forKey:@"checker"];}
}

- (IBAction)businessButton:(id)sender {
    _fieldName = [sender currentTitle];
    NSLog(@"%@", _fieldName);
    [self saveToUserDefaults:_fieldName];
    [self switch];
}
- (IBAction)compsciButton:(id)sender {
    _fieldName = [sender currentTitle];
//    NSString *happy;
//    happy = [sender currentTitle];
//    NSLog(@"%@", happy);
    NSLog(@"%@", _fieldName);
    [self saveToUserDefaults:_fieldName];
    [self switch];



}
- (IBAction)healthmedicine:(id)sender {
    _fieldName = [sender currentTitle];
    NSLog(@"%@", _fieldName);
    [self saveToUserDefaults:_fieldName];
    [self switch];


}
- (IBAction)humanitiesbutton:(id)sender {
    _fieldName = [sender currentTitle];
    NSLog(@"%@", _fieldName);
    [self saveToUserDefaults:_fieldName];
    [self switch];


}

- (IBAction)mathscience:(id)sender {
    _fieldName = [sender currentTitle];
    NSLog(@"%@", _fieldName);
    [self saveToUserDefaults:_fieldName];

    [self switch];


}
- (IBAction)sciencebutton:(id)sender {
    _fieldName = [sender currentTitle];
    NSLog(@"%@", _fieldName);
    [self saveToUserDefaults:_fieldName];

    [self switch];

}



-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([[segue identifier] isEqualToString:@"loadCourseList"])
    {
        MyTableController *destinationVC = [segue destinationViewController];
        [destinationVC setFieldName:[[sender textLabel] text]];
    }
    
}
@end
