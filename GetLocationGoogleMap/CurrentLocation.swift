//
//  Location.swift
//  GetLocationGoogleMap
//
//  Created by KumagaiNaoki on 2016/09/18.
//  Copyright © 2016年 KumagaiNaoki. All rights reserved.
//

import UIKit
import CoreLocation

class CurrentLocation: NSObject ,CLLocationManagerDelegate {

    var lm:CLLocationManager = CLLocationManager()
    
    func getLocation() {
//        lm = CLLocationManager()
//        lm.delegate = self//ここは要らないかな？
        let status = CLLocationManager.authorizationStatus()
        if status == CLAuthorizationStatus.NotDetermined {
            self.lm.requestAlwaysAuthorization()
        }
        lm.desiredAccuracy = kCLLocationAccuracyBest
        lm.distanceFilter = 100
        lm.startUpdatingLocation()
    }
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        var statusStr = ""
        switch status {
        case CLAuthorizationStatus.NotDetermined :
            statusStr = "NotDetermined"
        case CLAuthorizationStatus.Restricted :
            statusStr = "Restricted"
        case CLAuthorizationStatus.Denied :
            statusStr = "Denied"
        case CLAuthorizationStatus.AuthorizedAlways :
            statusStr = "AuthorizedAlways"
        case CLAuthorizationStatus.AuthorizedWhenInUse :
            statusStr = "AuthorizedWhenInUse"
        }
        print(statusStr)
    }
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        CLGeocoder().reverseGeocodeLocation(manager.location!) { (placemarks, error) in
            if error != nil {
                return
            }
            if placemarks?.count > 0 {
                let pm = placemarks![0] as CLPlacemark
                self.displayLocationInfo(pm)
                self.lm.stopUpdatingLocation()
            } else {
                print("Problem with the data received from geocoder")
            }
        }
        
    }
    func displayLocationInfo(placemark: CLPlacemark) {
        var address = ""
        address = placemark.administrativeArea != nil ? placemark.administrativeArea! : ""
        address += ","
        address += placemark.locality != nil ? placemark.locality! : ""
        address += ","
        address += placemark.name != nil ? placemark.name! : ""
        print(address)
//        self.customDelegate?.gotCurrentLocation(address)
    }
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("LocationGetError")
    }
    func pushMapButton(sender: UIButton) {
        print("\(#function),\(#line)")
    }
}
