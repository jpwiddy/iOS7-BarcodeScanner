//
//  Barcode.m
//  featurebuild
//
//  Created by Jake Widmer on 10/5/13.
//  Copyright (c) 2013 Jake Widmer. All rights reserved.
//

#import "Barcode.h"

@interface Barcode() 

@property (nonatomic, strong) AVMetadataMachineReadableCodeObject *metadataObject;
@property (nonatomic, strong) NSString * barcodeType;
@property (nonatomic, strong) NSString * barcodeData;
@property (nonatomic, strong) UIBezierPath *cornersPath;
@property (nonatomic, strong) UIBezierPath *boundingBoxPath;

@end
@implementation Barcode

+ (Barcode * )processMetadataObject: (AVMetadataMachineReadableCodeObject*)code
{
    // 1 create the obj
    Barcode * barcode=[[Barcode alloc]init];
    // 2
    // store code type and string
    barcode.barcodeType = [NSString stringWithString:code.type];
    barcode.barcodeData = [NSString stringWithString:code.stringValue];
    // 3
    barcode.metadataObject = code;
    // Create the path joining code's corners
    // 4
    CGMutablePathRef cornersPath = CGPathCreateMutable();
    // 5
    CGPoint point;
    CGPointMakeWithDictionaryRepresentation(
                                            (CFDictionaryRef)code.corners[0], &point);
    // 6
    CGPathMoveToPoint(cornersPath, nil, point.x, point.y);
    // 7
    for (int i = 1; i < code.corners.count; i++) {
        CGPointMakeWithDictionaryRepresentation(
                                                (CFDictionaryRef)code.corners[i], &point);
        CGPathAddLineToPoint(cornersPath, nil,
                             point.x, point.y);
    }
    // 8
    CGPathCloseSubpath(cornersPath);
    // 9
    barcode.cornersPath =
    [UIBezierPath bezierPathWithCGPath:cornersPath];
    CGPathRelease(cornersPath);
    // Create the path for the code's bounding box
    // 10
    barcode.boundingBoxPath =
    [UIBezierPath bezierPathWithRect:code.bounds];
    // 11 return
    return barcode;
}
- (NSString *) getBarcodeType{
    return self.barcodeType;
}
- (NSString *) getBarcodeData{
    return self.barcodeData;
}
- (void) printBarcodeData{
    NSLog(@"Barcode of type: %@ and data: %@",self.metadataObject.type, self.barcodeData);
}
@end
