//
//  WashHandFreqeuntlyViewController.swift
//  CoVID-19 Companion
//
//  Created by Oladipupo Oluwatobi on 24/06/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
import UIKit

class OnBoardingViewController: Covid_19CompanionViewController {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var navigateButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var pageIndicator: UIImageView!
    var page:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        page = 1
        let origImage = UIImage(named: "backbutton")
        let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
        backButton.setImage(tintedImage, for: .normal)
        backButton.tintColor = .green
        
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    private func setUpViews(page:Int) {
        switch page {
        case 1:
            backButton.alpha = 0
            image.image = #imageLiteral(resourceName: "Handwashing-rafiki 1")
            titleLabel.text = "Wash your hands frequently"
            pageIndicator.image = #imageLiteral(resourceName: "Frame 1")
            let text = NSMutableAttributedString(string: "")
            text.addBrandText(text: "Regularly and thoroughly clean your hands with an alcohol-based hand rub or wash them with soap and water.\n\n")
            text.addBoldBrandText(text: "Why?\n")
            text.addBrandText(text: "Washing your hands with soap and water or using alcohol-based hand rub kills viruses that may be on your hands. ")
            descriptionLabel?.attributedText = text
        case 2:
            backButton.alpha = 1
            image.image = #imageLiteral(resourceName: "Social Distancing-rafiki 1")
            titleLabel.text = "Maintain social distancing"
            pageIndicator.image = #imageLiteral(resourceName: "Frame 2")
            let text = NSMutableAttributedString(string: "")
            text.addBrandText(text: "Maintain at least 1 metre (3 feet) distance between yourself and anyone who is coughing or sneezing.\n\n")
            text.addBoldBrandText(text: "Why?\n")
            text.addBrandText(text: "When someone coughs or sneezes they spray small liquid droplets from their nose or mouth which may contain virus. If you are too close, you can breathe in the droplets, including the COVID-19 virus if the person coughing has the disease. ")
            descriptionLabel?.attributedText = text
            
        case 3:
            image.image = #imageLiteral(resourceName: "undraw_smiley_face_lmgm (1) 1")
            titleLabel.text = "Avoid touching eyes, nose and mouth"
            pageIndicator.image = #imageLiteral(resourceName: "Frame 3")
            let text = NSMutableAttributedString(string: "")
            text.addBoldBrandText(text: "Why?\n")
            text.addBrandText(text: "Hands touch many surfaces and can pick up viruses. Once contaminated, hands can transfer the virus to your eyes, nose or mouth. From there, the virus can enter your body and can make you sick. ")
            descriptionLabel?.attributedText = text
        case 4:
            image.image = #imageLiteral(resourceName: "drawing 1")
            titleLabel.text = "Practice respiratory hygiene"
            pageIndicator.image = #imageLiteral(resourceName: "Frame 4")
            
            let text = NSMutableAttributedString(string: "")
            text.addBrandText(text: "Make sure you, and the people around you, follow good respiratory hygiene. This means covering your mouth and nose with your bent elbow or tissue when you cough or sneeze. Then dispose of the used tissue immediately.\n\n")
            text.addBoldBrandText(text: "Why?\n")
            text.addBrandText(text: "Droplets spread virus. By following good respiratory hygiene you protect the people around you from viruses such as cold, flu and COVID-19. ")
            descriptionLabel?.attributedText = text
        case 5:
            image.image = #imageLiteral(resourceName: "isolate 1")
            titleLabel.text = "Self-isolate"
            pageIndicator.image = #imageLiteral(resourceName: "Frame 6")
            let text = NSMutableAttributedString(string: "")
            text.addBrandText(text: "Stay home and self-isolate even with minor symptoms such as cough, headache, mild fever, until you recover. Have someone bring you supplies. If you need to leave your house, wear a mask to avoid infecting others.\n\n")
            text.addBoldBrandText(text: "Why?\n")
            text.addBrandText(text: "Avoiding contact with others will protect them from possible COVID-19 and other viruses. ")
            descriptionLabel?.attributedText = text
        case 6:
            image.image = #imageLiteral(resourceName: "medicalsvg 1")
            titleLabel.text = "Seek Medical Attention"
            navigateButton.setTitle("NEXT", for: .normal)
            pageIndicator.image = #imageLiteral(resourceName: "Frame 4")
            
            let text = NSMutableAttributedString(string: "")
            text.addBrandText(text: "If you have a fever, cough and difficulty breathing, seek medical attention, but call by telephone in advance if possible and follow the directions of your local health authority.\n\n")
            text.addBoldBrandText(text: "Why?\n")
            text.addBrandText(text: "National and local authorities will have the most up to date information on the situation in your area. Calling in advance will allow your health care provider to quickly direct you to the right health facility. This will also protect you and help prevent spread of viruses and other infections ")
            descriptionLabel?.attributedText = text
        case 7:
            image.image = #imageLiteral(resourceName: "Search engines-rafiki 1")
            titleLabel.text = "Stay informed and follow advice"
            navigateButton.setTitle("Next", for: .normal)
            pageIndicator.image = #imageLiteral(resourceName: "Frame 7")
            let text = NSMutableAttributedString(string: "")
            text.addBrandText(text: "Stay informed on the latest developments about COVID-19. Follow advice given by your healthcare provider, your national and local public health authority or your employer on how to protect yourself and others from COVID-19.\n\n")
            text.addBoldBrandText(text: "Why?\n")
            text.addBrandText(text: "National and local authorities will have the most up to date information on whether COVID-19 is spreading in your area. They are best placed to advise on what people in your area should be doing to protect themselves. ")
            descriptionLabel?.attributedText = text
        case 8:
            image.image = #imageLiteral(resourceName: "avoidCrowd")
            titleLabel.text = "Avoid crowded places"
            navigateButton.setTitle("GET STARTED", for: .normal)
            pageIndicator.image = #imageLiteral(resourceName: "Frame 7")
            let text = NSMutableAttributedString(string: "")
            text.addBrandText(text: "Stay informed on the latest developments about COVID-19. Follow advice given by your healthcare provider, your national and local public health authority or your employer on how to protect yourself and others from COVID-19.\n\n")
            text.addBoldBrandText(text: "Why?\n")
            text.addBrandText(text: "National and local authorities will have the most up to date information on whether COVID-19 is spreading in your area. They are best placed to advise on what people in your area should be doing to protect themselves. ")
            descriptionLabel?.attributedText = text
            
        default:
            break
        }
        print(page)
    }
    
    private func isLoggedIn () -> Bool {
        return UserDefaults.standard.bool(forKey: "isLoggedIn")
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        if page! > 1 {
            page! -= 1
            setUpViews(page: page!)
        }
        
    }
    @IBAction func nextButtonPressed(_ sender: Any) {
        if page! < 8 {
            page! += 1
            setUpViews(page: page!)
        }
    }
}
