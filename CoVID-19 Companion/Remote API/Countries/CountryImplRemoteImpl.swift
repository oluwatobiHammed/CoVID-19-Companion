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

class MatchImplRemoteImpl: ICountryRemote {

        lazy var requestObservable = BaseRemoteApiImpl(config: .default)
    func getCountry(query: String) -> Observable<ApiResponse<Country>> {
        return requestObservable.makeAPIRequestObservable(responseType: ApiResponse<Country>.self, url:RemoteApiConstants.Endpoints.getCountry(query).url, method: .Get, params: [:])
        }
    
}
