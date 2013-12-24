//
//  Customs.h
//  PostmasteriOS
//
//  Created by luczakp on 17.09.2013.
//  Copyright (c) 2013 STXNext. All rights reserved.
//

#import "PostmasterEntity.h"
#import "CustomsContent.h"

@interface Customs : PostmasterEntity

@property(nonatomic,retain) NSString* type;
extern NSString *const CUSTOMS_TYPE;
@property(nonatomic,retain) NSString* invoiceNumber;
extern NSString *const CUSTOMS_INVOICENUMBER;
@property(nonatomic,retain) NSString* comments;
extern NSString *const CUSTOMS_COMMENTS;
@property(nonatomic,retain) NSArray* contents;
extern NSString *const CUSTOMS_CONTENTS;

@end
