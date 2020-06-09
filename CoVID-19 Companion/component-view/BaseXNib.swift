//
//  BaseXNib.swift
//  CoVID-19 Companion
//
//  Created by Oladipupo Oluwatobi on 08/06/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import UIKit

class BaseXNib: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
//    override func draw(_ rect: CGRect) {
//
//        // Drawing code
//    }
    

    func setupXnib() {
        if let nibName = getNibName() {
            Bundle.main.loadNibNamed(nibName, owner: self, options: nil)
            guard let content = getContentView() else { return }
            content.frame = self.bounds
            content.autoresizingMask = [.flexibleHeight, .flexibleWidth]
            self.addSubview(content)
        }
    }
    
    func getNibName()-> String? {
        return nil
    }
    
    func getContentView()-> UIView? {
        return nil
    }
    
    deinit {
        print("Destroying \(self)")
    }
}

