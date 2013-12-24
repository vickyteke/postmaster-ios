//
//  ShipmentCreationResult.m
//  PostmasteriOS
//
//  Created by luczakp on 24.06.2013.
//  Copyright (c) 2013 STXNext. All rights reserved.
//

#import "ShipmentCreationResult.h"
#import "Shipment.h"

@implementation ShipmentCreationResult

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
