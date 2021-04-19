//
//  Res1ViewController.swift
//  RestaurantGuide_IOS
//
//  Created by Zac on 2021-03-28.
//

import UIKit
import MapKit
import CoreLocation
import Social
import MessageUI


class Res1ViewController: UIViewController {

    //Outlets 
    
    @IBOutlet weak var mapView: MKMapView!
   
    @IBOutlet var starButtons: [UIButton]!
    
    @IBOutlet weak var rateView: UILabel!
    
    let locationManager = CLLocationManager()
    var regionInMetters: Double  = 10000
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "McDonalds"
        checkLocationService()
        
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        print("Rated \(sender.tag) stars.")
                rateView.text = "You rated McDonalds \(sender.tag) stars."
                for  button in starButtons {
                    if button.tag <= sender.tag {
                        button.setBackgroundImage(UIImage.init(named: "start-selected"), for: .normal)   //selectted
                    } else {
                        button.setBackgroundImage(UIImage.init(named: "star-not-selected"), for: .normal)    //not selectted
                    }
                }
    }
    
    

    
    @IBAction func emailButtonTapped(_ sender: SAButton) {
        showMailComposer()
    }
    
  //social media buttons for facebook and twitter 
    
    @IBAction func facebookButton(_ sender: Any) {
        
        let alert = UIAlertController(title: "Share" , message: " Mcdonalds at Toronto  !" , preferredStyle: .actionSheet)
        let actionOne = UIAlertAction(title: "Share on Facebook", style: .default) { (action) in
            if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeFacebook) {
                let post = SLComposeViewController(forServiceType: SLServiceTypeFacebook)!
                post.setInitialText(" The Mcdonalds in this location is awesome guys.")
                post.add(UIImage(named: "res1.png"))
                
                self.present(post, animated: true, completion: nil)
                
                
            }else {self.showAlert(service: "Facebook")}
        }
        
        let actionTwo = UIAlertAction(title: "Share on Twitter", style: .default) { (action) in
            if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeTwitter) {
                let post = SLComposeViewController(forServiceType: SLServiceTypeTwitter)!
                post.setInitialText(" The Mcdonalds in this location is awesome guys.")
                post.add(UIImage(named: "res1.png"))
                
                self.present(post, animated: true, completion: nil)
                
                
            }else {self.showAlert(service: "Twitter")}
        }
        
        alert.addAction(actionOne)
        alert.addAction(actionTwo)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func showMailComposer() {
        guard MFMailComposeViewController.canSendMail() else {
            return
        }
        let composer = MFMailComposeViewController()
                composer.mailComposeDelegate = self
                composer.setToRecipients(["t25@gmail.com"])
                composer.setSubject("Check Out!")
                composer.setMessageBody("This restaurant is awesome!", isHTML: false)
                
                present(composer, animated: true)
    }
  
    func showAlert(service:String){
        let alert = UIAlertController(title: "Error" , message: "You are not connected to \(service)" , preferredStyle: .alert)
        let action = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
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
    
    //Authorization so app get's permissions
    
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

extension Res1ViewController:CLLocationManagerDelegate,MFMailComposeViewControllerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            guard let location = locations.last else { return }
            let region = MKCoordinateRegion.init(center: location.coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
            mapView.setRegion(region, animated: true)
        }
        
        
    
    
        func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
            checkLocationAuthorization()
        }
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        if let _ = error {
            //Show error alert
            controller.dismiss(animated: true)
            return
        }
        
        switch result {
        case .cancelled:
            print("Cancelled")
        case .failed:
            print("Failed to send")
        case .saved:
            print("Saved")
        case .sent:
            print("Email Sent")
        @unknown default:
            break
        }
        
        controller.dismiss(animated: true)
    }
}

