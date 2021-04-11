//
//  Res3ViewController.swift
//  RestaurantGuide_IOS
//
//  Created by Fatih on 2021-03-28.
//

import UIKit
import MapKit

class Res3ViewController: UIViewController {

    @IBOutlet weak var mapView2: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Mexi Restaurant"

        let annontation = MKPointAnnotation()
        annontation.coordinate = CLLocationCoordinate2D(latitude: 43.642760279364914, longitude: -79.38705680174967)
      
        mapView2.addAnnotation(annontation)
        
        let region = MKCoordinateRegion(center: annontation.coordinate, latitudinalMeters: 100, longitudinalMeters: 100)
        mapView2.setRegion(region, animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
