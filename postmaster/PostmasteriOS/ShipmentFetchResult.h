//
//  ShipmentFetchResult.h
//  PostmasteriOS
//
//  Created by luczakp on 24.06.2013.
//  Copyright (c) 2013 STXNext. All rights reserved.
//

#import "OperationResult.h"

@class Shipment;
@interface ShipmentFetchResult : OperationResult

@property(nonatomic,retain) NSArray* shipments;
@property(nonatomic,retain) NSString* cursor;
@property(nonatomic,retain) NSString* previousCursor;

@end
