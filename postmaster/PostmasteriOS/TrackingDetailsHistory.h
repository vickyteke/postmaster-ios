//
//  TrackingDetailsHistory.h
//  PostmasteriOS
//
//  Created by luczakp on 21.06.2013.
//  Copyright (c) 2013 STXNext. All rights reserved.
//

#import "PostmasterEntity.h"

@interface TrackingDetailsHistory : PostmasterEntity

@property(nonatomic,retain) NSString* city;
extern NSString *const TRACKING_DETAILS_HISTORY_KEY_CITY;
@property(nonatomic,retain) NSString* code;
extern NSString *const TRACKING_DETAILS_HISTORY_KEY_CODE;
@property(nonatomic,retain) NSString* countryCode;
extern NSString *const TRACKING_DETAILS_HISTORY_KEY_COUNTRYCODE;
@property(nonatomic,retain) NSString* description;
extern NSString *const TRACKING_DETAILS_HISTORY_KEY_DESCRIPTION;
@property(nonatomic,retain) NSString* postalCode;
extern NSString *const TRACKING_DETAILS_HISTORY_KEY_POSTALCODE;
@property(nonatomic,retain) NSString* state;
extern NSString *const TRACKING_DETAILS_HISTORY_KEY_STATE;
@property(nonatomic,retain) NSString* status;
extern NSString *const TRACKING_DETAILS_HISTORY_KEY_STATUS;
@property(nonatomic,retain) NSNumber* timestamp;
extern NSString *const TRACKING_DETAILS_HISTORY_KEY_TIMESTAMP;

@end
