//
//  Alarm.h
//  GPSAlarm
//
//  Created by Ian Richardson on 7/31/13.
//  Copyright (c) 2013 3 Screen Apps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Alarm : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * latitude;
@property (nonatomic, retain) NSNumber * distance;
@property (nonatomic, retain) NSNumber * longtitude;

@end
