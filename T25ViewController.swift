//
//  T25ViewController.swift
//  RestaurantGuide_IOS
//
//  Created by Fatih on 2021-04-11.
//

import UIKit

class T25ViewController: UIViewController {


    @IBOutlet var starButtons: [UIButton]!
    @IBOutlet weak var rateView: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = " Project T25 "

        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        print("Rated \(sender.tag) stars.")
                rateView.text = "Rated \(sender.tag) stars."
                for  button in starButtons {
                    if button.tag <= sender.tag {
                        button.setBackgroundImage(UIImage.init(named: "start-selected"), for: .normal)   //selectted
                    } else {
                        button.setBackgroundImage(UIImage.init(named: "star-not-selected"), for: .normal)    //not selectted
                    }
                }
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
