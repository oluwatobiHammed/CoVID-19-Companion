//
//  NetErrorResponse.swift
//  CoVID-19 Companion
//
//  Created by Oladipupo Oluwatobi on 08/06/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
import ObjectMapper

class NetError: NSObject, Mappable {
    var message: String?
    var code: Int?
    
    
    init(message: String) {
        super.init()
        self.message = message
    }
    required init?(map: Map) {
        super.init()
    }
    
    // Mappable
    func mapping(map: Map) {
        message     <- map["message"]
        code     <- map["code"]
    }
    
}

class TranslatedNetError: Error {
    var errors: [ErrorMessage] = []
    var defaultMessage: String?
    init(errors: [ErrorMessage]) {
        self.errors = errors
    }
    
    func getMessage(defaultMessage: String?)-> String? {
        var messageText: String? = ""
        let messages = self.errors.filter { (error) -> Bool in
            return error.message != nil
            }.map { (error) -> String in
                return error.message!
        }
        if messages.count > 0 {
            messageText = messages.joined(separator: ", ")
        }
        else {
            messageText = defaultMessage ?? self.defaultMessage
        }
        return messageText
    }
}
