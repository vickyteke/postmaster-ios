//
//  Package.h
//  PostmasteriOS
//
//  Created by luczakp on 20.06.2013.
//  Copyright (c) 2013 STXNext. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PostmasterEntity.h"
#import "Customs.h"

@interface Package : PostmasterEntity

@property(nonatomic,retain) NSString* dimensionUnits;
extern NSString *const PACKAGE_KEY_DIMENSION_UNITS;
@property(nonatomic,retain) NSNumber* height;
extern NSString *const PACKAGE_KEY_HEIGHT;
@property(nonatomic,retain) NSNumber* length;
extern NSString *const PACKAGE_KEY_LENGTH;
@property(nonatomic,retain) NSString* type;
extern NSString *const PACKAGE_KEY_TYPE;
@property(nonatomic,retain) NSNumber* weight;
extern NSString *const PACKAGE_KEY_WEIGHT;
@property(nonatomic,retain) NSString* weightUnits;
extern NSString *const PACKAGE_KEY_WEIGHT_UNITS;
@property(nonatomic,retain) NSNumber* width;
extern NSString *const PACKAGE_KEY_WIDTH;
@property(nonatomic,retain) NSString* value;
extern NSString *const PACKAGE_KEY_VALUE;
@property(nonatomic,retain) NSString* labelurl;
extern NSString *const PACKAGE_KEY_LABELURL;
@property(nonatomic,retain) Customs* customs;
extern NSString *const PACKAGE_KEY_CUSTOMS;

@end
