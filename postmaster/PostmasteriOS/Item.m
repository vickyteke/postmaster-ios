//
//  Item.m
//  PostmasteriOS
//
//  Created by luczakp on 22.08.2013.
//  Copyright (c) 2013 STXNext. All rights reserved.
//

#import "Item.h"

@implementation Item

NSString *const ITEM_WIDTH = @"width";
NSString *const ITEM_HEIGHT = @"height";
NSString *const ITEM_IMAGEURL = @"image_url";
NSString *const ITEM_LENGTH = @"length";
NSString *const ITEM_WEIGHT = @"weight";
NSString *const ITEM_WEIGHTUNITS = @"weight_units";
NSString *const ITEM_SIZEUNITS = @"size_units";
NSString *const ITEM_NAME = @"name";
NSString *const ITEM_SKU = @"sku";
NSString *const ITEM_COUNT = @"count";


-(NSDictionary*)toJSONReadyDictionary{
    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    [self putPropertyToJsonReadyDictionary:dict ofKey:ITEM_COUNT andObject:self.count];
    [self putPropertyToJsonReadyDictionary:dict ofKey:ITEM_HEIGHT andObject:self.height];
    [self putPropertyToJsonReadyDictionary:dict ofKey:ITEM_IMAGEURL andObject:self.imageUrl];
    [self putPropertyToJsonReadyDictionary:dict ofKey:ITEM_LENGTH andObject:self.length];
    [self putPropertyToJsonReadyDictionary:dict ofKey:ITEM_NAME andObject:self.name];
    [self putPropertyToJsonReadyDictionary:dict ofKey:ITEM_SIZEUNITS andObject:self.sizeUnits];
    [self putPropertyToJsonReadyDictionary:dict ofKey:ITEM_SKU andObject:self.sku];
    [self putPropertyToJsonReadyDictionary:dict ofKey:ITEM_WEIGHT andObject:self.weight];
    [self putPropertyToJsonReadyDictionary:dict ofKey:ITEM_WEIGHTUNITS andObject:self.weightUnits];
    [self putPropertyToJsonReadyDictionary:dict ofKey:ITEM_WIDTH andObject:self.width];
    
    return dict;
}

-(id)initWithJSON:(NSDictionary*) jsonDict{
    if([jsonDict count] > 0){
        self = [super init];
        self.count = [jsonDict objectForKey:ITEM_COUNT];
        self.height = [jsonDict objectForKey:ITEM_HEIGHT];
        self.imageUrl = [jsonDict objectForKey:ITEM_IMAGEURL];
        self.length = [jsonDict objectForKey:ITEM_LENGTH];
        self.name = [jsonDict objectForKey:ITEM_NAME];
        self.sizeUnits = [jsonDict objectForKey:ITEM_SIZEUNITS];
        self.sku = [jsonDict objectForKey:ITEM_SKU];
        self.weight = [jsonDict objectForKey:ITEM_WEIGHT];
        self.weightUnits = [jsonDict objectForKey:ITEM_WEIGHTUNITS];
        self.width = [jsonDict objectForKey:ITEM_WIDTH];
        return self;
    }
    return nil;
}


@end
