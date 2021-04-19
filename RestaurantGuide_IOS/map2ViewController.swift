//
//  map2ViewController.swift
//  RestaurantGuide_IOS
//
//  Created by Yazan and Josh
//

import UIKit
import MapKit

class map2ViewController: UIViewController {

    @IBOutlet weak var mapView1: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let annontation = MKPointAnnotation()
        annontation.coordinate = CLLocationCoordinate2D(latitude: 43.67624135177184, longitude: -79.41120476126974)
      
        mapView1.addAnnotation(annontation)
        
        let region = MKCoordinateRegion(center: annontation.coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
        mapView1.setRegion(region, animated: true)
        
    }
    
    
}
