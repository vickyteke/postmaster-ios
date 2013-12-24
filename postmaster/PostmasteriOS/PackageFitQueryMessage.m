//
//  PackageFitQueryMessage.m
//  PostmasteriOS
//
//  Created by luczakp on 22.08.2013.
//  Copyright (c) 2013 STXNext. All rights reserved.
//

#import "PackageFitQueryMessage.h"

@implementation PackageFitQueryMessage

NSString *const PACKAGE_FIT_ITEMS = @"items";
NSString *const PACKAGE_FIT_PACKAGES = @"packages";

-(id)init{
    self = [super init];
    self.items = [NSMutableArray array];
    self.packages = [NSMutableArray array];
    return self;
}

-(NSDictionary*)toJSONReadyDictionary{
    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    if(self.items){
        [self putPropertyToJsonReadyDictionary:dict ofKey:PACKAGE_FIT_ITEMS andObject:[Item convertToJsonArrayFromEntityArray:self.items]];
    }
    if(self.packages){
        [self putPropertyToJsonReadyDictionary:dict ofKey:PACKAGE_FIT_PACKAGES andObject:[Box convertToJsonArrayFromEntityArray:self.packages]];
    }
    
    return dict;
}

-(id)initWithJSON:(NSDictionary*) jsonDict{
    if([jsonDict count] > 0){
        self = [super init];
        self.packages = [Box getFromJSONArray:[jsonDict objectForKey:PACKAGE_FIT_PACKAGES]];
        self.items = [Box getFromJSONArray:[jsonDict objectForKey:PACKAGE_FIT_ITEMS]]; 
        return self;
    }
    return nil;
}


@end
