//
//  ViewController.m
//  GPSAlarm
//
//  Created by Ian Richardson on 6/13/13.
//  Copyright (c) 2013 3 Screen Apps. All rights reserved.
//

#import "MainViewController.h"
#import "AppDelegate.h"
#import "Alarm.h"

@interface MainViewController ()

@end

@implementation MainViewController

@synthesize tableData = _tabBarData;
@synthesize tableView = _tableView;
@synthesize addNew = _addNew;
@synthesize context = _context;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
        
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Alarm" inManagedObjectContext:self.context];
    [fetchRequest setEntity:entity];
    NSError *error;
    self.tableData = [NSMutableArray arrayWithArray:[self.context executeFetchRequest:fetchRequest error:&error]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addNewLocation:(id)sender{}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    Alarm *alarm = [self.tableData objectAtIndex:[indexPath row]];
    
    cell.textLabel.text = alarm.name;
    return cell;
}

@end
