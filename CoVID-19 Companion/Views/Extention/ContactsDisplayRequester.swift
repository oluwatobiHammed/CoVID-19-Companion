//
//  ContactsDisplayRequester.swift
//  CoVID-19 Companion
//
//  Created by Oladipupo Oluwatobi on 08/06/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
import RxSwift

class ContactsDisplayRequester {
    fileprivate var requestSubject = PublishSubject<UIViewController>()
    
    static let shared = ContactsDisplayRequester()
    
    var showContactsObserver: Observable<UIViewController> {
        return requestSubject.asObserver()
    }
    
    fileprivate init() {}
    
    func requestPresentController(viewController: UIViewController) {
        self.requestSubject.onNext(viewController)
    }
}
