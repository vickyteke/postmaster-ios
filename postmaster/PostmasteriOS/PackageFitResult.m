//
//  PackageFitResult.m
//  PostmasteriOS
//
//  Created by luczakp on 23.08.2013.
//  Copyright (c) 2013 STXNext. All rights reserved.
//

#import "PackageFitResult.h"
#import "PackageFitInfo.h"

@implementation PackageFitResult

-(id)initWithJSON:(NSDictionary*)json{
    self = [super init];
    if([json objectForKey:@"boxes"]){
        _fitInfo = [[PackageFitInfo alloc] initWithJSON:json];
    }else{
        [self wrapJSONData:json];
    }
    return self;
}

@end
