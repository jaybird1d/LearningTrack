//
//  MyCourses.h
//  LearningTrack
//
//  Created by Jason Dunn on 5/3/13.
//  Copyright (c) 2013 Jason Dunn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCourses : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *myfavcourses;
@property (strong, nonatomic) IBOutlet UITableView *favoriteCoursesTable;

@end
