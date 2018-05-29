//
//  ContactViewController.swift
//  JD
//
//  Created by Arthur Nguyen on 4/27/18.
//  Copyright © 2018 Arthur Nguyen. All rights reserved.
//

import UIKit
import MapKit

class ContactViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    
    // create variable store location's latitude & longtitude
    var latitude = 37.49441059999999
    var longtitude = -77.55419899999998
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set map zoom in
        let span = MKCoordinateSpanMake(0.005, 0.005)
        // create region for map view
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: latitude, longitude: longtitude), span: span)
        // display the region on map view
        mapView.setRegion(region, animated: true)
        
        // create a pin location
        let pinLocation: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longtitude)
        let objectAnn = MKPointAnnotation()
        objectAnn.coordinate = pinLocation
        self.mapView.addAnnotation(objectAnn)
        
        // set a pin title
        objectAnn.title = "JD Nails"
        objectAnn.subtitle = "8529 Midlothian Turnpike"
        
    } // end func viewDidLoad

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    } // end func didReceiveMemoryWarning
    
    @IBAction func callUs(_ sender: Any) {
        
        // set navigation directly to the location
        UIApplication.shared.open(URL(string: "http://maps.apple.com/maps?daddr=\(latitude),\(longtitude)")!)
        
    } // end func callUs
    
    @IBAction func directions(_ sender: Any) {
        
        // set direct phone call to the location
        UIApplication.shared.open(URL(string: "tel://8043202500")!)
        
    } // end func directions
} // end class ContactViewController
