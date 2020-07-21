//
//  Country.swift
//  CoVID-19 Companion
//
//  Created by Oladipupo Oluwatobi on 08/06/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import RealmSwift
import Foundation
 @objcMembers class Country: Object, Codable {
     dynamic var updated: Int = 0
     dynamic var country: String?
     dynamic var countryInfo: CountryInfo?
     dynamic var cases: Int = 0
     dynamic var deaths: Int = 0
     dynamic var recovered: Int = 0
     dynamic var todayCases: Int = 0
     dynamic var todayDeaths: Int = 0
     dynamic var todayRecovered: Int = 0

}


@objcMembers class CountryInfo: Object, Codable {
    dynamic var flag: String?
}
