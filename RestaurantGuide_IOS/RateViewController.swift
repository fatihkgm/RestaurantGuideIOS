//
//  RateViewController.swift
//  RestaurantGuide_IOS
//
//  Created by Fatih on 2021-04-17.
//

import UIKit
import StoreKit

class RateViewController: UIViewController {
    
    
    private let button:UIButton = {
        let button = UIButton()
        button.setTitle("Rate Now", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 55)
        button.center = view.center
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc private func didTapButton() {
        let alert = UIAlertController(title: "T25 FeedBack", message: "Thanks for using our T25 app!", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "I like T25 App", style: .default, handler: {[weak self ]_ in
            guard let scene = self?.view.window?.windowScene else {
                print ("no screen")
                return
            }
            SKStoreReviewController.requestReview(in: scene)
        }))
        alert.addAction(UIAlertAction(title: "Needs Upgrade", style: .default, handler: { _ in }))
        
        present(alert,animated: true)
        
    }
}
