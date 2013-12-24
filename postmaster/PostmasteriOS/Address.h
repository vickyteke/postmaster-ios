//
//  Address.h
//  PostmasteriOS
//
//  Created by luczakp on 17.06.2013.
//  Copyright (c) 2013 STXNext. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PostmasterEntity.h"
#import "AddressValidationResult.h"



@interface Address : PostmasterEntity

extern NSString *const DICT_KEY_ADDRESSES;

@property(nonatomic,retain) NSString* city;
extern NSString *const ADDRESS_KEY_CITY;
@property(nonatomic,retain) NSString* company;
extern NSString *const ADDRESS_KEY_COMPANY;
@property(nonatomic,retain) NSString* contact;
extern NSString *const ADDRESS_KEY_CONTACT;
@property(nonatomic,retain) NSString* country;
extern NSString *const ADDRESS_KEY_COUNTRY;
@property(nonatomic,retain) NSString* line1;
extern NSString *const ADDRESS_KEY_LINE1;
@property(nonatomic,retain) NSString* line2;
extern NSString *const ADDRESS_KEY_LINE2;
@property(nonatomic,retain) NSString* line3;
extern NSString *const ADDRESS_KEY_LINE3;

@property(nonatomic,retain) NSString* phoneNumber;
extern NSString *const ADDRESS_KEY_PHONE_NUMBER;
@property(nonatomic,assign) BOOL residential;
extern NSString *const ADDRESS_KEY_RESIDENTIAL;
@property(nonatomic,retain) NSString* state;
extern NSString *const ADDRESS_KEY_STATE;
@property(nonatomic,retain) NSString* zipCode;
extern NSString *const ADDRESS_KEY_ZIP_CODE;

-(AddressValidationResult*)validate;

@end
