//
//  ViewController.swift
//  Shuper
//
//  Created by PG on 2015-09-26.
//  Copyright © 2015 Shuper. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate {

    
    @IBOutlet weak var storeSearchBar: UISearchBar!
    
    @IBOutlet var onSearchStoreCollection: [UISearchBar]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.  
        
        //performSegueWithIdentifier("transferToStoreSearchView", sender: self)

        
        self.storeSearchBar.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        performSegueWithIdentifier("TransfertoStoreSearchView", sender: searchBar)
    }

}

