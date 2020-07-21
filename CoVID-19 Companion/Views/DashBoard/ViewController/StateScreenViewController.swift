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

    fileprivate let realm = try! Realm()
    var itemsToRender: Results<Country>?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        itemsToRender = self.realm.objects(Country.self)
        //print(itemsToRender?.count)
        //tableView.rowHeight = UITableView.automaticDimension
    }
    
 
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
        
      
    }
    
}

extension StateScreenViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else {
            if let itemsToRender = itemsToRender {
                return  itemsToRender.count
            }
            else {
                return 1
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "headercell", for: indexPath) as? HeaderTableViewCell
            cell?.data = itemsToRender?[indexPath.row]
            cell?.tableView = tableView
            cell?.selectionStyle = .none
            cell?.layoutIfNeeded()
            return cell!
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "globalcell", for: indexPath) as? GlobalTableViewCell
        cell?.data = itemsToRender?[indexPath.row]
        cell?.selectionStyle = .none
        return cell!
        
        
    }
    
    
}


