//
//  ShoppingCartController.swift
//  Shuper
//
//  Created by PG on 2015-09-26.
//  Copyright © 2015 Shuper. All rights reserved.
//

import UIKit
    var cellContent = [String]()

class ShoppingCartController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var sku: UILabel!
    
    @IBOutlet weak var StoreDescriptionLabel: UILabel!
    @IBOutlet weak var CartView: UITableView!
    

    @IBOutlet weak var SubTotalLabel: UILabel!

    @IBOutlet weak var PayButton: UIToolbar!
    
    let url = "https://google.com"
    //let url = "172.20.34.151:1971/home/about"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //barCodeNumber contain bar number

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    override func viewDidAppear(animated: Bool) {
        StoreDescriptionLabel.text = storeList[StoreIndex]
        CartView.reloadData()

        let stringSubtotal = NSString(format:"%.2f",  subtotalKart) as String
        SubTotalLabel.text = "Total: " + "$" + stringSubtotal
        
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return cellContent.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        cell.textLabel?.text = cellContent[indexPath.row]
        return cell
    
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == UITableViewCellEditingStyle.Delete
        {
            cellContent.removeAtIndex(indexPath.row)
            CartView.reloadData()
        }
    
    }
    
    
//    let request = NSMutableURLRequest(URL: NSURL(string: "http://www.thisismylink.com/postName.php")!)
//    request.HTTPMethod = "POST" 
//    let postString = "id=13&name=Jack"
//    request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
//    let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
//        data, response, error in
//        
//        if error != nil {
//            print("error=\(error)")
//            return
//        }
//        
//        print("response = \(response)")
//        
//        let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
//        print("responseString = \(responseString)")
//    }
//    task.resume()


}
