//
//  PostmasteriOS.m
//  PostmasteriOS
//
//  Created by luczakp on 17.06.2013.
//  Copyright (c) 2013 STXNext. All rights reserved.
//

#import "Postmaster.h"

@implementation Postmaster


+ (Postmaster *)instance;
{
    static dispatch_once_t pred = 0;
    __strong static Postmaster *sharedObject = nil;
    dispatch_once(&pred, ^{
        sharedObject = [[self alloc] init];
    });
    
    return sharedObject;
}

- (void)setAPIKey:(NSString*)key{
    _apiKey = key;
}
- (NSString*)getAPIKey{
    return _apiKey;
}

@end
