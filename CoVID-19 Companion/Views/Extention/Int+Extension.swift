//
//  Int+Extension.swift
//  CoVID-19 Companion
//
//  Created by Oladipupo Oluwatobi on 21/07/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation

extension Int {
    private static var commaFormatter: NumberFormatter = {
         let formatter = NumberFormatter()
         formatter.numberStyle = .decimal
         return formatter
     }()

     internal var commaRepresentation: String {
         return Int.commaFormatter.string(from: NSNumber(value: self)) ?? ""
     }
}
