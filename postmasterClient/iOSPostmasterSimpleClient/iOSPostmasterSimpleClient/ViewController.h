//
//  ViewController.h
//  iOSPostmasterSimpleClient
//
//  Created by luczakp on 10.07.2013.
//  Copyright (c) 2013 STXNext. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>{

    IBOutlet UIActivityIndicatorView* activityIndicator;
    IBOutlet UIButton* fetchShipmentsButton;
    IBOutlet UIButton* fetchByIdButton;
    IBOutlet UIButton* trackByReferenceButton;
    IBOutlet UIButton* validatePredefinedAddress;
    IBOutlet UITextField* referenceNumberField;
    IBOutlet UITextField* shipmentIdField;
    IBOutlet UIView* rootView;
}

@end
