//
//  OperationResult.h
//  PostmasteriOS
//
//  Created by luczakp on 24.06.2013.
//  Copyright (c) 2013 STXNext. All rights reserved.
//

#import "PostmasterEntity.h"

@interface OperationResult : NSObject{
    NSString* _jsonMessage;
    NSInteger _jsonCode;
}

@property(nonatomic,retain) NSError* commonHTTPError;


-(BOOL)hasError;
-(void)wrapJSONData:(NSDictionary*)json;
-(NSString*)jsonMessage;
-(NSInteger) jsonCode;
-(id)initWithJSON:(NSDictionary*)json;
-(id)initWithCommonHTTPError:(NSError*)error;

@end
