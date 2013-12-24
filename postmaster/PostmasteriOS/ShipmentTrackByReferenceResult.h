//
//  ShipmentTrackByReferenceResult.h
//  PostmasteriOS
//
//  Created by luczakp on 24.06.2013.
//  Copyright (c) 2013 STXNext. All rights reserved.
//

#import "OperationResult.h"
#import "TrackingDetailsHistory.h"

@interface ShipmentTrackByReferenceResult : OperationResult

@property(nonatomic,retain) NSArray* trackingHistoryList;

@end
