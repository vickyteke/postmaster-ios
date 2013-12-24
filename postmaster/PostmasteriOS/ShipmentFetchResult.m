//
//  ShipmentFetchResult.m
//  PostmasteriOS
//
//  Created by luczakp on 24.06.2013.
//  Copyright (c) 2013 STXNext. All rights reserved.
//

#import "ShipmentFetchResult.h"
#import "Shipment.h"

@implementation ShipmentFetchResult

-(id)initWithJSON:(NSDictionary*)json{
    self = [super init];
    if([json objectForKey:@"results"]){
        _shipments = [Shipment getFromJSONArray:[json objectForKey:@"results"]];
        _cursor = [json objectForKey:@"cursor"];
        _previousCursor = [json objectForKey:@"previousCursor"];
    }
    else{
        [self wrapJSONData:json];
    }
    
    return self;
}

@end
