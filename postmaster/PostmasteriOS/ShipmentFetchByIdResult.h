//
//  ShipmentFetchByIdResult.h
//  PostmasteriOS
//
//  Created by luczakp on 14.07.2013.
//  Copyright (c) 2013 STXNext. All rights reserved.
//

#import "OperationResult.h"

@class Shipment;

@interface ShipmentFetchByIdResult : OperationResult

@property(nonatomic,retain) Shipment* shipment;

@end
