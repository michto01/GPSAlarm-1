//
//  ViewController.h
//  GPSAlarm
//
//  Created by Ian Richardson on 6/13/13.
//  Copyright (c) 2013 3 Screen Apps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapViewController.h"

@interface MainViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet NSMutableArray *tableData;
@property (weak, nonatomic) IBOutlet UIButton *addNew;

@property (strong, nonatomic) NSManagedObjectContext *context;

- (IBAction)addNewLocation:(id)sender;

@end
