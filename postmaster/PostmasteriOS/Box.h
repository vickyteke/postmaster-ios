//
//  Box.h
//  PostmasteriOS
//
//  Created by luczakp on 22.08.2013.
//  Copyright (c) 2013 STXNext. All rights reserved.
//

#import "Item.h"
#import "BoxFetchResult.h"
#import "BoxCreationResult.h"
#import "PackageFitInfo.h"
#import "PackageFitQueryMessage.h"
#import "PackageFitResult.h"

@interface Box : Item

+(BoxFetchResult*)fetchBoxesWithCursor:(NSString*)cursor andLimit:(NSInteger)limit;
-(BoxCreationResult*)createBox;
+(PackageFitResult*)fit:(PackageFitQueryMessage*)message;

@end
