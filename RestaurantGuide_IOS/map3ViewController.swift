//
//  map3ViewController.swift
//  RestaurantGuide_IOS
//
//  Created by Fatih on 2021-04-11.
//

import UIKit
import MapKit

class map3ViewController: UIViewController {

    @IBOutlet weak var mapView2: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let annontation = MKPointAnnotation()
        annontation.coordinate = CLLocationCoordinate2D(latitude: 43.642760279364914, longitude: -79.38705680174967)
      
        mapView2.addAnnotation(annontation)
        
        let region = MKCoordinateRegion(center: annontation.coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
        mapView2.setRegion(region, animated: true)

        // Do any additional setup after loading the view.
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
