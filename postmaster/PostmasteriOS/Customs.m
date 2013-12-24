//
//  Customs.m
//  PostmasteriOS
//
//  Created by luczakp on 17.09.2013.
//  Copyright (c) 2013 STXNext. All rights reserved.
//

#import "Customs.h"

@implementation Customs

NSString *const CUSTOMS_TYPE = @"type";
NSString *const CUSTOMS_INVOICENUMBER = @"invoice_number";
NSString *const CUSTOMS_COMMENTS = @"comments";
NSString *const CUSTOMS_CONTENTS = @"contents";

-(id)initWithJSON:(NSDictionary*) jsonDict{
    if([jsonDict count] > 0){
        self = [super init];
        self.type = [jsonDict objectForKey:CUSTOMS_TYPE];
        self.invoiceNumber = [jsonDict objectForKey:CUSTOMS_INVOICENUMBER];
        self.comments = [jsonDict objectForKey:CUSTOMS_COMMENTS];
        self.contents = [CustomsContent getFromJSONArray:[jsonDict objectForKey:CUSTOMS_CONTENTS]];
        return self;
    }
    return nil;
}

-(NSDictionary*)toJSONReadyDictionary{
    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    [self putPropertyToJsonReadyDictionary:dict ofKey:CUSTOMS_TYPE andObject:self.type];
    [self putPropertyToJsonReadyDictionary:dict ofKey:CUSTOMS_INVOICENUMBER andObject:self.invoiceNumber];
    [self putPropertyToJsonReadyDictionary:dict ofKey:CUSTOMS_COMMENTS andObject:self.comments];
    if(self.contents){
        [self putPropertyToJsonReadyDictionary:dict ofKey:CUSTOMS_CONTENTS andObject:[CustomsContent convertToJsonArrayFromEntityArray:self.contents]];
    }

    return dict;
}


@end
