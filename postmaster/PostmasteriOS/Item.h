//
//  Item.h
//  PostmasteriOS
//
//  Created by luczakp on 22.08.2013.
//  Copyright (c) 2013 STXNext. All rights reserved.
//

#import "PostmasterEntity.h"

@interface Item : PostmasterEntity

@property(nonatomic,retain) NSNumber* width;
extern NSString *const ITEM_WIDTH;
@property(nonatomic,retain) NSNumber* height;
extern NSString *const ITEM_HEIGHT;
@property(nonatomic,retain) NSString* imageUrl;
extern NSString *const ITEM_IMAGEURL;
@property(nonatomic,retain) NSNumber* length;
extern NSString *const ITEM_LENGTH;
@property(nonatomic,retain) NSNumber* weight;
extern NSString *const ITEM_WEIGHT;
@property(nonatomic,retain) NSString* weightUnits;
extern NSString *const ITEM_WEIGHTUNITS;
@property(nonatomic,retain) NSString* sizeUnits;
extern NSString *const ITEM_SIZEUNITS;
@property(nonatomic,retain) NSString* name;
extern NSString *const ITEM_NAME;
@property(nonatomic,retain) NSString* sku;
extern NSString *const ITEM_SKU;
@property(nonatomic,retain) NSNumber* count;
extern NSString *const ITEM_COUNT;

@end
