//
//  SettingsViewController.h
//  iOS7_BarcodeScanner
//
//  Created by Jake Widmer on 12/25/13.
//  Copyright (c) 2013 Jake Widmer. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SettingsDelegate <NSObject>
@required
- (void) settingsChanged:(NSMutableArray *)allowedTypes;
@end

@interface SettingsViewController : UIViewController
@property (weak) id <SettingsDelegate> delegate;
@end
