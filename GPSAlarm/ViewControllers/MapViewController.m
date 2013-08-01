//
//  MapViewController.m
//  GPSAlarm
//
//  Created by Ian Richardson on 6/24/13.
//  Copyright (c) 2013 3 Screen Apps. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController

@synthesize mapView = _mapView;
@synthesize touchMapCoordinate = _touchMapCoordinate;
@synthesize pinDropped = _pinDropped;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Sets up the map to recieve long presses
    UILongPressGestureRecognizer *lpgr = [[UILongPressGestureRecognizer alloc]
                                          initWithTarget:self action:@selector(handleLongPress:)];
    lpgr.minimumPressDuration = 1.0; //user needs to press for 2 seconds
    [self.mapView addGestureRecognizer:lpgr];
}

//Zooms into the users exact location
- (void)mapView:(MKMapView *)mv didAddAnnotationViews:(NSArray *)views {
    for(MKAnnotationView *annotationView in views) {
        if(annotationView.annotation == mv.userLocation) {
            MKCoordinateRegion region;
            MKCoordinateSpan span;
            
            span.latitudeDelta=0.05;
            span.longitudeDelta=0.05;
            
            CLLocationCoordinate2D location = mv.userLocation.coordinate;
            
            region.span = span;
            region.center = location;
            
            [mv setRegion:region animated:TRUE];
            [mv regionThatFits:region];
        }
    }
}

//This is the class that will handle the what happens after the map is pressed
- (void)handleLongPress:(UIGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer.state != UIGestureRecognizerStateBegan)
        return;
    
    [self removeAllPinsButUserLocation];
    
    //Gets the touch point and converts it into co-ordinates
    CGPoint touchPoint = [gestureRecognizer locationInView:self.mapView];
    self.touchMapCoordinate = [self.mapView convertPoint:touchPoint toCoordinateFromView:self.mapView];
    
    MKPointAnnotation *annot = [[MKPointAnnotation alloc] init];
    annot.coordinate = self.touchMapCoordinate;
    [self.mapView addAnnotation:annot];
    
    if(!self.pinDropped){
        [self addNextButton];
    }
}

- (void)addNextButton{
    [UIView animateWithDuration:1.0
                     animations:^{
                         self.cancel.frame = CGRectMake(0, self.cancel.frame.origin.y, self.cancel.frame.size.width/2, self.cancel.frame.size.height);
                         self.add.center = CGPointMake(self.cancel.frame.size.width+self.cancel.frame.size.width/2, self.add.center.y);
                     }
                     completion:^(BOOL finished){
                     }];
}

//Only allows 1 pin per map
- (void)removeAllPinsButUserLocation{
    MKUserLocation *userLocation = [self.mapView userLocation];
    NSMutableArray *pins = [[NSMutableArray alloc] initWithArray:[self.mapView annotations]];
    if ( userLocation != nil ) {
        [pins removeObject:userLocation]; // avoid removing user location off the map
    }
    
    [self.mapView removeAnnotations:pins];
    pins = nil;
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Goes back to home screen
- (IBAction)cancel:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    SettingsViewController *controller = segue.destinationViewController;
    [controller setTouchMapCoordinate:self.touchMapCoordinate];
}

@end
