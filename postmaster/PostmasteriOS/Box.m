//
//  Box.m
//  PostmasteriOS
//
//  Created by luczakp on 22.08.2013.
//  Copyright (c) 2013 STXNext. All rights reserved.
//

#import "Box.h"
#import "PostMasterRequest.h"
#import "SBJson.h"

@implementation Box

+(BoxFetchResult*)fetchBoxesWithCursor:(NSString*)cursor andLimit:(NSInteger)limit{
    PostMasterRequest *request = [PostMasterRequest fetchBoxesRequestWithCursor:cursor andLimit:limit];
    return [self executeRequest:request andFillResult:[BoxFetchResult alloc]];
}

-(BoxCreationResult*)createBox{
    PostMasterRequest *request = [PostMasterRequest createBoxRequest:self];
    return [Box executeRequest:request andFillResult:[BoxCreationResult alloc]];
}

+(PackageFitResult*)fit:(PackageFitQueryMessage*)message{
    PostMasterRequest *request = [PostMasterRequest packageFitRequest:message];
    return [Box executeRequest:request andFillResult:[PackageFitResult alloc]];
}
@end
