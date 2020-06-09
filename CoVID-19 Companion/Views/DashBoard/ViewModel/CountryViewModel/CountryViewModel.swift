//
//  CountryViewModel.swift
//  CoVID-19 Companion
//
//  Created by Oladipupo Oluwatobi on 08/06/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
import RxSwift

class CountryViewModel: BaseViewModel,ICountryViewModel  {
    var countryResponse: PublishSubject<Country> = PublishSubject()
    
    
    let countryRepo: ICountryRemote
    
    init(countryRepo: ICountryRemote) {
        self.countryRepo = countryRepo
    }
    
    func countryResponse(countryName: String) {
        countryRepo.getCountry(query: countryName).subscribe(onNext: { (res) in
            if let res = res.data {
                self.countryResponse.onNext(res)
            }
             else if let apiErr = res.error {
                            self.apiError.onNext(apiErr)
                        }
        }, onError: { (error) in
            self.throwableError.onNext(error)
        }).disposed(by: disposeBag)
      }
    
}
