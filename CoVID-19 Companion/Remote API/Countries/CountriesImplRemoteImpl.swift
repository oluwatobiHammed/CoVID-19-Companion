//
//  CountryImplRemoteImpl.swift
//  CoVID-19 Companion
//
//  Created by Oladipupo Oluwatobi on 08/06/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class CountriesImplRemoteImpl: ICountriesRemote {
       static var shared = CountriesImplRemoteImpl()
        lazy var requestObservable = BaseRemoteApiImpl(config: .default)
    func getCountries() -> Observable<ApiResponse<[Country]>> {
        return requestObservable.makeAPIRequestObservable(responseType: ApiResponse<[Country]>.self, url:RemoteApiConstants.Endpoints.getCountries.url, method: .Get, params: [:])
        }
    
}
