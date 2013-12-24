//
//  ShipmentCreationResult.h
//  PostmasteriOS
//
//  Created by luczakp on 24.06.2013.
//  Copyright (c) 2013 STXNext. All rights reserved.
//

#import "OperationResult.h"

@class Shipment;

@interface ShipmentCreationResult : OperationResult

@property(nonatomic,retain) Shipment* shipment;

@end
