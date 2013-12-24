//
//  BoxFetchResult.h
//  PostmasteriOS
//
//  Created by luczakp on 22.08.2013.
//  Copyright (c) 2013 STXNext. All rights reserved.
//

#import "OperationResult.h"

@interface BoxFetchResult : OperationResult

@property(nonatomic,retain) NSArray* boxes;
@property(nonatomic,retain) NSString* cursor;
@property(nonatomic,retain) NSString* previousCursor;

@end
