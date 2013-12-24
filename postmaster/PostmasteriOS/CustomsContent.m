//
//  CustomsContent.m
//  PostmasteriOS
//
//  Created by luczakp on 17.09.2013.
//  Copyright (c) 2013 STXNext. All rights reserved.
//

#import "CustomsContent.h"

@implementation CustomsContent

NSString *const CUSTOMS_CONTENT_DESCRIPTION = @"description";
NSString *const CUSTOMS_CONTENT_VALUE = @"value";
NSString *const CUSTOMS_CONTENT_WEIGHT = @"weight";
NSString *const CUSTOMS_CONTENT_WEIGHTUNITS = @"weightUnits";
NSString *const CUSTOMS_CONTENT_QUANTITY = @"quantity";
NSString *const CUSTOMS_CONTENT_HSTARIFFNUMBER = @"hs_tariff_number";
NSString *const CUSTOMS_CONTENT_COUNTRY_OF_ORIGIN = @"country_of_origin";

-(id)initWithJSON:(NSDictionary*) jsonDict{
    if([jsonDict count] > 0){
        self = [super init];
        self.description = [jsonDict objectForKey:CUSTOMS_CONTENT_DESCRIPTION];
        self.value = [jsonDict objectForKey:CUSTOMS_CONTENT_VALUE];
        self.weight = [jsonDict objectForKey:CUSTOMS_CONTENT_WEIGHT];
        self.weightUnits = [jsonDict objectForKey:CUSTOMS_CONTENT_WEIGHTUNITS];
        self.quantity = [jsonDict objectForKey:CUSTOMS_CONTENT_QUANTITY];
        self.hsTariffNumber = [jsonDict objectForKey:CUSTOMS_CONTENT_HSTARIFFNUMBER];
        self.countryOfOrigin = [jsonDict objectForKey:CUSTOMS_CONTENT_COUNTRY_OF_ORIGIN];
        return self;
    }
    return nil;
}

-(NSDictionary*)toJSONReadyDictionary{
    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    [self putPropertyToJsonReadyDictionary:dict ofKey:CUSTOMS_CONTENT_DESCRIPTION andObject:self.description];
    [self putPropertyToJsonReadyDictionary:dict ofKey:CUSTOMS_CONTENT_VALUE andObject:self.value];
    [self putPropertyToJsonReadyDictionary:dict ofKey:CUSTOMS_CONTENT_WEIGHT andObject:self.weight];
    [self putPropertyToJsonReadyDictionary:dict ofKey:CUSTOMS_CONTENT_WEIGHTUNITS andObject:self.weightUnits];
    [self putPropertyToJsonReadyDictionary:dict ofKey:CUSTOMS_CONTENT_QUANTITY andObject:self.quantity];
    [self putPropertyToJsonReadyDictionary:dict ofKey:CUSTOMS_CONTENT_HSTARIFFNUMBER andObject:self.hsTariffNumber];
    [self putPropertyToJsonReadyDictionary:dict ofKey:CUSTOMS_CONTENT_COUNTRY_OF_ORIGIN andObject:self.countryOfOrigin];
    return dict;
}

@end
