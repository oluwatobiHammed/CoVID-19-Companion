//
//  AllCountiesResponse.swift
//  CoVID-19 Companion
//
//  Created by Oladipupo Oluwatobi on 16/07/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//


import RealmSwift
import Foundation
 @objcMembers class AllCountiesResponse: Object, Codable {
     dynamic var cases: Int = 0
     dynamic var deaths: Int = 0
     dynamic var recovered: Int = 0
}



