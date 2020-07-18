//
//  CountriesViewModel.swift
//  CoVID-19 Companion
//
//  Created by Oladipupo Oluwatobi on 11/07/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct CountriesViewModel {
    let images: UIImage?
    let title: String?
    let number: Int?
    
    init(image:UIImage,title:String,number:Int) {
        self.images = image
        self.title = title
        self.number = number
    }

}
