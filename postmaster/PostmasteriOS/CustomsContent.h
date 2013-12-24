//
//  CustomsContent.h
//  PostmasteriOS
//
//  Created by luczakp on 17.09.2013.
//  Copyright (c) 2013 STXNext. All rights reserved.
//

#import "PostmasterEntity.h"

@interface CustomsContent : PostmasterEntity

@property(nonatomic,retain) NSString* description;
extern NSString *const CUSTOMS_CONTENT_DESCRIPTION;
@property(nonatomic,retain) NSString* value;
extern NSString *const CUSTOMS_CONTENT_VALUE;
@property(nonatomic,retain) NSNumber* weight;
extern NSString *const CUSTOMS_CONTENT_WEIGHT;
@property(nonatomic,retain) NSString* weightUnits;
extern NSString *const CUSTOMS_CONTENT_WEIGHTUNITS;
@property(nonatomic,retain) NSNumber* quantity;
extern NSString *const CUSTOMS_CONTENT_QUANTITY;
@property(nonatomic,retain) NSString* hsTariffNumber;
extern NSString *const CUSTOMS_CONTENT_HSTARIFFNUMBER;
@property(nonatomic,retain) NSString* countryOfOrigin;
extern NSString *const CUSTOMS_CONTENT_COUNTRY_OF_ORIGIN;

@end
