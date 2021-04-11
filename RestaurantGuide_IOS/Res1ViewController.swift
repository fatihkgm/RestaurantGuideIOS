//
//  Res1ViewController.swift
//  RestaurantGuide_IOS
//
//  Created by Fatih on 2021-03-28.
//

import UIKit
import MapKit
import CoreLocation
import Social

class Res1ViewController: UIViewController {

    
    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    var regionInMetters: Double  = 10000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "McDonals"
        checkLocationService()
        

        // Do any additional setup after loading the view.
    }
  
    func setupLocationManager(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func centerViewOnUserLocation() {
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: regionInMetters, longitudinalMeters: regionInMetters)
            mapView.setRegion(region, animated: true)
        }
    }
    
    func checkLocationService() {
        if CLLocationManager.locationServicesEnabled(){
            setupLocationManager()
            checkLocationAuthorization()
            
        }else {
            
        }
        
    }
    
    func checkLocationAuthorization() {
           switch CLLocationManager.authorizationStatus() {
           case .authorizedWhenInUse:
               mapView.showsUserLocation = true
               centerViewOnUserLocation()
               locationManager.startUpdatingLocation()
               break
           case .denied:
               // Show alert instructing them how to turn on permissions
               break
           case .notDetermined:
               locationManager.requestWhenInUseAuthorization()
           case .restricted:
               // Show an alert letting them know what's up
               break
           case .authorizedAlways:
               break
           }
       }
   }

extension Res1ViewController:CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            guard let location = locations.last else { return }
            let region = MKCoordinateRegion.init(center: location.coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
            mapView.setRegion(region, animated: true)
        }
        
        
        func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
            checkLocationAuthorization()
        }
}

