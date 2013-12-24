//
//  DeliveryTimeQueryMessage.h
//  PostmasteriOS
//
//  Created by luczakp on 21.06.2013.
//  Copyright (c) 2013 STXNext. All rights reserved.
//

#import "PostmasterEntity.h"

@interface DeliveryTimeQueryMessage : PostmasterEntity

@property(nonatomic,retain) NSString* fromZip;
extern NSString *const DELIVERY_KEY_FROMZIP;
@property(nonatomic,retain) NSString* toZip;
extern NSString *const DELIVERY_KEY_TOZIP;
@property(nonatomic,retain) NSNumber* weight;
extern NSString *const DELIVERY_KEY_WEIGHT;
@property(nonatomic,retain) NSString* carrier;
extern NSString *const DELIVERY_KEY_CARRIER;

@end
