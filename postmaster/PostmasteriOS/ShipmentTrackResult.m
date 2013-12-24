//
//  ShipmentTrackResult.m
//  PostmasteriOS
//
//  Created by luczakp on 24.06.2013.
//  Copyright (c) 2013 STXNext. All rights reserved.
//

#import "ShipmentTrackResult.h"

@implementation ShipmentTrackResult


-(id)initWithJSON:(NSDictionary *)json{
    self = [super init];
    
    if([json objectForKey:@"results"]){
        _trackingDetails = [TrackingDetails getFromJSONArray:[json objectForKey:@"results"]];
    }
    else{
        [self wrapJSONData:json];
    }
    
    return self;
}

@end
