//
//  TrackingViewController.swift
//  LocationTrackingApp
//
//  Created by Purushottam Padhya on 27/1/22.
//

import Foundation
import UIKit
import CoreLocation
import MapKit

class TrackingViewController: UIViewController, CLLocationManagerDelegate{

    // shared manager class is instantiate
    let locationManager = LocationManager.shared
    
    @IBOutlet weak var mapView: MKMapView!
    var previousLocation: CLLocation?
    override func viewDidLoad() {
        super.viewDidLoad()
       // start tracking a location
        locationManager.vc = self
        locationManager.startTracking()
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        // ending location tracking
    
        locationManager.stopTracking()
    }

}

