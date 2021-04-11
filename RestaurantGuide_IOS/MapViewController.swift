//
//  MapViewController.swift
//  RestaurantGuide_IOS
//
//  Created by Fatih on 2021-04-11.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate=self
        // Do any additional setup after loading the view.
    }
    
    func checkLocationService() {
        if CLLocationManager.locationServicesEnabled(){
            
        }else {
            
        }
        
    }
}

extension MapViewController:CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        <#code#>
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus){
        
    }
}
