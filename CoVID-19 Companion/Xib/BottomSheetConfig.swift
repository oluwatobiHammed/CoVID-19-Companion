//
//  BottomSheetConfig.swift
//  CoVID-19 Companion
//
//  Created by Oladipupo Oluwatobi on 08/06/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
import UIKit

enum BottomSheetConfigContentAnimationDirection {
    case bottom
    case top
    case left
    case right
}
class BottomSheetConfig {
    var showCancelButton: Bool {
        get {
            return self.cancelButtonText != nil
        }
    }
//    var showTopIcon: Bool {
//        get {
//            return self.icon != nil
//        }
//    }
    var secondButtonText: String?
    var topIconColor: UIColor?
    var iconSize: CGFloat?
    var topOvalColor: UIColor?
    //var icon: FontIcon?
    var cancelButtonText: String?
    var applyHeightConstraint = true
    var bottomContentMargin: CGFloat = 20.0
    var leadingContentMargin: CGFloat = 15
    var trailingContentMargin: CGFloat = 15
    var topContentMargin: CGFloat = 55
    var animateContent = true
    var animationDirection: BottomSheetConfigContentAnimationDirection = .bottom
    var secondButtonClickedCallback: EmptyCallback?
    var secondButtPreClickedCallback: EmptyCallback?
    
    init(cancelButtonText: String?, topIconColor: UIColor? = nil, iconSize: CGFloat? = nil,
         topOvalColor: UIColor? = nil) {
        //self.icon = icon
        self.cancelButtonText = cancelButtonText
        
        self.topIconColor = topIconColor
        self.iconSize = iconSize
        self.topOvalColor = topOvalColor
    }
}

