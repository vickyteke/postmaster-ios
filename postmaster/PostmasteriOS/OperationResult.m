//
//  OperationResult.m
//  PostmasteriOS
//
//  Created by luczakp on 24.06.2013.
//  Copyright (c) 2013 STXNext. All rights reserved.
//

#import "OperationResult.h"

@implementation OperationResult

-(NSString*)jsonMessage{
    return _jsonMessage;
}
-(NSInteger) jsonCode{
    return _jsonCode;
}

-(BOOL)hasError{
    if(!_jsonCode && !_jsonMessage && !self.commonHTTPError){
        return NO;
    }
    return YES;
}

-(void)wrapJSONData:(NSDictionary*)json{
    _jsonMessage = [json objectForKey:@"message"];
    _jsonCode = [[json valueForKey:@"code"] integerValue];
}

-(id)initWithCommonHTTPError:(NSError*)error{
    self = [super init];
    
    self.commonHTTPError = error;
    
    return self;
}

@end
