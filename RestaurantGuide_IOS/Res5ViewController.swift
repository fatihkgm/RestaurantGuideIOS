//
//  Res5ViewController.swift
//  RestaurantGuide_IOS
//
//  Created by Fatih on 2021-03-28.
//

import UIKit
import MapKit
import Social

class Res5ViewController: UIViewController {

    @IBOutlet weak var mapView5: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Airport Restaurant"

        let annontation = MKPointAnnotation()
        annontation.coordinate = CLLocationCoordinate2D(latitude: 43.68383201565954, longitude: -79.62518517935519)
      
        mapView5.addAnnotation(annontation)
        
        let region = MKCoordinateRegion(center: annontation.coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
        mapView5.setRegion(region, animated: true)
    }
    

    @IBAction func socialMedia(_ sender: UIButton) {
        let alert = UIAlertController(title: "Share" , message: " Airport Restaurant at Toronto  !" , preferredStyle: .actionSheet)
        let actionOne = UIAlertAction(title: "Share on Facebook", style: .default) { (action) in
            if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeFacebook) {
                let post = SLComposeViewController(forServiceType: SLServiceTypeFacebook)!
                post.setInitialText(" The Airport Restaurant in this location is awesome guys.")
                post.add(UIImage(named: "res3.png"))
                
                self.present(post, animated: true, completion: nil)
                
                
            }else {self.showAlert(service: "Facebook")}
        }
        
        let actionTwo = UIAlertAction(title: "Share on Twitter", style: .default) { (action) in
            if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeTwitter) {
                let post = SLComposeViewController(forServiceType: SLServiceTypeTwitter)!
                post.setInitialText(" The Airport Restaurant in this location is awesome guys.")
                post.add(UIImage(named: "res1.png"))
                
                self.present(post, animated: true, completion: nil)
                
                
            }else {self.showAlert(service: "Twitter")}
        }
        
        alert.addAction(actionOne)
        alert.addAction(actionTwo)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func showAlert(service:String){
        let alert = UIAlertController(title: "Error" , message: "Download and Connected to \(service)" , preferredStyle: .alert)
        let action = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }

}
