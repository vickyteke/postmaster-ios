//
//  AddressValidationResult.h
//  PostmasteriOS
//
//  Created by luczakp on 08.07.2013.
//  Copyright (c) 2013 STXNext. All rights reserved.
//

#import "OperationResult.h"

@interface AddressValidationResult : OperationResult

@property(nonatomic,retain) NSArray* standarizedAddresses;

@end
