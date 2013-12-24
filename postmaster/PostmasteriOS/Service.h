//
//  Service.h
//  PostmasteriOS
//
//  Created by luczakp on 21.06.2013.
//  Copyright (c) 2013 STXNext. All rights reserved.
//

#import "PostmasterEntity.h"

@interface Service : PostmasterEntity

@property(nonatomic,retain) NSNumber* deliveryTimestamp;
extern NSString *const SERVICE_KEY_DELIVERYTIMESTAMP;
@property(nonatomic,retain) NSString* service;
extern NSString *const SERVICE_KEY_SERVICE;


@end
