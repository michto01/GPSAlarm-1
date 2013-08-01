//
//  ConfirmationViewController.h
//  GPSAlarm
//
//  Created by Ian Richardson on 6/24/13.
//  Copyright (c) 2013 3 Screen Apps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AlarmObject.h"

@interface ConfirmationViewController : UIViewController <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *confirm;
@property (strong, nonatomic) AlarmObject *alarmObject;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *distance;
@property (weak, nonatomic) IBOutlet MKMapView *map;

@end
