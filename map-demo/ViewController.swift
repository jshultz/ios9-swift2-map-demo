//
//  ViewController.swift
//  map-demo
//
//  Created by Jason Shultz on 10/12/15.
//  Copyright © 2015 HashRocket. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var map: MKMapView!
    
    var locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get Location 
        
        locationManager.delegate = self
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.startUpdatingLocation()
        
        // Ending
        
        
        // Do any additional setup after loading the view, typically from a nib.
        
        // Setup Map
        
        let latitude:CLLocationDegrees = 40.7 // must use type CLLocationDegrees
        
        let longitude:CLLocationDegrees = -73.9 // must use type CLLocationDegrees
        
        let latDelta:CLLocationDegrees = 0.01 // must use type CLLocationDegrees
        
        let lonDelta:CLLocationDegrees = 0.01 // must use type CLLocationDegrees
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta) // Combination of two Delta Degrees
        
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude) // Combination of the latitude and longitude variables
        
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span) // takes span and location and uses those to set the region.
        
        // Ending
        
        
        // Adding an Annotation manually
//        let annotation = MKPointAnnotation()
//        
//        annotation.coordinate = location
//        
//        annotation.title = "This awesome place"
//        
//        annotation.subtitle = "If you were here you would know it."
//        
//        map.addAnnotation(annotation)
        // Ending
        
        // User adds an annotation
        
        let uilpgr = UILongPressGestureRecognizer(target: self, action: "action:")
        
        uilpgr.minimumPressDuration = 2
        map.addGestureRecognizer(uilpgr)
        
        // Ending
        
        map.setRegion(region, animated: true) // Take all that stuff and make a map!
        
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
        let userLocation:CLLocation = locations[0]
        
        let latitude:CLLocationDegrees = userLocation.coordinate.latitude
        
        let longitude:CLLocationDegrees = userLocation.coordinate.longitude
        
        let latDelta:CLLocationDegrees = 0.05 // must use type CLLocationDegrees
        
        let lonDelta:CLLocationDegrees = 0.05 // must use type CLLocationDegrees
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta) // Combination of two Delta Degrees
        
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude) // Combination of the latitude and longitude variables
        
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span) // takes span and location and uses those to set the region.
        
        map.setRegion(region, animated: false) // Take all that stuff and make a map!
        
    }
    
    func action(gestureRecognizer:UIGestureRecognizer){
        print("Gesture Recognized")
        
        let touchPoint = gestureRecognizer.locationInView(self.map)
        
        let newCoordinate: CLLocationCoordinate2D = map.convertPoint(touchPoint, toCoordinateFromView: self.map)
        
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = newCoordinate
        
        annotation.title = "This awesome place"
        
        annotation.subtitle = "If you were here you would know it."
        
        map.addAnnotation(annotation)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

