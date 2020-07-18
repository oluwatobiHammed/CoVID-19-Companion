//
//  GlobalTableViewCell.swift
//  CoVID-19 Companion
//
//  Created by Oladipupo Oluwatobi on 12/07/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import UIKit

class GlobalTableViewCell: UITableViewCell {
    
    @IBOutlet weak var flagImage: UIImageView!
    @IBOutlet weak var countryDetailLabel: UILabel!
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var newCasesLabel: UILabel!
    @IBOutlet weak var newRecovered: UILabel!
    @IBOutlet weak var newDeath: UILabel!
    @IBOutlet weak var casesLabel: UILabel!
    @IBOutlet weak var recoveredLabel: UILabel!
    @IBOutlet weak var deathLabel: UILabel!
    
   
    
    var data: Country? {
        didSet {
            if let data = data {
                flagImage.layer.cornerRadius = 10
                parentView.layer.cornerRadius = 10
                newCasesLabel.layer.cornerRadius = 10
                newCasesLabel?.layer.masksToBounds = true
                newRecovered.layer.cornerRadius = 10
                newRecovered?.layer.masksToBounds = true
                newDeath.layer.cornerRadius = 10
                newDeath?.layer.masksToBounds = true
                flagImage.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
                if let flag = data.countryInfo?.flag, let countryName = data.country{
                    let text = NSMutableAttributedString(string: "")
                     let casesText = NSMutableAttributedString(string: "")
                    text.addBoldBrandText(text: "\(countryName)")
                    
                    casesText.addBrandColorText(text: "\(data.cases)", colourString:"#000000")
                    casesText.addBrandText(text: " " + "cases")
                    casesLabel.attributedText = casesText
                     let recoveredText = NSMutableAttributedString(string: "")
                    recoveredText.addBrandColorText(text: "\(data.recovered)", colourString:"#219653")
                    recoveredText.addBrandText(text:  " " + "recovered")
                    recoveredLabel.attributedText = recoveredText
                     let deathText = NSMutableAttributedString(string: "")
                    deathText.addBrandColorText(text: "\(data.deaths)", colourString:"#EB5757")
                    deathText.addBrandText(text:  " " + "deaths")
                    deathLabel.attributedText = deathText
                    countryDetailLabel.attributedText = text
                    newCasesLabel.text = "\(data.todayCases)" + " New"
                    newRecovered.text = "\(data.todayDeaths)" + " New"
                    newDeath.text = "\(data.todayDeaths)" + " New"
                    flagImage.downloadImage(url: flag)
                }
                
            }
            
        }
    }
}
