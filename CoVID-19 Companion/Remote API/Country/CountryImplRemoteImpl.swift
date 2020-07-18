//
//  Country.swift
//  CoVID-19 Companion
//
//  Created by Oladipupo Oluwatobi on 11/07/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class CountryImplRemoteImpl: ICountryRemote {
        static var shared = CountryImplRemoteImpl()
        lazy var requestObservable = BaseRemoteApiImpl(config: .default)
    func getCountry() -> Observable<ApiResponse<AllCountiesResponse>> {
        return requestObservable.makeAPIRequestObservable(responseType: ApiResponse<AllCountiesResponse>.self, url:RemoteApiConstants.Endpoints.getCountry.url, method: .Get, params: [:])
        }
    
}
