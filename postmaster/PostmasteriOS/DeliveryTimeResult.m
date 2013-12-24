//
//  DeliveryTimeResult.m
//  PostmasteriOS
//
//  Created by luczakp on 24.06.2013.
//  Copyright (c) 2013 STXNext. All rights reserved.
//

#import "DeliveryTimeResult.h"

@implementation DeliveryTimeResult

-(id)initWithJSON:(NSDictionary*)json{
    self=[super init];
    
    if([json objectForKey:@"services"]){
        self.services = [Service getFromJSONArray:[json objectForKey:@"services"]];
    }
    else{
        [self wrapJSONData:json];
    }
    return self;
}

@end
