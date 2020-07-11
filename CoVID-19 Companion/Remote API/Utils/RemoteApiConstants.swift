//
//  RemoteApiConstants.swift
//  CoVID-19 Companion
//
//  Created by Oladipupo Oluwatobi on 08/06/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation

class RemoteApiConstants {
    
    enum Endpoints {
        static let base = "https://disease.sh/v3"
        case getCountries
        case getCountry(String)
        
        
        var stringValue: String {
            switch self {
                
            case .getCountry(let query):
                return     Endpoints.base + "/countries/\(query)"
            case .getCountries:
                return     Endpoints.base + "/covid-19/countries"
            }
        }
        
        var url: URL {
            return (URL(string: stringValue))!
        }
    }
    
}

