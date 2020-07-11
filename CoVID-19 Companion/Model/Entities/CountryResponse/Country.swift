//
//  Country.swift
//  CoVID-19 Companion
//
//  Created by Oladipupo Oluwatobi on 08/06/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation

struct Country: Codable, Equatable {
    let country: String?
    let countryInfo: flag?
}


struct flag: Codable, Equatable {
    let flag: String?
}
