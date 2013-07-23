//
//  PreviousAlarms.h
//  GPSAlarm
//
//  Created by Ian Richardson on 6/24/13.
//  Copyright (c) 2013 3 Screen Apps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Alarm : NSObject

@property (nonatomic) CLLocationCoordinate2D location;
@property (nonatomic, weak) NSString *name;

@end
