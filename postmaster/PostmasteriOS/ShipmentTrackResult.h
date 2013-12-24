//
//  ShipmentTrackResult.h
//  PostmasteriOS
//
//  Created by luczakp on 24.06.2013.
//  Copyright (c) 2013 STXNext. All rights reserved.
//

#import "OperationResult.h"
#import "TrackingDetails.h"

@interface ShipmentTrackResult : OperationResult

@property(nonatomic,retain) NSArray* trackingDetails;

@end
