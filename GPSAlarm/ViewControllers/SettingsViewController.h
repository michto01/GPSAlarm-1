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
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UILabel *longtitude;
@property (weak, nonatomic) IBOutlet UILabel *latitude;
@property (weak, nonatomic) IBOutlet UIButton *cancel;
@property (weak, nonatomic) IBOutlet UITextField *distanceTextField;
@property (weak, nonatomic) IBOutlet UISlider *distanceSlider;
@property (weak, nonatomic) IBOutlet UIButton *add;

@property (nonatomic) Boolean numberKeyboard;
@property (nonatomic) Boolean alphabetKeyboard;

- (IBAction)cancel:(id)sender;
- (IBAction)add:(id)sender;

@end
