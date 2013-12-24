//
//  BoxFetchResult.m
//  PostmasteriOS
//
//  Created by luczakp on 22.08.2013.
//  Copyright (c) 2013 STXNext. All rights reserved.
//

#import "BoxFetchResult.h"
#import "Box.h"

@implementation BoxFetchResult

-(id)initWithJSON:(NSDictionary*)json{
    self = [super init];
    if([json objectForKey:@"results"]){
        _boxes = [Box getFromJSONArray:[json objectForKey:@"results"]];
        _cursor = [json objectForKey:@"cursor"];
        _previousCursor = [json objectForKey:@"previousCursor"];
    }
    else{
        [self wrapJSONData:json];
    }
    
    return self;
}

@end
