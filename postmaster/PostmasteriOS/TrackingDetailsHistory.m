//
//  TrackingDetailsHistory.m
//  PostmasteriOS
//
//  Created by luczakp on 21.06.2013.
//  Copyright (c) 2013 STXNext. All rights reserved.
//

#import "TrackingDetailsHistory.h"

@implementation TrackingDetailsHistory

NSString *const TRACKING_DETAILS_HISTORY_KEY_CITY = @"city";
NSString *const TRACKING_DETAILS_HISTORY_KEY_CODE = @"code";
NSString *const TRACKING_DETAILS_HISTORY_KEY_COUNTRYCODE = @"country_code";
NSString *const TRACKING_DETAILS_HISTORY_KEY_DESCRIPTION = @"description";
NSString *const TRACKING_DETAILS_HISTORY_KEY_POSTALCODE = @"postal_code";
NSString *const TRACKING_DETAILS_HISTORY_KEY_STATE = @"state";
NSString *const TRACKING_DETAILS_HISTORY_KEY_STATUS = @"status";
NSString *const TRACKING_DETAILS_HISTORY_KEY_TIMESTAMP = @"timestamp";

-(NSDictionary*)toJSONReadyDictionary{
    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    [self putPropertyToJsonReadyDictionary:dict ofKey:TRACKING_DETAILS_HISTORY_KEY_CITY andObject:self.city];
    [self putPropertyToJsonReadyDictionary:dict ofKey:TRACKING_DETAILS_HISTORY_KEY_CODE andObject:self.code];
    [self putPropertyToJsonReadyDictionary:dict ofKey:TRACKING_DETAILS_HISTORY_KEY_COUNTRYCODE andObject:self.countryCode];
    [self putPropertyToJsonReadyDictionary:dict ofKey:TRACKING_DETAILS_HISTORY_KEY_DESCRIPTION andObject:self.description];
    [self putPropertyToJsonReadyDictionary:dict ofKey:TRACKING_DETAILS_HISTORY_KEY_POSTALCODE andObject:self.postalCode];
    [self putPropertyToJsonReadyDictionary:dict ofKey:TRACKING_DETAILS_HISTORY_KEY_STATE andObject:self.state];
    [self putPropertyToJsonReadyDictionary:dict ofKey:TRACKING_DETAILS_HISTORY_KEY_STATUS andObject:self.status];
    [self putPropertyToJsonReadyDictionary:dict ofKey:TRACKING_DETAILS_HISTORY_KEY_TIMESTAMP andObject:self.timestamp];
    return dict;
}

-(id)initWithJSON:(NSDictionary*) jsonDict{
    if([jsonDict count] > 0){
    self = [super init];
    self.city = [jsonDict objectForKey:TRACKING_DETAILS_HISTORY_KEY_CITY];
    self.code = [jsonDict objectForKey:TRACKING_DETAILS_HISTORY_KEY_CODE];
    self.countryCode = [jsonDict objectForKey:TRACKING_DETAILS_HISTORY_KEY_COUNTRYCODE];
    self.description = [jsonDict objectForKey:TRACKING_DETAILS_HISTORY_KEY_DESCRIPTION];
    self.postalCode = [jsonDict objectForKey:TRACKING_DETAILS_HISTORY_KEY_POSTALCODE];
    self.state = [jsonDict objectForKey:TRACKING_DETAILS_HISTORY_KEY_STATE];
    self.status = [jsonDict objectForKey:TRACKING_DETAILS_HISTORY_KEY_STATUS];
    self.timestamp = [jsonDict objectForKey:TRACKING_DETAILS_HISTORY_KEY_TIMESTAMP];
    return self;
    }
    return nil;
}

@end
