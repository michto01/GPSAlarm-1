//
//  MapViewController.h
//  GPSAlarm
//
//  Created by Ian Richardson on 6/24/13.
//  Copyright (c) 2013 3 Screen Apps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "SettingsViewController.h"

@interface MapViewController : UIViewController <MKMapViewDelegate>

//UI objects
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UIButton *cancel;
@property (weak, nonatomic) IBOutlet UIButton *add;
@property (weak, nonatomic) IBOutlet UIButton *settings;

//Model objects
@property (nonatomic) CLLocationCoordinate2D touchMapCoordinate;

- (void)removeAllPinsButUserLocation;

@end
