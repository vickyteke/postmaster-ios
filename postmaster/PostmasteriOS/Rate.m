//
//  Rate.m
//  PostmasteriOS
//
//  Created by luczakp on 21.06.2013.
//  Copyright (c) 2013 STXNext. All rights reserved.
//

#import "Rate.h"

@implementation Rate

NSString *const RATE_KEY_CHARGE = @"charge";
NSString *const RATE_KEY_CURRENCY = @"currency";
NSString *const RATE_KEY_SERVICE = @"service";

-(NSDictionary*)toJSONReadyDictionary{
    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    [self putPropertyToJsonReadyDictionary:dict ofKey:RATE_KEY_CHARGE andObject:self.charge];
    [self putPropertyToJsonReadyDictionary:dict ofKey:RATE_KEY_CURRENCY andObject:self.currency];
    [self putPropertyToJsonReadyDictionary:dict ofKey:RATE_KEY_SERVICE andObject:self.service];
    return dict;
}

-(id)initWithJSON:(NSDictionary*) jsonDict{
    if([jsonDict count] > 0){
    self = [super init];
    self.service = [jsonDict objectForKey:RATE_KEY_SERVICE];
    self.currency = [jsonDict objectForKey:RATE_KEY_CURRENCY];
    self.charge = [jsonDict objectForKey:RATE_KEY_CHARGE];
    return self;
    }
    return nil;
}

@end
