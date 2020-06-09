//
//  DecodableExtension.swift
//  CoVID-19 Companion
//
//  Created by Oladipupo Oluwatobi on 08/06/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
extension Decodable {
    ///Maps JSON String to actual Decodable Object
    ///throws an exception if mapping fails
    static func mapTo(jsonString: String) throws -> Self? {
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy  = .iso8601
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(Self.self, from: Data(jsonString.utf8))
    }
}
