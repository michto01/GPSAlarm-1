//
//  ConfirmationViewController.m
//  GPSAlarm
//
//  Created by Ian Richardson on 6/24/13.
//  Copyright (c) 2013 3 Screen Apps. All rights reserved.
//

#import "ConfirmationViewController.h"

@interface ConfirmationViewController ()

@end

@implementation ConfirmationViewController

@synthesize alarm = _alarm;
@synthesize confirm = _confirm;
@synthesize name = _name;
@synthesize distance = _distance;
@synthesize map = _map;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.name setText:self.alarm.name];
    [self.distance setText:[NSString stringWithFormat:@"%f", self.alarm.distance]];
    
    MKPointAnnotation *annot = [[MKPointAnnotation alloc] init];
    annot.coordinate = self.alarm.location;
    [self.map addAnnotation:annot];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)confirm:(id)sender {
    //Set Alarm
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
