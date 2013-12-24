//
//  Package.m
//  PostmasteriOS
//
//  Created by luczakp on 20.06.2013.
//  Copyright (c) 2013 STXNext. All rights reserved.
//

#import "Package.h"

@implementation Package

NSString *const PACKAGE_KEY_DIMENSION_UNITS = @"dimension_units";
NSString *const PACKAGE_KEY_HEIGHT = @"height";
NSString *const PACKAGE_KEY_LENGTH = @"length";
NSString *const PACKAGE_KEY_TYPE = @"type";
NSString *const PACKAGE_KEY_WEIGHT = @"weight";
NSString *const PACKAGE_KEY_WEIGHT_UNITS = @"weight_units";
NSString *const PACKAGE_KEY_WIDTH = @"width";
NSString *const PACKAGE_KEY_VALUE = @"value";
NSString *const PACKAGE_KEY_LABELURL = @"label_url";
NSString *const PACKAGE_KEY_CUSTOMS = @"customs";

-(NSDictionary*)toJSONReadyDictionary{
    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    [self putPropertyToJsonReadyDictionary:dict ofKey:PACKAGE_KEY_DIMENSION_UNITS andObject:self.dimensionUnits];
    [self putPropertyToJsonReadyDictionary:dict ofKey:PACKAGE_KEY_HEIGHT andObject:self.height];
    [self putPropertyToJsonReadyDictionary:dict ofKey:PACKAGE_KEY_LENGTH andObject:self.length];
    [self putPropertyToJsonReadyDictionary:dict ofKey:PACKAGE_KEY_TYPE andObject:self.type];
    [self putPropertyToJsonReadyDictionary:dict ofKey:PACKAGE_KEY_WEIGHT andObject:self.weight];
    [self putPropertyToJsonReadyDictionary:dict ofKey:PACKAGE_KEY_WEIGHT_UNITS andObject:self.weightUnits];
    [self putPropertyToJsonReadyDictionary:dict ofKey:PACKAGE_KEY_WIDTH andObject:self.width];
    [self putPropertyToJsonReadyDictionary:dict ofKey:PACKAGE_KEY_VALUE andObject:self.value];
    [self putPropertyToJsonReadyDictionary:dict ofKey:PACKAGE_KEY_LABELURL andObject:self.labelurl];
    [self putPropertyToJsonReadyDictionary:dict ofKey:PACKAGE_KEY_CUSTOMS andObject:[self.customs toJSONReadyDictionary]];
    return dict;
}

-(id)initWithJSON:(NSDictionary*) jsonDict{
    if([jsonDict count] > 0){
    self = [super init];
    self.dimensionUnits = [jsonDict objectForKey:PACKAGE_KEY_DIMENSION_UNITS];
    self.height = [jsonDict objectForKey:PACKAGE_KEY_HEIGHT];
    self.length = [jsonDict objectForKey:PACKAGE_KEY_LENGTH];
    self.type = [jsonDict objectForKey:PACKAGE_KEY_TYPE];
    self.weight = [jsonDict objectForKey:PACKAGE_KEY_WEIGHT];
    self.weightUnits = [jsonDict objectForKey:PACKAGE_KEY_WEIGHT_UNITS];
    self.width = [jsonDict objectForKey:PACKAGE_KEY_WIDTH];
    self.value = [jsonDict objectForKey:PACKAGE_KEY_VALUE];
    self.labelurl = [jsonDict objectForKey:PACKAGE_KEY_LABELURL];
    self.customs = [[Customs alloc] initWithJSON:[jsonDict objectForKey:PACKAGE_KEY_CUSTOMS]];
    return self;
    }
    return nil;
}


@end
