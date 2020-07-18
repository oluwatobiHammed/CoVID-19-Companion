//
//  SliderCollectionViewCell.swift
//  CoVID-19 Companion
//
//  Created by Oladipupo Oluwatobi on 17/07/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import UIKit

class SliderCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var amount: UILabel!
    
    var data: CountriesViewModel? {
         didSet {
             if let data = data {
                 contentView.layer.cornerRadius = 10
                if data.title == "Deaths" {
                    title.textColor = .white
                    amount.textColor = .white
                    contentView.backgroundColor = UIColor.colorFromHexString("#EB5757")
                }else if data.title == "Recovered" {
                     title.textColor = .white
                    amount.textColor = .white
                     contentView.backgroundColor = UIColor.colorFromHexString("#219653")
                }
                image.image = data.images
                title.text = data.title
                if let number = data.number {
                  amount.text = "\(number)"
                }
                
                 
             }
             
         }
     }
    
}
