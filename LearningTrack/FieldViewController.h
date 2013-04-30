//
//  FieldViewController.h
//  LearningTrack
//
//  Created by Jason Dunn on 4/30/13.
//  Copyright (c) 2013 Jason Dunn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface FieldViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *FieldTitle;
@property (weak, nonatomic) IBOutlet UITableView *FieldCourseTable;

@end
