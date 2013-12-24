//
//  ViewController.m
//  iOSPostmasterSimpleClient
//
//  Created by luczakp on 10.07.2013.
//  Copyright (c) 2013 STXNext. All rights reserved.
//

#import "ViewController.h"
#import "Shipment.h"


@interface ViewController (){
    CGRect rootFrame;
    dispatch_queue_t queue;
}

@end

@implementation ViewController

-(BOOL)shouldAutorotate{
    return NO;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    queue = dispatch_queue_create("com.mycompany.myqueue", 0);
    
    rootFrame = rootView.frame;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidShow:)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidHide:)
                                                 name:UIKeyboardDidHideNotification
                                               object:nil];
    
    referenceNumberField.delegate = self;
    shipmentIdField.delegate = self;
}

-(void)alertWithOperationResultError:(OperationResult*)result{
    NSString* output = [NSString stringWithFormat:@"json error:\n%d %@",[result jsonCode],[result jsonMessage]];
    if([result commonHTTPError]){
        output = [output stringByAppendingString:[[result commonHTTPError] localizedDescription]];
    }
    [[[UIAlertView alloc] initWithTitle:@"Response" message:output delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
}

-(void)dispatchTask:(OperationResult* (^)())task withCompletionHandler:(void (^)(OperationResult* result))handler{
    [self setFormEnabled:NO];
    [activityIndicator startAnimating];
    dispatch_async(queue, ^{
        OperationResult* operation = task();
        dispatch_async(dispatch_get_main_queue(), ^{
            [activityIndicator stopAnimating];
            [self setFormEnabled:YES];
            handler(operation);
        });
    });
}

-(void)setFormEnabled:(BOOL)enabled{
    [fetchShipmentsButton setEnabled:enabled];
    [fetchByIdButton setEnabled:enabled];
    [trackByReferenceButton setEnabled:enabled];
    [validatePredefinedAddress setEnabled:enabled];
    [referenceNumberField setEnabled:enabled];
    [shipmentIdField setEnabled:enabled];
}

-(BOOL)validateInput:(UITextField*)input ofLabel:(NSString*)label{
    if([[input text] length]>0){
        return YES;
    }
    else{
        [[[UIAlertView alloc] initWithTitle:label message:@"This field is required!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil] show];
        return NO;
    }
}

-(IBAction)didTouchFetchShipments:(id)sender{
    
    [self dispatchTask:^OperationResult *{
        return [Shipment fetchShipmentsWithCursor:nil andLimit:0];
    } withCompletionHandler:^(OperationResult *result) {
        
        ShipmentFetchResult* shipmentResult = (ShipmentFetchResult*)result;
        NSString* output = [NSString stringWithFormat:@"cursor:%@\n\npreviousCursor:%@\n\nResults:\n",[shipmentResult cursor],[shipmentResult previousCursor]];
        
        if(![result hasError]){
            for(Shipment* shipment in [shipmentResult shipments]){
                output = [output stringByAppendingString:[NSString stringWithFormat:@"%@",[shipment toJSONReadyDictionary]]];
            }
            
            [[[UIAlertView alloc] initWithTitle:@"Response" message:output delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
        }
        else{
            [self alertWithOperationResultError:result];
        }
    }];
}

-(IBAction)didTouchFetchById:(id)sender{
    if([self validateInput:shipmentIdField ofLabel:@"Shipment ID"]){
        [self dispatchTask:^OperationResult *{
            return [Shipment fetchShipmentById:[NSNumber numberWithLongLong:[[shipmentIdField text] longLongValue]]];
        } withCompletionHandler:^(OperationResult *result) {
            
            ShipmentFetchByIdResult* shipmentResult = (ShipmentFetchByIdResult*)result;
            
            if(![result hasError]){
                 NSString* output = [NSString stringWithFormat:@"%@",[[shipmentResult shipment] toJSONReadyDictionary]];
                
                [[[UIAlertView alloc] initWithTitle:@"Response" message:output delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
            }
            else{
                [self alertWithOperationResultError:result];
            }

        }];
    }
}

-(IBAction)didTouchTrackByReferenceNumber:(id)sender{
    if([self validateInput:referenceNumberField ofLabel:@"Shipment ID"]){
        [self dispatchTask:^OperationResult *{
            return [Shipment trackByReferenceNumber:[referenceNumberField text]];
        } withCompletionHandler:^(OperationResult *result) {
            
            ShipmentTrackByReferenceResult* shipmentResult = (ShipmentTrackByReferenceResult*)result;
            
            if(![result hasError]){
                NSString* output = @"";
                
                for(TrackingDetailsHistory* history in [shipmentResult trackingHistoryList]){
                    output = [output stringByAppendingString:[NSString stringWithFormat:@"%@",[history toJSONReadyDictionary]]];
                }

                
                [[[UIAlertView alloc] initWithTitle:@"Response" message:output delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
            }
            else{
                [self alertWithOperationResultError:result];
            }
            
        }];
    }

}

-(IBAction)didTouchValidateAddress:(id)sender{
    Address *address = [[Address alloc] init];
    address.city = @"Austin";
    address.country = @"US";
    address.contact = @"Joe Smith";
    address.line1 = @"1110 Algarita Ave.";
    address.residential = YES;
    address.state = @"TX";
    address.zipCode = @"78704";
    
    [self dispatchTask:^OperationResult *{
        return [address validate];
    } withCompletionHandler:^(OperationResult *result) {
        AddressValidationResult* validationResult = (AddressValidationResult*)result;
        if(![result hasError]){
            NSString* output = @"";
            
            for(Address* address in [validationResult standarizedAddresses]){
                output = [output stringByAppendingString:[NSString stringWithFormat:@"%@",[address toJSONReadyDictionary]]];
            }
            
            [[[UIAlertView alloc] initWithTitle:@"Response" message:output delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
        }
        else{
            [self alertWithOperationResultError:result];
        }

    }];

}

-(IBAction)didTouchBackground:(id)sender{
    [((UIView*)sender) resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

-(void)keyboardDidShow:(NSNotification*)note{
    CGRect frame = rootFrame;
    frame.origin.y = frame.origin.y-50;
    rootView.frame = frame;
    
}

-(void)keyboardDidHide:(NSNotification*)note{
    rootView.frame = rootFrame;
}



@end
