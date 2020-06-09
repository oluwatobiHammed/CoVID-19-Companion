//
//  ApiError.swift
//  DynamicTableViewRowsDemo
//
//  Created by Oladipupo Oluwatobi on 08/06/2020.
//  Copyright © 2020 leapfrog. All rights reserved.
//

import Foundation

public struct ApiError: Codable {
    public let errors: [ErrorMessage]
    public let statusCode: CLong
}
