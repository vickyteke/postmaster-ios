//
//  ShipmentFetchByIdResult.m
//  PostmasteriOS
//
//  Created by luczakp on 14.07.2013.
//  Copyright (c) 2013 STXNext. All rights reserved.
//

#import "ShipmentFetchByIdResult.h"
#import "Shipment.h"

@implementation ShipmentFetchByIdResult

-(id)initWithJSON:(NSDictionary*)json{
    self = [super init];
    if([json objectForKey:@"id"]){
        _shipment = [[Shipment alloc] initWithJSON:json];
    }else{
        [self wrapJSONData:json];
    }
    return self;
}

@end
