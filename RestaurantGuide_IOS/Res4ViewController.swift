//
//  Res4ViewController.swift
//  RestaurantGuide_IOS
//
//  Created by Fatih on 2021-03-28.
//

import UIKit
import MapKit
import Social

class Res4ViewController: UIViewController {

    @IBOutlet weak var mapView4: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Your Home"

        let annontation = MKPointAnnotation()
        annontation.coordinate = CLLocationCoordinate2D(latitude: 43.63899319433326, longitude: -79.3436294371454)
      
        mapView4.addAnnotation(annontation)
        
        let region = MKCoordinateRegion(center: annontation.coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
        mapView4.setRegion(region, animated: true)
    }
    

    @IBAction func socialMedia(_ sender: UIButton) {
        let alert = UIAlertController(title: "Share" , message: " Your Home at Toronto  !" , preferredStyle: .actionSheet)
        let actionOne = UIAlertAction(title: "Share on Facebook", style: .default) { (action) in
            if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeFacebook) {
                let post = SLComposeViewController(forServiceType: SLServiceTypeFacebook)!
                post.setInitialText(" Your Home in this location is awesome guys.")
                post.add(UIImage(named: "res3.png"))
                
                self.present(post, animated: true, completion: nil)
                
                
            }else {self.showAlert(service: "Facebook")}
        }
        
        let actionTwo = UIAlertAction(title: "Share on Twitter", style: .default) { (action) in
            if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeTwitter) {
                let post = SLComposeViewController(forServiceType: SLServiceTypeTwitter)!
                post.setInitialText(" The Your Home in this location is awesome guys.")
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
