//
//  DeliveryTimeResult.h
//  PostmasteriOS
//
//  Created by luczakp on 24.06.2013.
//  Copyright (c) 2013 STXNext. All rights reserved.
//

#import "PostmasterEntity.h"
#import "OperationResult.h"
#import "Service.h"

@interface DeliveryTimeResult : OperationResult

@property(nonatomic,retain) NSArray* services;

@end
