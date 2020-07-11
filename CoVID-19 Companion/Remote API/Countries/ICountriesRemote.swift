//
//  ICountryRemote.swift
//  CoVID-19 Companion
//
//  Created by Oladipupo Oluwatobi on 08/06/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
import RxSwift

 protocol ICountriesRemote {
    func getCountries() -> Observable<ApiResponse<[Country]>>
}
