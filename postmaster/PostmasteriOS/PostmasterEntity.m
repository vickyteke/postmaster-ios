//
//  PostmasterEntity.m
//  PostmasteriOS
//
//  Created by luczakp on 20.06.2013.
//  Copyright (c) 2013 STXNext. All rights reserved.
//

#import "PostmasterEntity.h"
#import "SBJson.h"
#import "OperationResult.h"

@implementation PostmasterEntity
-(void)putPropertyToJsonReadyDictionary:(NSMutableDictionary*)dict ofKey:(NSString*)key andObject:(NSObject*)object{
    if(object){
        [dict setObject:object forKey:key];
    }
}

+(NSArray*)convertToJsonArrayFromEntityArray:(NSArray*)entitiesArray{
    NSMutableArray* result = [NSMutableArray array];
    for(PostmasterEntity* entity in entitiesArray){
        [result addObject:[entity toJSONReadyDictionary]];
    }
    
    return result;
}

+(NSMutableArray*)getFromJSONArray:(NSDictionary*) jsonArray{
    NSMutableArray* result = [NSMutableArray array];
    for(NSDictionary* item in jsonArray){
        PostmasterEntity* entity = [[self alloc] initWithJSON:item];
        [result addObject:entity];
    }
    
    return result;
}

+(NSData*)executeRequest:(PostMasterRequest*)request andFillError:(NSError*) error withResponse:(NSHTTPURLResponse*) response{
    return [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
}

+(id)executeRequest:(PostMasterRequest*)request andFillResult:(OperationResult*)result{
    
    NSHTTPURLResponse *receivedResponse;
    NSError *receivedError;
    
    NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:&receivedResponse error:&receivedError];
    
    if(receivedError){
        result = [result initWithCommonHTTPError:receivedError];
    }
    else{
        SBJsonParser *jsonParser = [[SBJsonParser alloc] init];
        NSMutableDictionary* jsonResponse =[jsonParser objectWithData:data];
        result = [result initWithJSON:jsonResponse];
    }
    
    return result;
}

@end
