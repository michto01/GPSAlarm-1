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

//Zooms into the users exact location
- (void)mapView:(MKMapView *)mv didAddAnnotationViews:(NSArray *)views {
    for(MKAnnotationView *annotationView in views) {
        if(annotationView.annotation == mv.userLocation) {
            MKCoordinateRegion region;
            MKCoordinateSpan span;
            
            span.latitudeDelta=0.05;
            span.longitudeDelta=0.05;
            
            CLLocationCoordinate2D location = self.alarm.location;
            
            region.span = span;
            region.center = location;
            
            [mv setRegion:region animated:TRUE];
            [mv regionThatFits:region];
        }
    }
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

//Goes back to home screen
- (IBAction)edit:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
