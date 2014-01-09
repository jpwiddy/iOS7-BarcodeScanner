iOS7-BarcodeScanner
===================

NEW: Settings Menu Added! Ability to disable/enable barcode types which are able to be scanned

Barcode scanner using the scanning capabilities introduced with iOS 7.

The project as is goes straight into scanning mode to which it constantly looks for barcodes to be scanned. 
In the viewDidLoad(), it sets the property found in the .h file (allowedBarcodeTypes) to only look for those specific barcodes. This is editable and extremely useful.
When an allowed barcode is found, it takes in the data, creates a Barcode object with it, and adds that object to the collection of found barcodes.
An alert is then presented telling the user the kind of barcode found, number of barcodes found in the past, and giving the option to scan again or be finished.

To use: 
- Add the Barcode.h & .m files to your project, as well as the ScannerViewController.h & .m.
- In your Storyboard, drag out a ViewController object and add a view to it. This view will be used as the preview/video layer.
- Connect the "preview view" to the outlet/property named previewView in the ScannerViewController.m file.

Notes: 
- Sometimes it may require you to embed your ScannerViewController in a Navigation Controller in the storyboard
- iOS 7+ only

![preview](https://raw.github.com/jpwidmer/iOS7-BarcodeScanner/master/iOS7_BarcodeScanner/preview.PNG)

![preview](https://raw.github.com/jpwidmer/iOS7-BarcodeScanner/master/iOS7_BarcodeScanner/settings.png)


Coming soon:
- ~~Settings menu where you will be able to toggle on/off the barcode types which you want to be able to find~~
- Finished with scanning view
- Delegate protocol for returning the array of found barcodes to other ViewControllers


NOTE: Code used in this example is used from a fine tutorial series covered in this book. Click the link to follow through - http://www.raywenderlich.com/store/ios-7-by-tutorials
