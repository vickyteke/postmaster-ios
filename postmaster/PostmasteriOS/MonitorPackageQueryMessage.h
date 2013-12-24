//
//  MonitorPackageQueryMessage.h
//  PostmasteriOS
//
//  Created by luczakp on 29.08.2013.
//  Copyright (c) 2013 STXNext. All rights reserved.
//

#import "PostmasterEntity.h"

@interface MonitorPackageQueryMessage : PostmasterEntity

@property(nonatomic,retain) NSString* tracking;
extern NSString *const MONITOR_PACKAGE_TRACKING;
@property(nonatomic,retain) NSString* callbackUrl;
extern NSString *const MONITOR_PACKAGE_CALLBACKURL;
@property(nonatomic,retain) NSString* callbackPhoneNumber;
extern NSString *const MONITOR_PACKAGE_CALLBACKPHONE;
@property(nonatomic,retain) NSMutableArray* events;
extern NSString *const MONITOR_PACKAGE_EVENTS;

//events
extern NSString *const MONITOR_PACKAGE_EVENT_IN_TRANSIT;
extern NSString *const MONITOR_PACKAGE_EVENT_OUT_OF_DELIVERY;
extern NSString *const MONITOR_PACKAGE_EVENT_DELIVERED;
extern NSString *const MONITOR_PACKAGE_EVENT_VOIDED;
extern NSString *const MONITOR_PACKAGE_EVENT_EXCEPTION;
extern NSString *const MONITOR_PACKAGE_EVENT_RETURNED;

@end
