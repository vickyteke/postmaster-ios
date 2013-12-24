//
//  PostMasterRequest.m
//  PostmasteriOS
//
//  Created by luczakp on 17.06.2013.
//  Copyright (c) 2013 STXNext. All rights reserved.
//

#import "PostMasterRequest.h"
#import "Settings.h"
#import "Postmaster.h"
#import "Shipment.h"
#import "Base64Helper.h"
#import "SBJson.h"
#import "Address.h"
#import "Box.h"
#import "DeliveryTimeQueryMessage.h"
#import "PackageFitQueryMessage.h"
#import "RateQueryMessage.h"
#import "MonitorPackageQueryMessage.h"


@implementation PostMasterRequest


+(PostMasterRequest*)validateAddressRequest:(Address*)address{
    PostMasterRequest* request = [self requestWithHTTPMethod:CONN_TYPE_POST version:API_VERSION_1 path:@"/validate" parameters:nil];
    [request addContentLengthWithDictionary:[address toJSONReadyDictionary] ];
    return request;
}

+(PostMasterRequest*)createShipmentRequest:(Shipment*)shipment{
    PostMasterRequest* request = [self requestWithHTTPMethod:CONN_TYPE_POST version:API_VERSION_1 path:@"/shipments" parameters:nil];
    [request addContentLengthWithDictionary:[shipment toJSONReadyDictionary] ];
    return request;
}

+(PostMasterRequest*)trackShipmentRequest:(NSNumber*)shipmentId{
        PostMasterRequest* request = [self requestWithHTTPMethod:CONN_TYPE_GET version:API_VERSION_1 path:[NSString stringWithFormat:@"/shipments/%lld/track",[shipmentId longLongValue]] parameters:nil];
        return request;
}

+(PostMasterRequest*)trackByReferenceNumber:(NSString*)referenceNumber{
    PostMasterRequest* request = [self requestWithHTTPMethod:CONN_TYPE_GET version:API_VERSION_1 path:[NSString stringWithFormat:@"/track?tracking=%@",referenceNumber] parameters:nil];
    return request;
}

+(PostMasterRequest*)monitorExternalPackage:(MonitorPackageQueryMessage*)query{
    PostMasterRequest* request = [self requestWithHTTPMethod:CONN_TYPE_POST version:API_VERSION_1 path:@"/track" parameters:nil];
    [request addContentLengthWithDictionary:[query toJSONReadyDictionary] ];
    return request;
}

+(PostMasterRequest*)voidShipmentRequest:(NSNumber*)shipmentId{
    PostMasterRequest* request = [self requestWithHTTPMethod:CONN_TYPE_DELETE version:API_VERSION_1 path:[NSString stringWithFormat:@"/shipments/%lld/void",[shipmentId longLongValue]] parameters:nil];
    return request;
}

+(PostMasterRequest*)deliveryTimeRequest:(DeliveryTimeQueryMessage*)message{
    PostMasterRequest* request = [self requestWithHTTPMethod:CONN_TYPE_POST version:API_VERSION_1 path:@"/times" parameters:nil];
    [request addContentLengthWithDictionary:[message toJSONReadyDictionary] ];
    return request;
}

+(PostMasterRequest*)rates:(RateQueryMessage*)message{
    PostMasterRequest* request = [self requestWithHTTPMethod:CONN_TYPE_POST version:API_VERSION_1 path:@"/rates" parameters:nil];
    [request addContentLengthWithDictionary:[message toJSONReadyDictionary] ];
    return request;
}

+(PostMasterRequest*)fetchShipmentRequestWithCursor:(NSString*)cursor andLimit:(NSInteger)limit{
    NSMutableDictionary* params = [NSMutableDictionary dictionaryWithCapacity:2];
    if(cursor){
        [params setObject:cursor forKey:@"cursor"];
    }
    if(limit!=0){
        [params setObject:[NSString stringWithFormat:@"%d",limit] forKey:@"limit"];
    }
    
    PostMasterRequest* request = [self requestWithHTTPMethod:CONN_TYPE_GET version:API_VERSION_1 path:@"/shipments" parameters:params];
    return request;
}

+(PostMasterRequest*)fetchShipmentById:(NSNumber*)shipmentId{
    PostMasterRequest* request = [self requestWithHTTPMethod:CONN_TYPE_GET version:API_VERSION_1 path:[NSString stringWithFormat:@"/shipments/%lld",[shipmentId longLongValue]] parameters:nil];
    return request;
}

+(PostMasterRequest*)fetchBoxesRequestWithCursor:(NSString*)cursor andLimit:(NSInteger)limit{
    NSMutableDictionary* params = [NSMutableDictionary dictionaryWithCapacity:2];
    if(cursor){
        [params setObject:cursor forKey:@"cursor"];
    }
    if(limit!=0){
        [params setObject:[NSString stringWithFormat:@"%d",limit] forKey:@"limit"];
    }

    PostMasterRequest* request = [self requestWithHTTPMethod:CONN_TYPE_GET version:API_VERSION_1 path:@"/packages" parameters:params];
    return request;
}

+(PostMasterRequest*)createBoxRequest:(Box*)box{
    PostMasterRequest* request = [self requestWithHTTPMethod:CONN_TYPE_POST version:API_VERSION_1 path:@"/packages" parameters:nil];
    [request addContentLengthWithDictionary:[box toJSONReadyDictionary] ];
    return request;
}

+(PostMasterRequest*)packageFitRequest:(PackageFitQueryMessage*)message{
    PostMasterRequest* request = [self requestWithHTTPMethod:CONN_TYPE_POST version:API_VERSION_1 path:@"/packages/fit" parameters:nil];
    [request addContentLengthWithDictionary:[message toJSONReadyDictionary] ];
    return request;
}

- (void)addContentLengthWithDictionary:(NSDictionary*)dictionary;
{
    NSError *jsonError;
    
    SBJsonWriter* writer = [[SBJsonWriter alloc] init];
    NSData *requestData = [writer dataWithObject:dictionary ];
    
    if(jsonError)
        return;
    
    [self setValue:CONTENT_TYPE_JSON forHTTPHeaderField:CONTENT_TYPE_KEY];
    [self setValue:[NSString stringWithFormat:@"%d", [requestData length]] forHTTPHeaderField:CONTENT_LENGTH_KEY];
    [self setHTTPBody:requestData];
}


+ (PostMasterRequest *)requestWithHTTPMethod:(NSString *)method
                                     version:(NSString*)version
                                 path:(NSString *)path
                           parameters:(NSDictionary *)parameters;
{
    
    BOOL isPOST = [method isEqualToString:CONN_TYPE_POST];
    NSString *queryString = @"";
    NSString *URLString = [NSString stringWithFormat:@"%@/%@%@",API_DOMAIN,version,path];
    
    if(!isPOST){
        NSString *parameterString = [self URLQueryStringForDictionary:parameters];
        if([parameterString length] > 0)
            queryString = [NSString stringWithFormat:@"?%@", parameterString];
    }
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", URLString, queryString]];
    PostMasterRequest* request = [PostMasterRequest requestWithURL:url];
    [request setHTTPMethod:method];
    
    if(parameters && isPOST){
        NSData *body = [self HTTPBodyWithEncoding:NSUTF8StringEncoding andContent:parameters];//[parameters HTTPBodyWithEncoding:NSUTF8StringEncoding];
        [request setHTTPBody:body];
    }
    
    [request setValue:[NSString stringWithFormat:@"Basic %@=",[self getAuthEncodedString] ]forHTTPHeaderField:@"Authorization"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    
    return request;
}

+(NSString *)getAuthEncodedString{
    NSString* toHash = [NSString stringWithFormat:@"%@:",[[Postmaster instance] getAPIKey]];
    NSData* data = [toHash dataUsingEncoding:NSUTF8StringEncoding];
    NSString* encoded = [Base64Helper base64EncodedStringFromData:data];
    return encoded;
}

+ (NSData *)HTTPBodyWithEncoding:(NSStringEncoding)encoding andContent:(NSDictionary*)content{
    return [[self URLQueryStringForDictionary:content] dataUsingEncoding:encoding];
}

+(NSString *)URLQueryStringForDictionary:(NSDictionary*)dict {
    NSUInteger count = [dict count];
    
    if(count == 0)
        return @"";
    
    NSMutableArray *pairs = [NSMutableArray arrayWithCapacity:count];
    Class stringClass = [NSString class];
    
    for(NSString *name in dict){
        id value = [dict objectForKey:name];
        NSString *stringValue = nil;
        
        if(!value)
            stringValue = @"";
        else if([value isKindOfClass:stringClass])
            stringValue = value;
        else if ([value respondsToSelector:@selector(stringValue)])
            stringValue = [value stringValue];
        else
            stringValue = [value description];
        
        NSString *result = (__bridge NSString *)CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (__bridge CFStringRef)stringValue, NULL, CFSTR(":/?#[]@!$&’()*+,;="), kCFStringEncodingUTF8);
        
        [pairs addObject:[NSString stringWithFormat:@"%@=%@", name, result]];
    }
    
    return [pairs componentsJoinedByString:@"&"];
}

@end
