//
//  CheckoutConfimationViewController.swift
//  Shuper
//
//  Created by PG on 2015-09-26.
//  Copyright © 2015 Shuper. All rights reserved.
//

import UIKit

class CheckoutConfimationViewController: UIViewController {

    var timer = NSTimer()
    var countdown = 15
    
    override func viewDidLoad() {
        super.viewDidLoad()

        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("waitConfirmation"), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        countdown = 15
    }
    
    func waitConfirmation (){
        countdown--
        if (countdown == 0)
        {
            performSegueWithIdentifier("TransfertoSuccessView", sender: self)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
