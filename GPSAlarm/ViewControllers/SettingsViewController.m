//
//  SettingsViewController.m
//  GPSAlarm
//
//  Created by Ian Richardson on 6/24/13.
//  Copyright (c) 2013 3 Screen Apps. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

@synthesize touchMapCoordinate = _touchMapCoordinate;
@synthesize nameTextField = _nameTextField;
@synthesize longtitude = _longtitude;
@synthesize latitude = _latitude;
@synthesize cancel = _cancel;
@synthesize distanceTextField = _distanceTextField;
@synthesize distanceSlider = _distanceSlider;
@synthesize numberKeyboard = _numberKeyboard;
@synthesize alphabetKeyboard = _alphabetKeyboard;
@synthesize add = _add;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //The setup code (in viewDidLoad in your view controller)
    UITapGestureRecognizer *singleFingerTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    [self.view addGestureRecognizer:singleFingerTap];
    [self.latitude setText:[NSString stringWithFormat:@"%f",self.touchMapCoordinate.latitude]];
    [self.longtitude setText:[NSString stringWithFormat:@"%f",self.touchMapCoordinate.longitude]];
    
    self.distanceTextField.text = [NSString stringWithFormat:@"%d", (NSInteger)roundf(self.distanceSlider.value)];
    
    [self.distanceSlider addTarget:self action:@selector(sliderAction:) forControlEvents:UIControlEventValueChanged];
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    //Use this method insted of addTarget:
    if ([textField tag] == 0) {
        self.numberKeyboard = true;
        self.alphabetKeyboard = false;
    }
    else{
        self.alphabetKeyboard = true;
        self.numberKeyboard = false;
    }
    return true;
}

- (IBAction)sliderAction:(id)sender{
    UISlider *slider = (UISlider *)sender;
    float sliderValue = (float)(slider.value);
    self.distanceTextField.text = [NSString stringWithFormat:@"%f", sliderValue];
}

//The event handling method
- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer {
    if(self.numberKeyboard){
        [self textFieldShouldReturn:self.distanceTextField];
    }
    else if(self.alphabetKeyboard){
        [self textFieldShouldReturn:self.nameTextField];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if([textField tag] == 0 && [self checkDistanceSize:textField.text]){
        self.distanceSlider.value = (CGFloat)[textField.text floatValue];
    }
    [textField resignFirstResponder];
    return true;
}

- (BOOL)checkDistanceSize:(NSString *)distance{
    if((CGFloat)[distance floatValue] > 10){
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Distance"
                              message:@"The distance specified is larger than 10km"
                              delegate:nil
                              cancelButtonTitle:@"Dismiss"
                              otherButtonTitles:nil];
        [alert show];
        return false;
    }
    return true;
}

- (IBAction)cancel:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    AlarmObject *alarmObject = [[AlarmObject alloc] init];
    [alarmObject setDistance:self.distanceSlider.value];
    [alarmObject setName:self.nameTextField.text];
    [alarmObject setLocation:self.touchMapCoordinate];
    
    ConfirmationViewController *controller = segue.destinationViewController;
    [controller setAlarmObject:alarmObject];
}

@end
