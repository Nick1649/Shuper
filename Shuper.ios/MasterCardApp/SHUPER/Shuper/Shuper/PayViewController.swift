//
//  PayViewController.swift
//  Shuper
//
//  Created by PG on 2015-09-26.
//  Copyright © 2015 Shuper. All rights reserved.
//

import UIKit

class PayViewController: UIViewController {

    
    @IBOutlet weak var payView: UIWebView!
    
    let url = "https://shuper.azurewebsites.net/shopping/pay"
    
    var timer = NSTimer()
    var countdown = 45
    
    override func viewDidLoad() {
        super.viewDidLoad()

        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("waitConfirmation"), userInfo: nil, repeats: true)

        // Do any additional setup after loading the view.
        let requestURL = NSURL(string:url)
        let request = NSURLRequest(URL: requestURL!)
        payView.loadRequest(request)
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
            countdown = 45
    }

func waitConfirmation (){
    countdown--
    if (countdown == 0)
    {
        performSegueWithIdentifier("TransfertoCheckoutConfirmationView", sender: self)
    }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
