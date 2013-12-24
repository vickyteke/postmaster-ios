//
//  BoxData.m
//  PostmasteriOS
//
//  Created by luczakp on 22.08.2013.
//  Copyright (c) 2013 STXNext. All rights reserved.
//

#import "BoxData.h"

@implementation BoxData

NSString *const BOX_DATA_BOX = @"box";
NSString *const BOX_DATA_ITEMS = @"items";

-(NSDictionary*)toJSONReadyDictionary{
    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    [self putPropertyToJsonReadyDictionary:dict ofKey:BOX_DATA_BOX andObject:[self.box toJSONReadyDictionary]];
    if(self.items){
        [self putPropertyToJsonReadyDictionary:dict ofKey:BOX_DATA_ITEMS andObject:[Item convertToJsonArrayFromEntityArray:self.items]];
    }
    
    return dict;
}

-(id)initWithJSON:(NSDictionary*) jsonDict{
    if([jsonDict count] > 0){
        self = [super init];
        self.box = [[Box alloc] initWithJSON:[jsonDict objectForKey:BOX_DATA_BOX]];
        self.items = [Item getFromJSONArray:[jsonDict objectForKey:BOX_DATA_ITEMS]];
        return self;
    }
    return nil;
}


@end
