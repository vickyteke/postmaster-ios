//
//  Service.m
//  PostmasteriOS
//
//  Created by luczakp on 21.06.2013.
//  Copyright (c) 2013 STXNext. All rights reserved.
//

#import "Service.h"

@implementation Service

NSString *const SERVICE_KEY_DELIVERYTIMESTAMP = @"delivery_timestamp";
NSString *const SERVICE_KEY_SERVICE = @"service";

-(NSDictionary*)toJSONReadyDictionary{
    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    [self putPropertyToJsonReadyDictionary:dict ofKey:SERVICE_KEY_DELIVERYTIMESTAMP andObject:self.deliveryTimestamp];
    [self putPropertyToJsonReadyDictionary:dict ofKey:SERVICE_KEY_SERVICE andObject:self.service];
    return dict;
}

-(id)initWithJSON:(NSDictionary*) jsonDict{
    if([jsonDict count] > 0){
    self = [super init];
    self.deliveryTimestamp = [jsonDict objectForKey:SERVICE_KEY_DELIVERYTIMESTAMP];
    self.service = [jsonDict objectForKey:SERVICE_KEY_SERVICE];
    return self;
    }
    return nil;
}

@end
