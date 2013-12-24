//
//  AddressValidationResult.m
//  PostmasteriOS
//
//  Created by luczakp on 08.07.2013.
//  Copyright (c) 2013 STXNext. All rights reserved.
//

#import "AddressValidationResult.h"
#import "Address.h"

@implementation AddressValidationResult

-(id)initWithJSON:(NSDictionary *)json{
    self = [super init];
    
    if([json objectForKey:@"addresses"]){
        _standarizedAddresses = [Address getFromJSONArray:[json objectForKey:@"addresses"]];
    }
    else{
        [self wrapJSONData:json];
    }
    
    return self;
}

@end
