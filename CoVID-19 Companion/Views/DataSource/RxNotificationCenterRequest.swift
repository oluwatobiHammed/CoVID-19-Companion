//
//  RxNotificationCenterRequest.swift
//  CoVID-19 Companion
//
//  Created by Oladipupo Oluwatobi on 08/06/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class RxNotificationCenterRequest {
    
    fileprivate static var instance: RxNotificationCenterRequest?
    
    static var shared: RxNotificationCenterRequest {
        if let insta = instance {
            return insta
        }
        instance = RxNotificationCenterRequest()
        return instance!
    }
    
    fileprivate var shareNotificationSubject: PublishSubject<[Any]?>?
    
    var shareNotification:Observable<[Any]?> {
        guard shareNotificationSubject != nil else {
            shareNotificationSubject = PublishSubject<[Any]?>()
            return shareNotificationSubject!.asObserver()
        }
        return shareNotificationSubject!.asObserver()
    }
    
    fileprivate init() {
        
    }
    
    func sendShareNotification(data: [Any]?) {
        self.shareNotificationSubject?.onNext(data)
    }
    

    
}

