//
//  NSMutableAttributedString.swift
//  CoVID-19 Companion
//
//  Created by Oladipupo Oluwatobi on 09/06/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation

extension NSMutableAttributedString {
    func addBrandText(text: String, attributes: [NSAttributedString.Key : Any]? = nil) {
        var toUseAttributes: [NSAttributedString.Key : Any] = attributes ?? [:]
        if toUseAttributes[NSAttributedString.Key.font] == nil {
            toUseAttributes[NSAttributedString.Key.font] = FontStyle.Default.getFont()
        }
        let attribute = NSAttributedString(string: text, attributes: toUseAttributes)
        self.append(attribute)
    }
    
    func addBoldBrandText(text: String, attributes: [NSAttributedString.Key : Any]? = nil) {
        var toUseAttributes: [NSAttributedString.Key : Any] = attributes ?? [:]
        if toUseAttributes[NSAttributedString.Key.font] == nil {
            toUseAttributes[NSAttributedString.Key.font] = FontStyle.Bold.getFont()
        }
        let attribute = NSAttributedString(string: text, attributes: toUseAttributes)
        self.append(attribute)
    }
}