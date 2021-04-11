//
//  MapViewController.swift
//  RestaurantGuide_IOS
//
//  Created by Fatih on 2021-04-11.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    let annontation = MKPointAnnotation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLocationService()
        
        // D43.668863430827365, -79.39514834852406
    }
    
    func setupLocationManager(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func centerViewOnUserLocation() {
        if let location = locationManager.location?.coordinate {
            let annontation = MKCoordinateRegion.init(center: location, latitudinalMeters: 43.668863430827365, longitudinalMeters: 79.39514834852406)
            mapView.setRegion(annontation, animated: true)
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

extension MapViewController:CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            guard let location = locations.last else { return }
            let annontation = MKCoordinateRegion.init(center: location.coordinate, latitudinalMeters: 43.668863430827365, longitudinalMeters: 79.39514834852406)
            mapView.setRegion(annontation, animated: true)
        }
        
        
        func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
            checkLocationAuthorization()
        }
}

