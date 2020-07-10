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
    var resumeTapped = false
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addTapGesture {
            _ = StoryBoardsID.boardOnBoarding.requestNavigation(to: .on__boarding, from: self, requestData: nil)
            self.timer.invalidate()
        }
        runTimer()
        setUpView()
        // Do any additional setup after loading the view.
    }
    
    private func isLoggedIn () -> Bool {
        return UserDefaults.standard.bool(forKey: "isLoggedIn")
    }
    func setUpView() {
        instructionLabel.layer.cornerRadius = 12
        instructionLabel.shadowColor =  .lightGray
        let text = NSMutableAttributedString(string: "")
             text.addBoldBrandText(text: "DAILY MOTIVATION\n\n")
             text.addBrandText(text: "Regularly and thoroughly clean your hands with an alcohol-based hand rub or wash them with soap and water. based hand rub or wash them with soap and water. ")
             dailyMotivationalLabel?.attributedText = text
        
    }
    
    func runTimer() {
          timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       timer.invalidate()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        runTimer()
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
        
        if counter == 7 {
            instructionLabel.alpha  = 0
            timer.invalidate()
            if isLoggedIn() {
                    
            }else{
                _ = StoryBoardsID.boardOnBoarding.requestNavigation(to: .on__boarding, from: self, requestData: nil)
            }
        }
    }
    
}
