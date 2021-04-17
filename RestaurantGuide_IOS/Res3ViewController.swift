//
//  Res3ViewController.swift
//  RestaurantGuide_IOS
//
//  Created by Fatih on 2021-03-28.
//

import UIKit
import MapKit
import Social
import MessageUI

class Res3ViewController: UIViewController {

    @IBOutlet weak var mapView2: MKMapView!
    
    @IBOutlet var starButtons: [UIButton]!
    
    @IBOutlet weak var rateView: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Mexi Restaurant"

        let annontation = MKPointAnnotation()
        annontation.coordinate = CLLocationCoordinate2D(latitude: 43.642760279364914, longitude: -79.38705680174967)
      
        mapView2.addAnnotation(annontation)
        
        let region = MKCoordinateRegion(center: annontation.coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
        mapView2.setRegion(region, animated: true)
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        print("Rated \(sender.tag) stars.")
                rateView.text = " 'Mexi RestaurantRated' rated \(sender.tag) stars."
                for  button in starButtons {
                    if button.tag <= sender.tag {
                        button.setBackgroundImage(UIImage.init(named: "start-selected"), for: .normal)   //selectted
                    } else {
                        button.setBackgroundImage(UIImage.init(named: "star-not-selected"), for: .normal)    //not selectted
                    }
                }
    }
    
    @IBAction func socialMedia(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Share" , message: " Mexi Restaurant at Toronto  !" , preferredStyle: .actionSheet)
        let actionOne = UIAlertAction(title: "Share on Facebook", style: .default) { (action) in
            if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeFacebook) {
                let post = SLComposeViewController(forServiceType: SLServiceTypeFacebook)!
                post.setInitialText(" The Mexi Restaurant in this location is awesome guys.")
                post.add(UIImage(named: "res3.png"))
                
                self.present(post, animated: true, completion: nil)
                
                
            }else {self.showAlert(service: "Facebook")}
        }
        
        let actionTwo = UIAlertAction(title: "Share on Twitter", style: .default) { (action) in
            if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeTwitter) {
                let post = SLComposeViewController(forServiceType: SLServiceTypeTwitter)!
                post.setInitialText(" The Mexi Restaurant in this location is awesome guys.")
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
