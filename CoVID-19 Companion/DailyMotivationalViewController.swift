//
//  DailyMotivationalViewController.swift
//  CoVID-19 Companion
//
//  Created by Oladipupo Oluwatobi on 09/06/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import UIKit

class DailyMotivationalViewController: Covid_19CompanionViewController {
    @IBOutlet weak var dailyMotivationalLabel: UILabel!
    @IBOutlet weak var instructionLabel: UILabel!
    var timer = Timer()
    var counter = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        setUpView()
        // Do any additional setup after loading the view.
    }
    
    func setUpView() {
        instructionLabel.layer.cornerRadius = 12
        instructionLabel.shadowColor =  .lightGray
        //instructionLabel.layer.borderColor = (UIColor.black as! CGColor)
        //instructionLabel.layer.borderWidth = 0.5
        
    }
    
    @objc func timerAction()  {
        counter += 1
        if counter == 2 {
            instructionLabel.alpha  = 1
        }
        if counter == 3{
            instructionLabel.alpha  = 0
        }
        if counter == 4 {
            instructionLabel.alpha  = 1
            instructionLabel.text = "Tap anywhere to dismiss the splashscreen"
        }
        
        if counter == 15 {
            timer.invalidate()
        }
    }
    
}
