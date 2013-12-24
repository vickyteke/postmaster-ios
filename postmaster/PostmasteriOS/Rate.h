//
//  Rate.h
//  PostmasteriOS
//
//  Created by luczakp on 21.06.2013.
//  Copyright (c) 2013 STXNext. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PostmasterEntity.h"

@interface Rate : PostmasterEntity

@property(nonatomic,retain) NSString* charge;
extern NSString *const RATE_KEY_CHARGE;
@property(nonatomic,retain) NSString* currency;
extern NSString *const RATE_KEY_CURRENCY;
@property(nonatomic,retain) NSString* service;
extern NSString *const RATE_KEY_SERVICE;

@end
