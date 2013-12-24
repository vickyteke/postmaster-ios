//
//  DeliveryTimeQueryMessage.m
//  PostmasteriOS
//
//  Created by luczakp on 21.06.2013.
//  Copyright (c) 2013 STXNext. All rights reserved.
//

#import "DeliveryTimeQueryMessage.h"

@implementation DeliveryTimeQueryMessage

NSString *const DELIVERY_KEY_FROMZIP = @"from_zip";
NSString *const DELIVERY_KEY_TOZIP = @"to_zip";
NSString *const DELIVERY_KEY_WEIGHT = @"weight";
NSString *const DELIVERY_KEY_CARRIER = @"carrier";

-(NSDictionary*)toJSONReadyDictionary{
    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    [self putPropertyToJsonReadyDictionary:dict ofKey:DELIVERY_KEY_FROMZIP andObject:self.fromZip];
    [self putPropertyToJsonReadyDictionary:dict ofKey:DELIVERY_KEY_TOZIP andObject:self.toZip];
    [self putPropertyToJsonReadyDictionary:dict ofKey:DELIVERY_KEY_WEIGHT andObject:self.weight];
    [self putPropertyToJsonReadyDictionary:dict ofKey:DELIVERY_KEY_CARRIER andObject:self.carrier];
    return dict;
}

-(id)initWithJSON:(NSDictionary*) jsonDict{
    if([jsonDict count] > 0){
    self = [super init];
    
    self.fromZip = [jsonDict objectForKey:DELIVERY_KEY_FROMZIP];
    self.toZip = [jsonDict objectForKey:DELIVERY_KEY_TOZIP];
    self.weight = [jsonDict objectForKey:DELIVERY_KEY_WEIGHT];
    self.carrier = [jsonDict objectForKey:DELIVERY_KEY_CARRIER];
    
    return self;
    }
    return nil;
}

@end
