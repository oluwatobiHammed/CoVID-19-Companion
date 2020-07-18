//
//  UIImage+Extension.swift
//  CoVID-19 Companion
//
//  Created by Oladipupo Oluwatobi on 13/07/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//



import UIKit
import Kingfisher

extension UIImageView  {
    
    func downloadImage(url:String)  {
        let processor = DownsamplingImageProcessor(size: (self.bounds.size))
            |> RoundCornerImageProcessor(cornerRadius: 0)
        let url = URL(string: url)
        self.kf.setImage(
            with: url,
            placeholder: UIImage(named: "placeholderImage"),
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
        ])
    }
    
}
