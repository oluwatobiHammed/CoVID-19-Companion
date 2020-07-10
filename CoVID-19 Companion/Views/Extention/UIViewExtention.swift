//
//  UIViewExtention.swift
//  CoVID-19 Companion
//
//  Created by Oladipupo Oluwatobi on 10/07/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import UIKit

extension UIView {
    func addTapGesture(action: @escaping () -> Void ){
         let tap = UIViewTapGestureRecognizer(target: self , action: #selector(self.handleTap(_:)))
         tap.action = action
         tap.numberOfTapsRequired = 1

         self.addGestureRecognizer(tap)
         self.isUserInteractionEnabled = true

     }
    
    @objc func handleTap(_ sender: UIViewTapGestureRecognizer) {
          sender.action!()
      }
}


//MARK: - Custom UIViewTapGestureRecognizer
class UIViewTapGestureRecognizer: UITapGestureRecognizer {
    var action : (()->Void)? = nil
}
