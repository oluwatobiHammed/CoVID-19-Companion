//
//  NSMutableAttributedString.swift
//  CoVID-19 Companion
//
//  Created by Oladipupo Oluwatobi on 09/06/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
import UIKit
extension NSMutableAttributedString {
    func addBrandText(text: String, attributes: [NSAttributedString.Key : Any]? = nil) {
        var toUseAttributes: [NSAttributedString.Key : Any] = attributes ?? [:]
        if toUseAttributes[NSAttributedString.Key.font] == nil {
            toUseAttributes[NSAttributedString.Key.font] =  UIFont(name: "Proxima Nova Alt", size: 15)
        }
//        if toUseAttributes[NSAttributedString.Key.foregroundColor] == nil {
//            toUseAttributes[NSAttributedString.Key.foregroundColor] =  UIColor.green
//        }
        let attribute = NSAttributedString(string: text, attributes: toUseAttributes)
        self.append(attribute)
    }
    func addBrandColorText(text: String, attributes: [NSAttributedString.Key : Any]? = nil, colourString: String) {
            var toUseAttributes: [NSAttributedString.Key : Any] = attributes ?? [:]
            if toUseAttributes[NSAttributedString.Key.font] == nil {
                toUseAttributes[NSAttributedString.Key.font] =  UIFont(name: "Proxima Nova", size: 17)
            }
            if toUseAttributes[NSAttributedString.Key.foregroundColor] == nil {
                toUseAttributes[NSAttributedString.Key.foregroundColor] =  UIColor.colorFromHexString(colourString)
            }
            let attribute = NSAttributedString(string: text, attributes: toUseAttributes)
            self.append(attribute)
        }
    func addBoldBrandText(text: String, attributes: [NSAttributedString.Key : Any]? = nil) {
        var toUseAttributes: [NSAttributedString.Key : Any] = attributes ?? [:]
        if toUseAttributes[NSAttributedString.Key.font] == nil {
            toUseAttributes[NSAttributedString.Key.font] =  UIFont(name: "Proxima Nova", size: 24)
        }
        let attribute = NSAttributedString(string: text, attributes: toUseAttributes)
        self.append(attribute)
    }
}
