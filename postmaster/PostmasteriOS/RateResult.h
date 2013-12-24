//
//  RateResult.h
//  PostmasteriOS
//
//  Created by luczakp on 24.06.2013.
//  Copyright (c) 2013 STXNext. All rights reserved.
//

#import "PostmasterEntity.h"
#import "OperationResult.h"
#import "Rate.h"

@interface RateResult : OperationResult

@property(nonatomic,retain) Rate* rate;

@end
