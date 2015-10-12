//
//  ViewController.swift
//  map-demo
//
//  Created by Jason Shultz on 10/12/15.
//  Copyright © 2015 HashRocket. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var map: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let latitude:CLLocationDegrees = 40.7 // must use type CLLocationDegrees
        
        let longitude:CLLocationDegrees = -73.9 // must use type CLLocationDegrees
        
        let latDelta:CLLocationDegrees = 0.01 // must use type CLLocationDegrees
        
        let lonDelta:CLLocationDegrees = 0.01 // must use type CLLocationDegrees
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta) // Combination of two Delta Degrees
        
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude) // Combination of the latitude and longitude variables
        
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span) // takes span and location and uses those to set the region.
        
        map.setRegion(region, animated: true) // Take all that stuff and make a map!
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

