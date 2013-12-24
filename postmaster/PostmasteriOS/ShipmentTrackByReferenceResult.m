//
//  ShipmentTrackByReferenceResult.m
//  PostmasteriOS
//
//  Created by luczakp on 24.06.2013.
//  Copyright (c) 2013 STXNext. All rights reserved.
//

#import "ShipmentTrackByReferenceResult.h"

@implementation ShipmentTrackByReferenceResult

-(id)initWithJSON:(NSDictionary*)json{
    self = [super init];
    
    if([json objectForKey:@"history"]){
        _trackingHistoryList = [TrackingDetailsHistory getFromJSONArray:[json objectForKey:@"history"]];
    }
    else{
        [self wrapJSONData:json];
    }
    
    return self;
}

@end
