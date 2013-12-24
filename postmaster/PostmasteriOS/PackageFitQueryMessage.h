//
//  PackageFitQueryMessage.h
//  PostmasteriOS
//
//  Created by luczakp on 22.08.2013.
//  Copyright (c) 2013 STXNext. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PostmasterEntity.h"
#import "Item.h"
#import "Box.h"

@interface PackageFitQueryMessage : PostmasterEntity

@property(nonatomic,retain) NSMutableArray* items;
extern NSString *const PACKAGE_FIT_ITEMS;
@property(nonatomic,retain) NSMutableArray* packages;
extern NSString *const PACKAGE_FIT_PACKAGES;

@end
