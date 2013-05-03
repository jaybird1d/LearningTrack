//
//  MyTableController.h
//  LearningTrack
//
//  Created by Jason Dunn on 4/30/13.
//  Copyright (c) 2013 Jason Dunn. All rights reserved.
//

#import <Parse/Parse.h>

@interface MyTableController : PFQueryTableViewController {
    UIWindow *window;
}
@property (strong, nonatomic) UIWindow *window;

@property NSString *fieldName;
@property NSString *className;

@end
