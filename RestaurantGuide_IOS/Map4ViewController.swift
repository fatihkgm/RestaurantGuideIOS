//
//  Map4ViewController.swift
//  RestaurantGuide_IOS
//
//  Created by Fatih on 2021-04-11.
//

import UIKit
import MapKit


class Map4ViewController: UIViewController {

    @IBOutlet weak var mapView4: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let annontation = MKPointAnnotation()
        annontation.coordinate = CLLocationCoordinate2D(latitude: 43.63899319433326, longitude: -79.3436294371454)
      
        mapView4.addAnnotation(annontation)
        
        let region = MKCoordinateRegion(center: annontation.coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
        mapView4.setRegion(region, animated: true)
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
