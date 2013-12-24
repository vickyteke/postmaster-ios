//
//  PostMasterRequest.h
//  PostmasteriOS
//
//  Created by luczakp on 17.06.2013.
//  Copyright (c) 2013 STXNext. All rights reserved.
//

#define CONTENT_TYPE_KEY @"Content-Type"
#define CONTENT_TYPE_JSON @"application/json"

#define CONTENT_LENGTH_KEY @"Content-Length"

#define CONN_TYPE_POST @"POST"
#define CONN_TYPE_GET @"GET"
#define CONN_TYPE_DELETE @"DELETE"
#define CONN_TYPE_PUT @"PUT"
#define API_VERSION_1 @"v1"

#import <Foundation/Foundation.h>
@class Address,Shipment,Box,DeliveryTimeQueryMessage,RateQueryMessage,PackageFitQueryMessage, MonitorPackageQueryMessage;

@interface PostMasterRequest : NSMutableURLRequest{
    NSString* _apiKey;
}
//address
+(PostMasterRequest*)validateAddressRequest:(Address*)address;

//shipment
+(PostMasterRequest*)createShipmentRequest:(Shipment*)shipment;
+(PostMasterRequest*)fetchShipmentRequestWithCursor:(NSString*)cursor andLimit:(NSInteger)limit;
+(PostMasterRequest*)fetchShipmentById:(NSNumber*)shipmentId;
+(PostMasterRequest*)trackShipmentRequest:(NSNumber*)shipmentId;
+(PostMasterRequest*)trackByReferenceNumber:(NSString*)referenceNumber;
+(PostMasterRequest*)voidShipmentRequest:(NSNumber*)shipmentId;
+(PostMasterRequest*)deliveryTimeRequest:(DeliveryTimeQueryMessage*)message;
+(PostMasterRequest*)rates:(RateQueryMessage*)message;
+(PostMasterRequest*)monitorExternalPackage:(MonitorPackageQueryMessage*)query;

//boxes
+(PostMasterRequest*)fetchBoxesRequestWithCursor:(NSString*)cursor andLimit:(NSInteger)limit;
+(PostMasterRequest*)createBoxRequest:(Box*)box;
+(PostMasterRequest*)packageFitRequest:(PackageFitQueryMessage*)message;
@end
