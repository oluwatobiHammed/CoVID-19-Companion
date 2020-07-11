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

class StateScreenViewController: Covid_19CompanionViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var countryViewModel: ICountryViewModel?
    var validateDisposable: Disposable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //registerRows()
        //loadData()
    }
    
//    func loadData (){
//        currentLoadingModal = LoadingViewController.showViewController(self, mainTitle: "Loading....", subTitle: "please wait....")
//        countryViewModel?.countryResponse(countryName: "Nigeria")
//        validateDisposable = countryViewModel?.countryResponse.subscribe(onNext: { (country) in
//            self.dismissCurrentLoadingModal()
//            print(country)
//
//        }, onError: { (error) in
//            self.dismissCurrentLoadingModal()
//            self.showTransactioErrorMessage(error: error, title: "Failure", defaultMessage: "Unable to get the data at the moment, please try again")
//        }, onCompleted: {
//
//        })
//
//    }
//    private func registerRows() {
//        let LabelsTableViewCellNib = UINib(nibName: "LabelsTableViewCell", bundle: nil)
//        self.tableView.register(LabelsTableViewCellNib, forCellReuseIdentifier: String(describing: LabelsTableViewCell.self))
//        
//    }
    
    
}

//extension StateScreenViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//    }
//
//
//}
