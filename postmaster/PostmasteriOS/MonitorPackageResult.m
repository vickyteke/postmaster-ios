//
//  MonitorPackageResult.m
//  PostmasteriOS
//
//  Created by luczakp on 29.08.2013.
//  Copyright (c) 2013 STXNext. All rights reserved.
//

#import "MonitorPackageResult.h"

@implementation MonitorPackageResult

-(id)initWithJSON:(NSDictionary*)json{
    self = [super init];
    if([json objectForKey:@"status"]){
        _status = [json objectForKey:@"status"];
    }else{
        [self wrapJSONData:json];
    }
    return self;
}

@end
