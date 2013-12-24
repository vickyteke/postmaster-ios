//
//  BoxData.h
//  PostmasteriOS
//
//  Created by luczakp on 22.08.2013.
//  Copyright (c) 2013 STXNext. All rights reserved.
//

#import "PostmasterEntity.h"
#import "Box.h"

@interface BoxData : PostmasterEntity

@property(nonatomic,retain) Box* box;
extern NSString *const BOX_DATA_BOX;
@property(nonatomic,retain) NSArray* items;
extern NSString *const BOX_DATA_ITEMS;

@end
