//
//  Address.m
//  PostmasteriOS
//
//  Created by luczakp on 17.06.2013.
//  Copyright (c) 2013 STXNext. All rights reserved.
//

#import "Address.h"
#import "PostMasterRequest.h"
#import "SBJson.h"

NSString *const DICT_KEY_ADDRESSES = @"addresses";

NSString *const ADDRESS_KEY_CITY = @"city";
NSString *const ADDRESS_KEY_COMPANY = @"company";
NSString *const ADDRESS_KEY_CONTACT = @"contact";
NSString *const ADDRESS_KEY_COUNTRY = @"country";
NSString *const ADDRESS_KEY_LINE1 = @"line1";
NSString *const ADDRESS_KEY_LINE2 = @"line2";
NSString *const ADDRESS_KEY_LINE3 = @"line3";
NSString *const ADDRESS_KEY_PHONE_NUMBER = @"phone_no";
NSString *const ADDRESS_KEY_RESIDENTIAL = @"residential";
NSString *const ADDRESS_KEY_STATE = @"state";
NSString *const ADDRESS_KEY_ZIP_CODE = @"zip_code";

@implementation Address

-(AddressValidationResult*)validate{
    
    PostMasterRequest *request = [PostMasterRequest validateAddressRequest:self];

    NSHTTPURLResponse *receivedResponse;
    NSError *receivedError;
    NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:&receivedResponse error:&receivedError];
    
    AddressValidationResult* result;
    if(receivedError){
        result = [[AddressValidationResult alloc] initWithCommonHTTPError:receivedError];
    }
    else{
        SBJsonParser *jsonParser = [[SBJsonParser alloc] init];
        NSMutableDictionary* jsonResponse =[jsonParser objectWithData:data];
        result = [[AddressValidationResult alloc] initWithJSON:jsonResponse];
    }
    
    return result;
}

-(NSDictionary*)toJSONReadyDictionary{
        NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    [self putPropertyToJsonReadyDictionary:dict ofKey:ADDRESS_KEY_CITY andObject:self.city];
    [self putPropertyToJsonReadyDictionary:dict ofKey:ADDRESS_KEY_COMPANY andObject:self.company];
    [self putPropertyToJsonReadyDictionary:dict ofKey:ADDRESS_KEY_CONTACT andObject:self.contact];
    [self putPropertyToJsonReadyDictionary:dict ofKey:ADDRESS_KEY_COUNTRY andObject:self.country];
    [self putPropertyToJsonReadyDictionary:dict ofKey:ADDRESS_KEY_LINE1 andObject:self.line1];
    [self putPropertyToJsonReadyDictionary:dict ofKey:ADDRESS_KEY_LINE2 andObject:self.line2];
    [self putPropertyToJsonReadyDictionary:dict ofKey:ADDRESS_KEY_LINE3 andObject:self.line3];
    [self putPropertyToJsonReadyDictionary:dict ofKey:ADDRESS_KEY_PHONE_NUMBER andObject:self.phoneNumber];
    [self putPropertyToJsonReadyDictionary:dict ofKey:ADDRESS_KEY_STATE andObject:self.state];
    [self putPropertyToJsonReadyDictionary:dict ofKey:ADDRESS_KEY_ZIP_CODE andObject:self.zipCode];
    return dict;
}

-(id)initWithJSON:(NSDictionary*) jsonDict{
    if([jsonDict count] > 0){
        self = [super init];
        self.city = [jsonDict objectForKey:ADDRESS_KEY_CITY];
        self.company = [jsonDict objectForKey:ADDRESS_KEY_COMPANY];
        self.contact = [jsonDict objectForKey:ADDRESS_KEY_CONTACT];
        self.country = [jsonDict objectForKey:ADDRESS_KEY_COUNTRY];
        self.line1 = [jsonDict objectForKey:ADDRESS_KEY_LINE1];
        self.line2 = [jsonDict objectForKey:ADDRESS_KEY_LINE2];
        self.line3 = [jsonDict objectForKey:ADDRESS_KEY_LINE3];
        self.phoneNumber = [jsonDict objectForKey:ADDRESS_KEY_PHONE_NUMBER];
        self.state = [jsonDict objectForKey:ADDRESS_KEY_STATE];
        self.zipCode = [jsonDict objectForKey:ADDRESS_KEY_ZIP_CODE];
        self.residential = [[jsonDict objectForKey:ADDRESS_KEY_RESIDENTIAL] boolValue];
    
        return self;
    }
    return nil;
}

@end
