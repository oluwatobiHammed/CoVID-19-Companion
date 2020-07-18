//
//  Typography.swift
//  CoVID-19 Companion
//
//  Created by Oladipupo Oluwatobi on 08/06/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
import UIKit

public enum FontStyle: String {
    case Default = "Proxima Nova "
    case Bold = "Proxima Nova Bold"
    case ExtraBold = "Proxima Nova ExtraBold"
    case Black = "Proxima Nova Black"
    case Medium = "Montserrat-Medium"
    case Light = "Proxima Nova Alt Light"
    
    var size: CGFloat {
        switch self {
        case .Default:
            return 13
        case .Bold:
            return 13
        default:
            return 13
        }
    }
    func step(by: CGFloat = 1)-> CGFloat {
        return self.size + (2.0 * by)
    }
    func getFont(sizeBy: CGFloat = 0)-> UIFont {
        return UIFont(name: self.rawValue, size: self.step(by: sizeBy))!
    }
    
    static func fontFromStyle(name: String)-> FontStyle? {
        switch name {
        case "Default":
            return FontStyle.Default
        case "Bold":
            return FontStyle.Bold
        case "ExtraBold":
            return FontStyle.ExtraBold
        case "Black":
            return FontStyle.Black
        case "Medium":
            return FontStyle.Medium
        case "Light":
            return FontStyle.Light
        default:
            return nil
        }
    }
}
