//
//  PostmasteriOSTests.m
//  PostmasteriOSTests
//
//  Created by luczakp on 17.06.2013.
//  Copyright (c) 2013 STXNext. All rights reserved.
//

#import "PostmasteriOSTests.h"
#import "Address.h"
#import "Shipment.h"
#import "Package.h"
#import "Service.h"
#import "DeliveryTimeQueryMessage.h"
#import "RateQueryMessage.h"
#import "Box.h"
#import "PackageFitQueryMessage.h"
#import "MonitorPackageQueryMessage.h"

@implementation PostmasteriOSTests

- (void)setUp
{
    [super setUp];
    [[Postmaster instance] setAPIKey:API_KEY];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}


-(void)testInit{
        
}


-(void)test_01_ValidateAddress{

    Address *address = [[Address alloc] init];
    address.city = @"Austin";
    address.country = @"US";
    address.contact = @"Joe Smith";
    address.line1 = @"1110 Algarita Ave.";
    address.residential = YES;
    address.state = @"TX";
    address.zipCode = @"78704";
    
    BOOL testResult = NO;
    
    AddressValidationResult* result = [address validate];
    if(result && ([[result standarizedAddresses] count] > 0)){
        Address* receivedAddress = [[result standarizedAddresses] objectAtIndex:0];
        if([address.city isEqualToString:receivedAddress.city]){
            testResult = YES;
        }
    }
    
    if(!testResult){
        STFail(@"No appropriate address was returned");
    }
    NSLog(@"%@",result);
}



-(void)test_02_CreateShipment{

    Shipment* sh =[[Shipment alloc] init];
    Address* toAddress = [[Address alloc]init];
    Package* pkg = [[Package alloc]init];
    Customs* customs = [[Customs alloc] init];
    
    toAddress.company = @"Groupe SEB";
    toAddress.contact = @"Joe Smith";
    toAddress.line1 = @"Les 4 M - Chemin du Petit Bois";
    toAddress.line2 = @"BP 172";
    toAddress.city = @"ECULLY CEDEX";
    toAddress.phoneNumber = @"9197207941";
    toAddress.zipCode = @"69134";
    toAddress.country = @"FR";
    
    sh.to = toAddress;
    
    pkg.width = [NSNumber numberWithInt:10];
    pkg.height = [NSNumber numberWithInt:6];
    pkg.length = [NSNumber numberWithInt:8];
    pkg.weight = [NSNumber numberWithFloat:1.5f];
    pkg.value = @"0.34";
    
    CustomsContent* content = [[CustomsContent alloc] init];
    content.description = @"A Bolt";
    content.value = @"0.34";
    content.weight = [NSNumber numberWithInteger:1];
    content.quantity = [NSNumber numberWithInteger:1];
    content.countryOfOrigin = @"FR";
    
    
    customs.type = @"Other";
    customs.comments = @"Some great stuff.";
    customs.contents = [NSArray arrayWithObject:content];
    
    pkg.customs = customs;
    
    sh.packageInfo = pkg;
    
    sh.carrier = @"fedex";
    sh.service = @"INTL_PRIORITY";
   
    ShipmentCreationResult* result = [sh createShipment];
    
    if(![[result shipment] shipmentId]){
        STFail(@"Shipment creation failed");
    }
    NSLog(@"%@",result);

}


-(void)test_031_getShipments{
    
    ShipmentFetchResult* result = [Shipment fetchShipmentsWithCursor:nil andLimit:5];
    BOOL testResult = NO;
    
    if(result && ([[result shipments] count]>0)){
        testResult = YES;
    }
    
    if(!testResult){
        STFail(@"Nothing was returned");
    }
    
    NSLog(@"%@",result);
}


-(void)test_03_trackShipment{
    
    ShipmentTrackResult* result = [Shipment track:[NSNumber numberWithLongLong:5741787159199744]];
    
    if(![result trackingDetails] && [result jsonCode]!=400){
        STFail(@"Nothing was returned");
    }
    NSLog(@"%@",result);
    
}


-(void)test_04_trackShipmentByRefNo{
    
    ShipmentTrackByReferenceResult* result = [Shipment trackByReferenceNumber:@"1Z8V81310297718490"];

    if(([[result trackingHistoryList] count]) == 0 && ![result jsonMessage]){
        STFail(@"Nothing was returned");
    }
    
    NSLog(@"%@",result);
    
}

-(void)test_05_monitorPackage{
    MonitorPackageQueryMessage* query = [[MonitorPackageQueryMessage alloc] init];
    query.callbackUrl = @"http://example.com/your-http-post-listener";
    [query.events addObject:MONITOR_PACKAGE_EVENT_DELIVERED];
    [query.events addObject:MONITOR_PACKAGE_EVENT_EXCEPTION];
    query.tracking = @"1Z8V81310297718490";
    
    MonitorPackageResult* result = [Shipment monitorExternalPackage:query];
    
    if(![[result status] isEqualToString:@"OK"]){
        STFail(@"No webhook registered");
    }
    
    NSLog(@"%@",result);
    
}

-(void)test_06_voidShipment{
    
    ShipmentVoidResult* result = [Shipment voidShipment:[NSNumber numberWithLongLong:5741787159199744]];
    if([result voidSuccess]){
        NSLog(@"VOID SUCCESSFUL");
    }
    else{
        NSLog(@"VOID FAILED");
    }
    
    if(![result voidSuccess] && ![result jsonMessage]){
        STFail(@"Nothing was returned");
    }
    
    NSLog(@"%@",result);
    
}

 
-(void)test_07_deliveryTimesTest{
       
    DeliveryTimeQueryMessage* service = [[DeliveryTimeQueryMessage alloc] init];
    service.carrier = @"ups";
    service.fromZip = @"28771";
    service.toZip = @"78704";
    service.weight = [NSNumber numberWithFloat:1.0f];
    DeliveryTimeResult* result = [Shipment deliveryTime:service];
    
    if([[result services] count] == 0){
        STFail(@"No services returned");
    }
    
    NSLog(@"Result:%@",result);
}


-(void)test_08_ratesTest{
    
    RateQueryMessage* message = [[RateQueryMessage alloc] init];
    message.carrier = @"fedex";
    message.fromZip = @"28771";
    message.toZip = @"78704";
    message.weight = [NSNumber numberWithFloat:1.0f];
    
    RateResult* result = [Shipment rates:message];
    
    if(![result rate]){
        STFail(@"No rate returned");
    }
    
    NSLog(@"%@",result);
}
 

-(void)test_09_boxCreateTest{
    Box* box = [[Box alloc] init];
    box.width = @10;
    box.height = @12;
    box.length = @8;
    box.name = [NSString stringWithFormat:@"My fancy box %f",NSTimeIntervalSince1970];
    
    BoxCreationResult* result = [box createBox];
    if(!result.boxId){
        STFail(@"No rate returned");
    }
    NSLog(@"%@",result);
}

-(void)test_10_packageFetchTest{
    BoxFetchResult* result = [Box fetchBoxesWithCursor:nil andLimit:4];
    if(![result boxes]){
        STFail(@"No rate returned");
    }
    NSLog(@"%@",result);
}

-(void)test_11_packageFitTest{
    PackageFitQueryMessage* query = [[PackageFitQueryMessage alloc] init];
    Box* box1 = [[Box alloc] init];
    box1.width = @6;
    box1.length = @6;
    box1.height = @6;
    box1.sku = @"123ABC";
    
    Box* box2 = [[Box alloc] init];
    box2.width = @6;
    box2.length = @6;
    box2.height = @6;
    box2.sku = @"123ABC";
    
    Item* item = [[Item alloc] init];
    item.width = @2.2;
    item.length = @3;
    item.height = @1;
    item.count = @2;
    
    [query.packages addObject:box1];
    [query.packages addObject:box2];
    [query.items addObject:item];
    
    PackageFitResult* result = [Box fit:query];
    
    if(![result fitInfo]){
        STFail(@"No rate returned");
    }
    

    for(BoxData* boxData in [[result fitInfo] boxes]){
        NSLog(@"Box:%@\n",[[boxData box] name]);
        for(Item* item in [boxData items]){
            NSLog(@"Item:%@",[item name]);
        }
    }

    
    
    NSLog(@"%@",[[result fitInfo] imageUrl]);
    
}


@end
