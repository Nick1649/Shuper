//
//  StoreSearchController.swift
//  Shuper
//
//  Created by PG on 2015-09-26.
//  Copyright © 2015 Shuper. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

var storeList = [String]()

var StoreIndex = 0

class StoreSearchController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate , UITableViewDelegate{

    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var storeNearbyTable: UITableView!
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        storeList.append("Toy Store - 705 Rue St-Catherine, H3B 4G5")
        storeList.append("Convenient Store - 205 Rue Sherbrooke O, H2X 1X7 ")
        storeList.append("Book Store - 469 Rue Milton, H2X 1W3")
        storeList.append("Grocery shop - 3575 Avenue du Parc, H2X 3P9")
        storeList.append("Cloth - 705 Rue St-Catherine, H3B 4G5")
        storeList.append("Best Buy - 470 Rue St-Catherine, H3B 1A6")
        storeList.append("Dollarama - 625 Rue St-Catherine, H3B 1B7")
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        
        // Do any additional setup after loading the view.
        
        let latitude:CLLocationDegrees = 45.5
        
        let longitude:CLLocationDegrees = 73.5
        
        let latDelta:CLLocationDegrees = 0.01
        
        let lonDelta:CLLocationDegrees = 0.01
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        map.setRegion(region, animated: true)


    }

    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        print(locations)
        
        let userLocation: CLLocation = locations[0]
        
        let latitude = userLocation.coordinate.latitude
        let longitude = userLocation.coordinate.longitude
        
        
        let latDelta:CLLocationDegrees = 0.01
        
        let lonDelta:CLLocationDegrees = 0.01
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        self.map.setRegion(region, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        storeNearbyTable.reloadData()
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return storeList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        cell.textLabel?.text = storeList[indexPath.row]
        return cell
        
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        performSegueWithIdentifier("TransfertoShoppingView", sender: self)
        StoreIndex = indexPath.row
    
    }

}
