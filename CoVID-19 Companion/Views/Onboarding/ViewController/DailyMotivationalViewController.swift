//
//  DailyMotivationalViewController.swift
//  CoVID-19 Companion
//
//  Created by Oladipupo Oluwatobi on 09/06/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import UIKit
import RxSwift
import RealmSwift

class DailyMotivationalViewController: Covid_19CompanionViewController {
    @IBOutlet weak var dailyMotivationalLabel: UILabel!
    @IBOutlet weak var instructionLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var timer = Timer()
    var counter = 0
    var resumeTapped = false
    var selectedIndex: Int?
    let userDefaults = UserDefaults.standard
    
    fileprivate let realm = try! Realm()
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
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        loggedIn()
        setUpView()
        tableView.dataSource = self
        tableView.delegate = self
        let object = self.realm.objects(Country.self)
               //object?.forEach { (Country) in
        print(object.count)
               //}
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let realm = try! Realm()
        try! realm.write {
            if isLoggedIn() {
                realm.delete(realm.objects(Country.self))
            }
        }
    }
    
    func saveAllCountries(counties: AllCountiesResponse){
        try! realm.write {
            if isLoggedIn() {
                realm.delete(realm.objects(AllCountiesResponse.self))
                realm.add(counties)
            }else {
                realm.add(counties)
            }
            
        }
    }
    func save(counties: Country){
        let realm = try! Realm()
        try! realm.write {
            if isLoggedIn() {
                realm.add(counties)
            }else {
               realm.add(counties)
               
            }
            
        }
    }
    
    func rearrange<T>(array: Array<T>, fromIndex: Int, toIndex: Int) -> Array<T>{
        var arr = array
        self.itemsToRender.removeAll()
        let element = arr.remove(at: fromIndex)
        arr.insert(element, at: toIndex)
        
        return arr
    }
    
    func requestAllCountries()  {
        self.disposable = CountryImplRemoteImpl.shared.getCountry().subscribe(onNext: { (all) in
            DispatchQueue.main.async {
                if let allCountry = all.data{
                    self.saveAllCountries(counties: allCountry)
                }
                
            }
        },onError: { (error) in
            DispatchQueue.main.async {
                print("This is the error message",error)
                self.showTransactioErrorMessage(error: error, title: "Validation Failure", defaultMessage: "Unable to validate your easy account number at the moment, please try again")
            }
            
        },  onCompleted: {
            
        }) {
            
        }
    }
    func requestCountries() {
        self.currentLoadingModal = LoadingViewController.showViewController(self, mainTitle: "Loading....", subTitle: "please wait....")
        self.disposable =  CountriesImplRemoteImpl.shared.getCountries().subscribe(onNext: { (countries) in
            DispatchQueue.main.async {
                if let country = countries.data{
                    if self.isLoggedIn() {
                        self.selectedIndex =  Int(self.userDefaults.string(forKey: "selectedIndex")!)
                        if let selected = self.selectedIndex {
                            self.itemsToRender.removeAll()
                            self.itemsToRender.append(contentsOf: self.rearrange(array: country, fromIndex: selected, toIndex: 0))
                        }
                        self.itemsToRender.forEach { (Country) in
                            //print("This is the data",Country)
                                self.save(counties: Country)
                       
                        }
                    }else {
                      self.itemsToRender =  country
                    }
                    
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
            runTimer()
            requestAllCountries()
            requestCountries()
            view.addTapGesture {
                self.timer.invalidate()
                _ = StoryBoardsID.dashBoard.requestNavigation(to: .dash__board, from: self, requestData: nil, mode: .addToParent)
            }
        }else{
            runTimer()
            requestAllCountries()
            requestCountries()
            view.addTapGesture {
                           self.timer.invalidate()
                self.tableView.alpha = 1
                       }
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
        switch counter {
        case 2:
            instructionLabel.alpha  = 1
        case 3:
            instructionLabel.alpha  = 0
        case 4:
            instructionLabel.alpha  = 1
            instructionLabel.text = "Tap anywhere to dismiss the splashscreen"
        case 7:
            instructionLabel.alpha  = 0
        case 10:
            timer.invalidate()
            if isLoggedIn() {
                tableView.alpha = 0
                _ = StoryBoardsID.dashBoard.requestNavigation(to: .dash__board, from: self, requestData: nil, mode: .addToParent)
            }else{
                tableView.alpha = 1
            }
            
        default: break
            
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
            self.userDefaults.set("\(indexPath.row)", forKey: "selectedIndex")
            self.selectedIndex =  Int(self.userDefaults.string(forKey: "selectedIndex")!)
            if let selected = self.selectedIndex {
                self.itemsToRender.append(contentsOf: self.rearrange(array: self.itemsToRender, fromIndex: selected, toIndex: 0))
            }
            self.itemsToRender.forEach { (Country) in
            //print(Country)
            self.save(counties: Country)
            }
            _ = StoryBoardsID.boardOnBoarding.requestNavigation(to: .on__boarding, from: self, requestData: nil)
        }
        return cell
    }
    
    
    
}
