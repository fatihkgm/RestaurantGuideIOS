//
//  Res2ViewController.swift
//  RestaurantGuide_IOS
//
//  Created by Fatih on 2021-03-28.
//

import UIKit
import MapKit

class Res2ViewController: UIViewController {

    @IBOutlet weak var mapView1: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Hasty Market"
        
        let annontation = MKPointAnnotation()
        annontation.coordinate = CLLocationCoordinate2D(latitude: 43.67624135177184, longitude: -79.41120476126974)
      
        mapView1.addAnnotation(annontation)
        
        let region = MKCoordinateRegion(center: annontation.coordinate, latitudinalMeters: 100, longitudinalMeters: 100)
        mapView1.setRegion(region, animated: true)

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
