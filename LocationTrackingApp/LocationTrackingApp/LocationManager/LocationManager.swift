//
//  LocationManager.swift
//  LocationTrackingApp
//
//  Created by Purushottam Padhya on 28/1/22.
//

import Foundation
import CoreLocation
import UIKit

class LocationManager: NSObject, CLLocationManagerDelegate{
    private override init() {
        super.init()
        
    }
    static let shared = LocationManager()
    
    private let locationManager = CLLocationManager()
    
    weak var delegate : CLLocationManagerDelegate?
    weak var vc: UIViewController?
    // adding properties
    private var isCalledGetLocation = false
    
    // get current location
    var previousLocation : CLLocation?
    
    func startTracking(){
        // input configuration data
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.stopUpdatingLocation() // request will restart it
        locationManager.requestLocation()
        
        
        // checking auth status if not shows alert to changes in settings
        let authStatus = locationManager.authorizationStatus
        switch authStatus{
        case . authorizedAlways:
            if UIApplication.shared.applicationState != .background{
                locationManager.startUpdatingLocation()
            }
            locationManager.startMonitoringSignificantLocationChanges()
            locationManager.allowsBackgroundLocationUpdates = true
        case .authorizedWhenInUse:
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
        case .restricted, .notDetermined:
            locationManager.requestAlwaysAuthorization()
        case .denied:
            vc?.showLocationPermissionAlert(msg: "To provide location changes please provide authorization from settings.")
            
        @unknown default:
            fatalError()
        }
    }
    
    func stopTracking(){
        
        locationManager.stopMonitoringSignificantLocationChanges()
        locationManager.stopUpdatingLocation()
        isCalledGetLocation = false
    }
    
    func enterBackground(){
        locationManager.stopUpdatingLocation()
        locationManager.startMonitoringSignificantLocationChanges()
    }
    func enterForground(){
        locationManager.startUpdatingLocation()
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status{
        case . authorizedWhenInUse, .authorizedAlways:
            if UIApplication.shared.applicationState != .background{
                locationManager.startUpdatingLocation()
            }
        default : break
        }
        delegate?.locationManagerDidChangeAuthorization?(locationManager)
    }
    
    
    //MARK: - handling update location on every changes
    // save previous location and calculate a distance with new location
    // if distance would be grater than 10 show alert that you moved more than 10 meter from your last location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let lastLocation = locations.last else { return }
        if CLLocationManager.significantLocationChangeMonitoringAvailable(){
            locationManager.startMonitoringSignificantLocationChanges()
        }

        if previousLocation == nil {
            previousLocation = lastLocation
        }
        print("previous and last locations are")
        print(previousLocation!)
        print(lastLocation)
        let distance = previousLocation!.distance(from: lastLocation) / 1000
        if distance > 10 {
            previousLocation = lastLocation
            if let vc = vc?.navigationController?.topViewController {
                vc.showAlert(msg: "You moved 10 meter from your previous distance.")

            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        vc?.showAlert(msg: error.localizedDescription)
    }
    
}


