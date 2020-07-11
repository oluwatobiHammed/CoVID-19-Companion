//
//  ICountriesViewModel.swift
//  CoVID-19 Companion
//
//  Created by Oladipupo Oluwatobi on 11/07/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
import RxSwift

protocol ICountriesViewModel {
    var coutriesResponse: PublishSubject<[Country]> { get }
    func coutriesRespond()
}
