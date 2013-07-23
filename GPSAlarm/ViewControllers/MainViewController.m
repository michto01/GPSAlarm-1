//
//  ViewController.m
//  GPSAlarm
//
//  Created by Ian Richardson on 6/13/13.
//  Copyright (c) 2013 3 Screen Apps. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

@synthesize tableData = _tabBarData;
@synthesize tableView = _tableView;
@synthesize addNew = _addNew;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //Temp cell stuff
    self.tableData = [NSMutableArray arrayWithObjects:@"Test 1", @"Test 2", @"Test 3", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addNewLocation:(id)sender{
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [self.tableData objectAtIndex:[indexPath row]];
    return cell;
}

@end
