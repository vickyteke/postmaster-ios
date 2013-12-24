//
//  TrackingDetails.h
//  PostmasteriOS
//
//  Created by luczakp on 21.06.2013.
//  Copyright (c) 2013 STXNext. All rights reserved.
//

#import "PostmasterEntity.h"
#import "TrackingDetailsHistory.h"

@interface TrackingDetails : PostmasterEntity

@property(nonatomic,retain) NSMutableArray* history;
extern NSString *const TRACKING_DETAILS_KEY_HISTORY;
@property(nonatomic,retain) NSNumber* lastUpdate;
extern NSString *const TRACKING_DETAILS_KEY_LASTUPDATE;
@property(nonatomic,retain) NSString* status;
extern NSString *const TRACKING_DETAILS_KEY_STATUS;

@end
