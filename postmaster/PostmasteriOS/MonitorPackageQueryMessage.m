//
//  MonitorPackageQueryMessage.m
//  PostmasteriOS
//
//  Created by luczakp on 29.08.2013.
//  Copyright (c) 2013 STXNext. All rights reserved.
//

#import "MonitorPackageQueryMessage.h"

@implementation MonitorPackageQueryMessage


NSString *const MONITOR_PACKAGE_TRACKING = @"tracking_no";
NSString *const MONITOR_PACKAGE_CALLBACKURL = @"url";
NSString *const MONITOR_PACKAGE_CALLBACKPHONE = @"sms";
NSString *const MONITOR_PACKAGE_EVENTS = @"events";

//events
NSString *const MONITOR_PACKAGE_EVENT_IN_TRANSIT = @"In-Transit";
NSString *const MONITOR_PACKAGE_EVENT_OUT_OF_DELIVERY = @"Out For Delivery";
NSString *const MONITOR_PACKAGE_EVENT_DELIVERED = @"Delivered";
NSString *const MONITOR_PACKAGE_EVENT_VOIDED = @"Voided";
NSString *const MONITOR_PACKAGE_EVENT_EXCEPTION = @"Exception";
NSString *const MONITOR_PACKAGE_EVENT_RETURNED = @"Returned";

-(id)init{
    self = [super init];
    self.events = [NSMutableArray array];
    return self;
}

-(NSDictionary*)toJSONReadyDictionary{
    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    if(self.events){
        [self putPropertyToJsonReadyDictionary:dict ofKey:MONITOR_PACKAGE_EVENTS andObject:self.events];
    }
    [self putPropertyToJsonReadyDictionary:dict ofKey:MONITOR_PACKAGE_TRACKING andObject:self.tracking];
    [self putPropertyToJsonReadyDictionary:dict ofKey:MONITOR_PACKAGE_CALLBACKURL andObject:self.callbackUrl];
    [self putPropertyToJsonReadyDictionary:dict ofKey:MONITOR_PACKAGE_CALLBACKPHONE andObject:self.callbackPhoneNumber];
    
    return dict;
}

-(id)initWithJSON:(NSDictionary*) jsonDict{
    if([jsonDict count] > 0){
        self = [super init];
        self.events = [PostmasterEntity getFromJSONArray:[jsonDict objectForKey:MONITOR_PACKAGE_EVENTS]];
        self.tracking = [jsonDict objectForKey:MONITOR_PACKAGE_TRACKING];
        self.callbackUrl = [jsonDict objectForKey:MONITOR_PACKAGE_CALLBACKURL];
        self.callbackPhoneNumber = [jsonDict objectForKey:MONITOR_PACKAGE_CALLBACKPHONE];
        return self;
    }
    return nil;
}


@end
