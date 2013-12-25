//
//  SettingsViewController.m
//  iOS7_BarcodeScanner
//
//  Created by Jake Widmer on 12/25/13.
//  Copyright (c) 2013 Jake Widmer. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (strong, nonatomic) NSMutableArray * barcodeTypes;
@property (strong, nonatomic) NSMutableArray * allowedBarcodeTypes;

@property (strong, nonatomic) IBOutletCollection(UISwitch) NSArray *barcodeSwitches;

@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.saveButton.layer.cornerRadius = 8.0f;
    self.saveButton.layer.borderColor = [UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0].CGColor;
    self.saveButton.layer.borderWidth=1.5f;
    
    // Save the barcode types for later
    self.barcodeTypes = [NSMutableArray new];
    [self.barcodeTypes addObject:@"org.iso.QRCode"];
    [self.barcodeTypes addObject:@"org.iso.PDF417"];
    [self.barcodeTypes addObject:@"org.gs1.UPC-E"];
    [self.barcodeTypes addObject:@"org.iso.Aztec"];
    [self.barcodeTypes addObject:@"org.iso.Code39"];
    [self.barcodeTypes addObject:@"org.iso.Code39Mod43"];
    [self.barcodeTypes addObject:@"org.gs1.EAN-13"];
    [self.barcodeTypes addObject:@"org.gs1.EAN-8"];
    [self.barcodeTypes addObject:@"com.intermec.Code93"];
    [self.barcodeTypes addObject:@"org.iso.Code128"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)saveButtonPressed:(id)sender {
    self.allowedBarcodeTypes = [NSMutableArray new];
    for(UISwitch * sw in self.barcodeSwitches){
        if(sw.isOn){
            [self.allowedBarcodeTypes addObject:[self.barcodeTypes objectAtIndex:sw.tag]];
        }
    }
    [self.delegate settingsChanged:self.allowedBarcodeTypes];
    [self.navigationController popViewControllerAnimated:YES];
}

@end