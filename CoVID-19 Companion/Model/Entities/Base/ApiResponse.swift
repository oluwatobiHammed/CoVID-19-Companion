//
//  ApiResponse.swift
//  CoVID-19 Companion
//
//  Created by Oladipupo Oluwatobi on 08/06/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
public struct ApiResponse<T: Codable>: Codable {
    public var data: T? = nil
    public var error: ApiError? = nil
}
