//
//  TrackingDetails.m
//  PostmasteriOS
//
//  Created by luczakp on 21.06.2013.
//  Copyright (c) 2013 STXNext. All rights reserved.
//

#import "TrackingDetails.h"

@implementation TrackingDetails

NSString *const TRACKING_DETAILS_KEY_HISTORY = @"history";
NSString *const TRACKING_DETAILS_KEY_LASTUPDATE = @"last_update";
NSString *const TRACKING_DETAILS_KEY_STATUS = @"status";


-(NSDictionary*)toJSONReadyDictionary{
    NSMutableDictionary* dict = [NSMutableDictionary dictionary];

    if(self.history){
        [self putPropertyToJsonReadyDictionary:dict ofKey:TRACKING_DETAILS_KEY_HISTORY andObject:[TrackingDetailsHistory convertToJsonArrayFromEntityArray:self.history]];
    }
    [self putPropertyToJsonReadyDictionary:dict ofKey:TRACKING_DETAILS_KEY_LASTUPDATE andObject:self.lastUpdate];
    [self putPropertyToJsonReadyDictionary:dict ofKey:TRACKING_DETAILS_KEY_STATUS andObject:self.status];
    return dict;
}

-(id)initWithJSON:(NSDictionary*) jsonDict{
    if([jsonDict count] > 0){
    self = [super init];
    self.history = [TrackingDetailsHistory getFromJSONArray:[jsonDict objectForKey:TRACKING_DETAILS_KEY_HISTORY]];
    self.lastUpdate = [jsonDict objectForKey:TRACKING_DETAILS_KEY_LASTUPDATE];
    self.status = [jsonDict objectForKey:TRACKING_DETAILS_KEY_STATUS];
    return self;
    }
    return nil;
}

@end
