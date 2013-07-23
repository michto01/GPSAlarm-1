//
//  SettingsViewController.h
//  GPSAlarm
//
//  Created by Ian Richardson on 6/24/13.
//  Copyright (c) 2013 3 Screen Apps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface SettingsViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic) CLLocationCoordinate2D touchMapCoordinate;
@property (weak, nonatomic) IBOutlet UITextField *name;

@end
