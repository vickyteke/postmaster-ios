//
//  PackageFitInfo.m
//  PostmasteriOS
//
//  Created by luczakp on 22.08.2013.
//  Copyright (c) 2013 STXNext. All rights reserved.
//

#import "PackageFitInfo.h"

@implementation PackageFitInfo

NSString *const PACKAGE_FIT_INFO_LEFTOVERS = @"leftovers";
NSString *const PACKAGE_FIT_INFO_BOXES= @"boxes";
NSString *const PACKAGE_FIT_INFO_ALL_FIT= @"all_fit";
NSString *const PACKAGE_FIT_INFO_IMAGE_URL= @"image_url";


-(id)initWithJSON:(NSDictionary*) jsonDict{
    if([jsonDict count] > 0){
        self = [super init];
        self.boxes = [BoxData getFromJSONArray:[jsonDict objectForKey:PACKAGE_FIT_INFO_BOXES]];
        self.leftovers = [Box getFromJSONArray:[jsonDict objectForKey:PACKAGE_FIT_INFO_LEFTOVERS]];
        self.allFit = [jsonDict objectForKey:PACKAGE_FIT_INFO_ALL_FIT];
        self.imageUrl = [jsonDict objectForKey:PACKAGE_FIT_INFO_IMAGE_URL];
        return self;
    }
    return nil;
}


@end
