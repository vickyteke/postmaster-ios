//
//  PostmasteriOS.h
//  PostmasteriOS
//
//  Created by luczakp on 17.06.2013.
//  Copyright (c) 2013 STXNext. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Postmaster : NSObject{
    NSString* _apiKey;
}

- (void)setAPIKey:(NSString*)key;
- (NSString*)getAPIKey;
+ (Postmaster *)instance;

@end
