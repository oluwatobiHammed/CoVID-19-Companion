//
//  DailyMotivationalViewController.swift
//  CoVID-19 Companion
//
//  Created by Oladipupo Oluwatobi on 09/06/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import UIKit
import RxSwift

class DailyMotivationalViewController: Covid_19CompanionViewController {
    @IBOutlet weak var dailyMotivationalLabel: UILabel!
    @IBOutlet weak var instructionLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var timer = Timer()
    var counter = 0
    var resumeTapped = false
    
    var itemsToRender: [Country] = [] {
         didSet {
             DispatchQueue.main.async {
                 self.tableView?.reloadData()
             }
         }
     }
    var disposable: Disposable?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addTapGesture {
            self.loggedIn()
        }
        //runTimer()
        loggedIn()
        setUpView()
        requestCountries()
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        view.addTapGesture {
            self.loggedIn()
        }
    
    }
    
    func rearrange<T>(array: Array<T>, fromIndex: Int, toIndex: Int) -> Array<T>{
        var arr = array
        self.itemsToRender.removeAll()
        let element = arr.remove(at: fromIndex)
        arr.insert(element, at: toIndex)

        return arr
    }
    func requestCountries() {
        self.currentLoadingModal = LoadingViewController.showViewController(self, mainTitle: "Loading....", subTitle: "please wait....")
        self.disposable =  CountriesImplRemoteImpl.shared.getCountries().subscribe(onNext: { (countries) in
            DispatchQueue.main.async {
                if let country = countries.data{
                    self.itemsToRender =  country
                }
                self.dismissCurrentLoadingModal()
            }
        }, onError: { (error) in
               DispatchQueue.main.async {
                self.dismissCurrentLoadingModal()
                print("This is the error message",error)
                 self.showTransactioErrorMessage(error: error, title: "Validation Failure", defaultMessage: "Unable to validate your easy account number at the moment, please try again")
                         }
                     
        },  onCompleted: {
                   
               }) {
                   
               }
    }
    
    private func loggedIn () {
        
        if isLoggedIn() {
            tableView.alpha = 0
             runTimer()
        }else{
          
        }
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
        print(counter)
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
           
            //_ = StoryBoardsID.boardOnBoarding.requestNavigation(to: .on__boarding, from: self, requestData: nil)
        }
        if counter == 10 {
            timer.invalidate()
        }
    }
    
}


extension DailyMotivationalViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        itemsToRender.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countrycell", for: indexPath)
        cell.selectionStyle = .none
        cell.textLabel?.text = itemsToRender[indexPath.row].country
        cell.addTapGesture {
            self.itemsToRender.append(contentsOf: self.rearrange(array: self.itemsToRender, fromIndex: indexPath.row, toIndex: 0))
            print(self.itemsToRender)
            _ = StoryBoardsID.boardOnBoarding.requestNavigation(to: .on__boarding, from: self, requestData: nil)
        }
        return cell
    }
    
    
    
}
