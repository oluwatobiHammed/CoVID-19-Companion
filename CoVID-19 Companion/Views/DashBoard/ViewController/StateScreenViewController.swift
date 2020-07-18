//
//  StateScreenViewController.swift
//  CoVID-19 Companion
//
//  Created by Oladipupo Oluwatobi on 08/06/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RealmSwift

class StateScreenViewController: Covid_19CompanionViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: BJAutoScrollingCollectionView!
    @IBOutlet weak var collectionViewFlowLayout: UICollectionViewFlowLayout!
    var countryViewModel: ICountryViewModel?
    var timer:Timer? = nil
    var validateDisposable: Disposable?
    fileprivate let realm = try! Realm()
    var itemsToRender: Results<Country>?
    var allItemsToRender: Results<AllCountiesResponse>?
    var countriesToRender: [CountriesViewModel] = [] {
            didSet {
                DispatchQueue.main.async {
                    self.collectionView?.reloadData()
                }
            }
        }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        collectionView.dataSource = self
        itemsToRender = self.realm.objects(Country.self)
        itemsToRender?.forEach { (Country) in
            //print(Country)
        }
        allItemsToRender = self.realm.objects(AllCountiesResponse.self)
              //countriesToRender.removeAll()
              allItemsToRender?.forEach { (Country) in
                countriesToRender.append(CountriesViewModel(image: #imageLiteral(resourceName: "casesImage"), title: "Cases", number: Country.cases))
                countriesToRender.append(CountriesViewModel(image: #imageLiteral(resourceName: "casesImage"), title: "Recovered", number: Country.recovered))
                countriesToRender.append(CountriesViewModel(image: #imageLiteral(resourceName: "casesImage"), title: "Deaths", number: Country.deaths))
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
    
 
    
    
}

extension StateScreenViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let itemsToRender = itemsToRender {
            return  itemsToRender.count
        }else {
            return 1
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "globalcell", for: indexPath) as? GlobalTableViewCell
        cell?.data = itemsToRender?[indexPath.row]
        cell?.selectionStyle = .none
        return cell!
    }


}

extension StateScreenViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
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
