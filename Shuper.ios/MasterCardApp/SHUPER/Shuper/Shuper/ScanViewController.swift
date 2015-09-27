//
//  ScanViewController.swift
//  Shuper
//
//  Created by PG on 2015-09-26.
//  Copyright © 2015 Shuper. All rights reserved.
//

import UIKit
import AVFoundation

var barCodeNumber = " "
var subtotalKart = 0.0


 var scanIte = 0
class ScanViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate  {
    @IBOutlet weak var BarcodeScanView: UIWebView!
    var captureSession: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!
    let scanCellContent = [
                            "Naya","0.79",
                            "Bear Paws","0.50",
                            "Perrier", "1.20",
                            "Mr. Christie","0.59",
                            "Lindt", "2.59"]
    let url = "https://shopping/items/getitem/"  // +number

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.blackColor()
        captureSession = AVCaptureSession()
        
        let videoCaptureDevice = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
        let videoInput: AVCaptureDeviceInput
        
        do {
            videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch {
            return
        }
        
        if (captureSession.canAddInput(videoInput)) {
            captureSession.addInput(videoInput)
        } else {
            failed();
            return;
        }
        
        let metadataOutput = AVCaptureMetadataOutput()
        
        if (captureSession.canAddOutput(metadataOutput)) {
            captureSession.addOutput(metadataOutput)
            
            metadataOutput.setMetadataObjectsDelegate(self, queue: dispatch_get_main_queue())
            metadataOutput.metadataObjectTypes = [AVMetadataObjectTypeEAN8Code, AVMetadataObjectTypeEAN13Code, AVMetadataObjectTypePDF417Code]
        } else {
            failed()
            return
        }
        
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession);
        previewLayer.frame = view.layer.bounds;
        previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
        view.layer.addSublayer(previewLayer);
        
        captureSession.startRunning();

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func failed() {
        let ac = UIAlertController(title: "Scanning not supported", message: "Your device does not support scanning a code from an item. Please use a device with a camera.", preferredStyle: .Alert)
        ac.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        presentViewController(ac, animated: true, completion: nil)
        captureSession = nil
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if (captureSession?.running == false) {
            captureSession.startRunning();
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        if (captureSession?.running == true) {
            captureSession.stopRunning();
        }
    }
    
    func captureOutput(captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [AnyObject]!, fromConnection connection: AVCaptureConnection!) {
        captureSession.stopRunning()
        
        if let metadataObject = metadataObjects.first {
            let readableObject = metadataObject as! AVMetadataMachineReadableCodeObject;
            
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
            foundCode(readableObject.stringValue);
        }
        
        dismissViewControllerAnimated(true, completion: nil)
        performSegueWithIdentifier("TransferToShoppingCartController", sender: self)
    }
    
    func foundCode(code: String) {
        barCodeNumber = code
        cellContent.append(scanCellContent[scanIte]+"       $"+scanCellContent[scanIte+1])
        let newItemValue = NSNumberFormatter().numberFromString(scanCellContent[scanIte+1])!.doubleValue
        subtotalKart += newItemValue
        
        scanIte+=2
        FetchSKUFromServer()
        print(code)
    }
    
    func FetchSKUFromServer()
    {
        let itemurl = url + barCodeNumber
        let requestURL = NSURL(string:itemurl)
        let request = NSURLRequest(URL: requestURL!)
        BarcodeScanView.loadRequest(request)
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return .Portrait
    }
}
