//
//  PostmasterEntity.h
//  PostmasteriOS
//
//  Created by luczakp on 20.06.2013.
//  Copyright (c) 2013 STXNext. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PostMasterRequest.h"

@class OperationResult;
@interface PostmasterEntity : NSObject

-(NSDictionary*)toJSONReadyDictionary;
-(id)initWithJSON:(NSDictionary*) jsonDict;
+(NSMutableArray*)getFromJSONArray:(NSDictionary*) jsonArray;
+(NSArray*)convertToJsonArrayFromEntityArray:(NSArray*)entitiesArray;
-(void)putPropertyToJsonReadyDictionary:(NSMutableDictionary*)dict ofKey:(NSString*)key andObject:(NSObject*)object;
+(id)executeRequest:(PostMasterRequest*)request andFillResult:(OperationResult*)result;
+(NSData*)executeRequest:(PostMasterRequest*)request andFillError:(NSError*) error withResponse:(NSHTTPURLResponse*) response;

@end
