//
//  CountriesViewModel.swift
//  CoVID-19 Companion
//
//  Created by Oladipupo Oluwatobi on 11/07/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

//class CountriesViewModel:  ICountriesViewModel {
//  
////    var coutriesResponse: PublishSubject<[Country]> = PublishSubject()
////    let coutriesRespo: ICountriesRemote
////    
////    init(coutriesRespo: ICountriesRemote) {
////        self.coutriesRespo = coutriesRespo
////    }
////    func coutriesRespond() {
////        coutriesRespo.getCountries().subscribe(onNext: {  [weak self] res in
////            <#code#>
////        }, onError: <#T##((Error) -> Void)?##((Error) -> Void)?##(Error) -> Void#>, onCompleted: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>, onDisposed: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>)
////       }
//   
//    
////    func matchRespond() {
////        matchRespo.getMatch().subscribe(onNext: { [weak self] res in
////            if let res = res.data?.results {
////                var matches:[Matches] = []
////                var sections = [FixtureSection]()
////                for match in res {
////                    matches.append(match)
////                    let groups = Dictionary(grouping: matches, by: {
////                        match in
////                        dateToDay(match.utcDate!)
////                    })
////                    sections = groups.map(FixtureSection.init).sorted(by: { $0.title < $1.title })
////                    //print("This is the sections", sections)
////
////                }
////                 self?.matchResponse.onNext(sections)
////
////
////            }
////            else if let apiErr = res.error {
////                self?.apiError.onNext(apiErr)
////            }
////        },
////      onError: { [weak self] error in
////                    self?.isLoading.onNext(false)
////                    self?.throwableError.onNext(error)
////             }).disposed(by: disposeBag)
////    }
//}
