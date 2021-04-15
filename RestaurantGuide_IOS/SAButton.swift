//
//  SAButton.swift
//  RestaurantGuide_IOS
//
//  Created by Fatih on 2021-04-14.
//

import UIKit

class SAButton: UIButton {

    override init(frame: CGRect) {
          super.init(frame: frame)
          setupButton()
      }
      
      
      required init?(coder aDecoder: NSCoder) {
          super.init(coder: aDecoder)
          setupButton()
      }
      
      
      private func setupButton() {
          setTitleColor(.white, for: .normal)
          backgroundColor     = UIColor(red: 255/255, green: 5/255, blue: 41/255, alpha: 1.0)
          titleLabel?.font    = .boldSystemFont(ofSize: 20)
          layer.cornerRadius  = frame.size.height / 2
      }

}
