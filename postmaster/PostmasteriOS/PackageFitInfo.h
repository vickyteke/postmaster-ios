//
//  PackageFitInfo.h
//  PostmasteriOS
//
//  Created by luczakp on 22.08.2013.
//  Copyright (c) 2013 STXNext. All rights reserved.
//

#import "PostmasterEntity.h"
#import "BoxData.h"

@interface PackageFitInfo : PostmasterEntity

@property(nonatomic,retain) NSArray* leftovers;
extern NSString *const PACKAGE_FIT_INFO_LEFTOVERS;
@property(nonatomic,retain) NSArray* boxes;
extern NSString *const PACKAGE_FIT_INFO_BOXES;
@property(nonatomic,retain) NSNumber* allFit;
extern NSString *const PACKAGE_FIT_INFO_ALL_FIT;
@property(nonatomic,retain) NSString* imageUrl;
extern NSString *const PACKAGE_FIT_INFO_IMAGE_URL;

@end
