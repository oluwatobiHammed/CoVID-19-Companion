//
//  HeaderTableViewCell.swift
//  CoVID-19 Companion
//
//  Created by Oladipupo Oluwatobi on 18/07/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import UIKit
import RealmSwift

class HeaderTableViewCell: UITableViewCell {
    @IBOutlet weak var headerTitle: CaptionLabel!
    @IBOutlet weak var collectionView: BJAutoScrollingCollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var sortByConfirmButton: UIButton!
    @IBOutlet weak var sortByRecoveredButton: UIButton!
    @IBOutlet weak var sortByDeathButton: UIButton!
    @IBOutlet weak var searchBarHeight: NSLayoutConstraint!
    @IBOutlet weak var caseSortTopConstrain: NSLayoutConstraint!
    @IBOutlet weak var caseButtonHeightConstrain: NSLayoutConstraint!
    @IBOutlet weak var recoveredButtonTopConstrain: NSLayoutConstraint!
    @IBOutlet weak var recoveredButtonHeightConstrain: NSLayoutConstraint!
    @IBOutlet weak var deathButtonTopConstrain: NSLayoutConstraint!
    @IBOutlet weak var deathButtonButtomConstrain: NSLayoutConstraint!
    weak var tableView: UITableView!
    var count: Int = 1
    var isHighLighted:Bool = false
    var allItemsToRender: Results<AllCountiesResponse>?
    fileprivate let realm = try! Realm()
    @IBOutlet weak var collectionViewFlowLayout: UICollectionViewFlowLayout!
    
    @IBOutlet weak var parentViewLeftConstrain: NSLayoutConstraint!
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var deathButtonHeightConstrain: NSLayoutConstraint!
    @IBOutlet weak var timeLabel: UILabel!
    
    var countriesToRender: [CountriesViewModel] = [] {
        didSet {
            DispatchQueue.main.async {
                self.collectionView?.reloadData()
            }
        }
    }
    var data: Country? {
        didSet {
            if let data = data {
                timeLabel.text = convertUnixTimeToDateAndTime(unixTime: data.updated)
            }
        }
    }
    
    func refreshTableAfterCellExpansion() {
        self.tableView.beginUpdates()
        self.tableView.setNeedsDisplay()
        self.tableView.endUpdates()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.dataSource = self
        searchBar.searchTextField.backgroundColor = UIColor.white
        searchBar.searchTextField.layer.borderColor =  UIColor.gray.cgColor
        searchBar.searchTextField.layer.borderWidth = 0.8
        searchBar.searchTextField.layer.cornerRadius = 8
        allItemsToRender = self.realm.objects(AllCountiesResponse.self)
        allItemsToRender?.forEach { (Country) in
            countriesToRender.append(CountriesViewModel(image: #imageLiteral(resourceName: "cough"), title: "Cases", number: Country.cases))
            countriesToRender.append(CountriesViewModel(image: #imageLiteral(resourceName: "sore throat"), title: "Recovered", number: Country.recovered))
            countriesToRender.append(CountriesViewModel(image: #imageLiteral(resourceName: "vomit"), title: "Deaths", number: Country.deaths))
            print(countriesToRender)
        }
        self.initCollectionView()
    }
    
    func initCollectionView() {
        self.collectionView.scrollInterval = 3 //Step 2
        self.collectionViewFlowLayout.scrollDirection = .horizontal
        self.collectionViewFlowLayout.minimumInteritemSpacing = 50
        self.collectionViewFlowLayout.minimumLineSpacing = 50
        self.collectionView.startScrolling() //Step 3
    }
    
    func convertUnixTimeToDateAndTime(unixTime: Int) -> String {
        var localDate: String = ""
        let date = Date(timeIntervalSince1970: TimeInterval(unixTime))
        print(date)
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.short //Set time style
        dateFormatter.timeZone = .current
        if dateFormatter.calendar.isDateInToday(date) {
            localDate = "\(dateFormatter.string(from: date))" + " Today"
        }else if  dateFormatter.calendar.isDateInYesterday(date) {
            localDate = "\(dateFormatter.string(from: date))" + " Yesterday"
        }
        else {
            localDate = dateFormatter.string(from: date)
        }
        return localDate
    }
    
    @IBAction func searchButtonPressed(_ sender: Any) {
        if count == 1 {
            searchBarHeight.constant = 50
            searchBar.alpha = 1
            sortByDeathButton.alpha = 0
            sortByConfirmButton.alpha = 0
            sortByRecoveredButton.alpha = 0
            caseSortTopConstrain.constant = 0
            caseButtonHeightConstrain.constant = 0
            deathButtonTopConstrain.constant = 0
            deathButtonButtomConstrain.constant = 0
            recoveredButtonTopConstrain.constant = 0
            recoveredButtonHeightConstrain.constant = 0
            deathButtonHeightConstrain.constant = 0
            parentViewLeftConstrain.constant = 10
            parentView.layer.borderWidth = 0
            count = 0
        }else {
            searchBarHeight.constant = 0
            searchBar.alpha = 0
            count = 1
        }
        refreshTableAfterCellExpansion()
        
    }
    @IBAction func filterButtonPressed(_ sender: Any) {
        if count == 1 {
            searchBarHeight.constant = 0
            searchBar.alpha = 0
            sortByDeathButton.alpha = 1
            sortByConfirmButton.alpha = 1
            sortByRecoveredButton.alpha = 1
            caseSortTopConstrain.constant = 10
            deathButtonTopConstrain.constant = 10
            deathButtonButtomConstrain.constant = 10
            recoveredButtonTopConstrain.constant = 10
            caseButtonHeightConstrain.constant = 30
            recoveredButtonHeightConstrain.constant = 30
            deathButtonHeightConstrain.constant = 30
            parentViewLeftConstrain.constant = 20
            parentView.layer.borderWidth = 0.8
            parentView.layer.borderColor =  UIColor.gray.cgColor
            parentView.layer.cornerRadius = 8
            count = 0
        }else {
            sortByDeathButton.alpha = 0
            sortByConfirmButton.alpha = 0
            sortByRecoveredButton.alpha = 0
            caseSortTopConstrain.constant = 0
            deathButtonTopConstrain.constant = 0
            deathButtonButtomConstrain.constant = 0
            recoveredButtonTopConstrain.constant = 0
            caseButtonHeightConstrain.constant = 0
            recoveredButtonHeightConstrain.constant = 0
            deathButtonHeightConstrain.constant = 0
            count = 1
        }
        
        refreshTableAfterCellExpansion()
        
    }
   
    @IBAction func sortByComfirmedButtonPressed(_ sender: UIButton) {
        DispatchQueue.main.async {
            if self.isHighLighted == false{
                sender.setTitleColor(UIColor.colorFromHexString("#219653"), for: .normal)
                self.sortByRecoveredButton.setTitleColor(.lightGray, for: .normal)
                self.sortByDeathButton .setTitleColor(.lightGray, for: .normal)
                self.isHighLighted = true
            }else{
                sender.setTitleColor(.lightGray, for: .normal)
                self.isHighLighted = false
            }
        }
        
    }
    
    @IBAction func sortByRecoveredButtonPressed(_ sender: UIButton) {
        DispatchQueue.main.async {
            if self.isHighLighted == false{
                sender.setTitleColor(UIColor.colorFromHexString("#219653"), for: .normal)
                self.sortByConfirmButton.setTitleColor(.lightGray, for: .normal)
                self.sortByDeathButton .setTitleColor(.lightGray, for: .normal)
                self.isHighLighted = true
            }else{
                sender.setTitleColor(.lightGray, for: .normal)
                self.isHighLighted = false
            }
        }
    }
    @IBAction func sortByDeathButtonPressed(_ sender: UIButton) {
        DispatchQueue.main.async {
            if self.isHighLighted == false{
                sender.setTitleColor(UIColor.colorFromHexString("#219653"), for: .normal)
                self.sortByRecoveredButton.setTitleColor(.lightGray, for: .normal)
                self.sortByConfirmButton .setTitleColor(.lightGray, for: .normal)
                self.isHighLighted = true
            }else{
                sender.setTitleColor(.lightGray, for: .normal)
                self.isHighLighted = false
            }
        }
    }
}

extension HeaderTableViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        countriesToRender.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "slidercell", for: indexPath) as? SliderCollectionViewCell
        cell?.data = countriesToRender[indexPath.row]
        return cell!
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: self.collectionView.frame.size.width, height: self.collectionView.frame.size.height)
    }
    
}
