//
//  PackageFitResult.h
//  PostmasteriOS
//
//  Created by luczakp on 23.08.2013.
//  Copyright (c) 2013 STXNext. All rights reserved.
//

#import "OperationResult.h"

@class PackageFitInfo;
@interface PackageFitResult : OperationResult

@property(nonatomic,retain) PackageFitInfo* fitInfo;

@end
