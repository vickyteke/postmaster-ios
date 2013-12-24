//
//  Shipment.h
//  PostmasteriOS
//
//  Created by luczakp on 21.06.2013.
//  Copyright (c) 2013 STXNext. All rights reserved.
//

#import "PostmasterEntity.h"
#import "Address.h"
#import "Package.h"
#import "DeliveryTimeQueryMessage.h"
#import "RateQueryMessage.h"
#import "TrackingDetails.h"
#import "TrackingDetailsHistory.h"
#import "Service.h"
#import "Rate.h"

#import "ShipmentCreationResult.h"
#import "ShipmentFetchResult.h"
#import "ShipmentTrackResult.h"
#import "ShipmentTrackByReferenceResult.h"
#import "DeliveryTimeQueryMessage.h"
#import "DeliveryTimeResult.h"
#import "RateQueryMessage.h"
#import "RateResult.h"
#import "ShipmentVoidResult.h"
#import "ShipmentFetchByIdResult.h"
#import "MonitorPackageQueryMessage.h"
#import "MonitorPackageResult.h"

@interface Shipment : PostmasterEntity

extern NSString *const DICT_KEY_TRACKING_RESULTS;
extern NSString *const DICT_KEY_TRACKING_RESULTS_HISTORY;
extern NSString *const DICT_KEY_DELIVERY_TIMES;
extern NSString *const DICT_KEY_SHIPMENT_FETCH;
extern NSString *const DICT_KEY_SHIPMENT_PREVIOUS_CURSOR;
extern NSString *const DICT_KEY_SHIPMENT_CURSOR;

@property(nonatomic,retain) NSString* carrier;
extern NSString *const SHIPMENT_KEY_CARRIER;
@property(nonatomic,retain) NSNumber* createdAt;
extern NSString *const SHIPMENT_KEY_CREATEDAT;
@property(nonatomic,retain) NSNumber* cost;
extern NSString *const SHIPMENT_KEY_COST;
@property(nonatomic,retain) Address* from;
extern NSString *const SHIPMENT_KEY_FROM;
@property(nonatomic,retain) NSNumber* shipmentId;
extern NSString *const SHIPMENT_KEY_SHIPMENTID;
@property(nonatomic,retain) Package* packageInfo;
extern NSString *const SHIPMENT_KEY_PACKAGEINFO;
@property(nonatomic,retain) NSNumber* packageCount;
extern NSString *const SHIPMENT_KEY_PACKAGECOUNT;
@property(nonatomic,retain) NSArray* packages;
extern NSString *const SHIPMENT_KEY_PACKAGES;
@property(nonatomic,retain) NSString* status;
extern NSString *const SHIPMENT_KEY_STATUS;
@property(nonatomic,retain) Address* to;
extern NSString *const SHIPMENT_KEY_TO;
@property(nonatomic,retain) NSArray* tracking;
extern NSString *const SHIPMENT_KEY_TRACKING;
@property(nonatomic,retain) NSString* service;
extern NSString *const SHIPMENT_KEY_SERVICE;
@property(nonatomic,retain) NSString* reference;
extern NSString *const SHIPMENT_KEY_REFERENCE;
@property(nonatomic,retain) NSString* porder;
extern NSString *const SHIPMENT_KEY_PORDER;

-(ShipmentCreationResult*)createShipment;
+(ShipmentFetchResult*)fetchShipmentsWithCursor:(NSString*)cursor andLimit:(NSInteger)limit;
+(ShipmentFetchResult*)fetchShipmentById:(NSNumber*)shipmentId;
+(ShipmentTrackResult*)track:(NSNumber*) shipmentId;
-(ShipmentTrackResult*)track;
+(MonitorPackageResult*)monitorExternalPackage:(MonitorPackageQueryMessage*)query;
+(ShipmentTrackByReferenceResult*)trackByReferenceNumber:(NSString*)referenceNumber;
+(ShipmentVoidResult*)voidShipment:(NSNumber*) shipmentId;
-(ShipmentVoidResult*)voidShipment;
+(DeliveryTimeResult*)deliveryTime:(DeliveryTimeQueryMessage*)message;
+(RateResult*)rates:(RateQueryMessage*)rateMessage;


@end
