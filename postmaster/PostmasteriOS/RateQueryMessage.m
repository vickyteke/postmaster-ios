//
//  RateQueryMessage.m
//  PostmasteriOS
//
//  Created by luczakp on 21.06.2013.
//  Copyright (c) 2013 STXNext. All rights reserved.
//

#import "RateQueryMessage.h"

@implementation RateQueryMessage

NSString *const RATE_QUERY_KEY_CARRIER = @"carrier";
NSString *const RATE_QUERY_KEY_FROMZIP = @"from_zip";
NSString *const RATE_QUERY_KEY_WEIGHT = @"weight";
NSString *const RATE_QUERY_KEY_SERVICE = @"service";
NSString *const RATE_QUERY_KEY_TOZIP = @"to_zip";
NSString *const RATE_QUERY_KEY_COMMERCIAL = @"commercial";
NSString *const RATE_QUERY_KEY_PACKAGING = @"packaging";

-(NSDictionary*)toJSONReadyDictionary{
    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    [self putPropertyToJsonReadyDictionary:dict ofKey:RATE_QUERY_KEY_CARRIER andObject:self.carrier];
    [self putPropertyToJsonReadyDictionary:dict ofKey:RATE_QUERY_KEY_FROMZIP andObject:self.fromZip];
    [self putPropertyToJsonReadyDictionary:dict ofKey:RATE_QUERY_KEY_WEIGHT andObject:self.weight];
    [self putPropertyToJsonReadyDictionary:dict ofKey:RATE_QUERY_KEY_SERVICE andObject:self.service];
    [self putPropertyToJsonReadyDictionary:dict ofKey:RATE_QUERY_KEY_TOZIP andObject:self.toZip];
    //[self putPropertyToJsonReadyDictionary:dict ofKey:KEY_COMMERCIAL andObject:self.commercial];
    [self putPropertyToJsonReadyDictionary:dict ofKey:RATE_QUERY_KEY_PACKAGING andObject:self.packaging];
    return dict;
}

-(id)initWithJSON:(NSDictionary*) jsonDict{
    [NSException raise:@"Bad constructor used" format:@"This entity is one way only for client applications. It can be only sent to API"];
    return nil;
}

@end
