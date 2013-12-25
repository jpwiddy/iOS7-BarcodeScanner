//
//  ViewController.h
//  iOS7_BarcodeScanner
//
//  Created by Jake Widmer on 11/16/13.
//  Copyright (c) 2013 Jake Widmer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingsViewController.h"
@interface ScannerViewController : UIViewController<UIAlertViewDelegate, SettingsDelegate>
@property (strong, nonatomic) NSMutableArray * allowedBarcodeTypes;

@end
