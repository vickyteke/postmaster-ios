//
//  RateQueryMessage.h
//  PostmasteriOS
//
//  Created by luczakp on 21.06.2013.
//  Copyright (c) 2013 STXNext. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PostmasterEntity.h"

@interface RateQueryMessage : PostmasterEntity

@property(nonatomic,retain) NSString* carrier;
extern NSString *const RATE_QUERY_KEY_CARRIER;
@property(nonatomic,retain) NSString* fromZip;
extern NSString *const RATE_QUERY_KEY_FROMZIP;
@property(nonatomic,retain) NSNumber* weight;
extern NSString *const RATE_QUERY_KEY_WEIGHT;
@property(nonatomic,retain) NSString* service;
extern NSString *const RATE_QUERY_KEY_SERVICE;
@property(nonatomic,retain) NSString* toZip;
extern NSString *const RATE_QUERY_KEY_TOZIP;
@property(nonatomic,assign) BOOL* commercial;
extern NSString *const RATE_QUERY_KEY_COMMERCIAL;
@property(nonatomic,retain) NSString* packaging;
extern NSString *const RATE_QUERY_KEY_PACKAGING;

@end
