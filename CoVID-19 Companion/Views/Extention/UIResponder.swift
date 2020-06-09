//
//  UIResponder.swift
//  CoVID-19 Companion
//
//  Created by Oladipupo Oluwatobi on 08/06/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//


import UIKit

extension UIResponder {
    
    fileprivate weak static var _currentFirstResponder: UIResponder? = nil
    
    static var currentFirstResponder: UIResponder? {
        get {
            UIResponder._currentFirstResponder = nil
            UIApplication.shared.sendAction(#selector(findFirstResponder(sender:)), to: nil, from: nil, for: nil)
            return UIResponder._currentFirstResponder
        }
    }
    
    @objc internal func findFirstResponder(sender: AnyObject) {
        UIResponder._currentFirstResponder = self
    }
}
