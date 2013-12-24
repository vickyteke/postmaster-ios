//
//  BoxCreationResult.m
//  PostmasteriOS
//
//  Created by luczakp on 22.08.2013.
//  Copyright (c) 2013 STXNext. All rights reserved.
//

#import "BoxCreationResult.h"
#import "Box.h"

@implementation BoxCreationResult

-(id)initWithJSON:(NSDictionary*)json{
    self = [super init];
    if([json objectForKey:@"id"]){
        _boxId = [json objectForKey:@"id"];
    }else{
        [self wrapJSONData:json];
    }
    return self;
}

@end
