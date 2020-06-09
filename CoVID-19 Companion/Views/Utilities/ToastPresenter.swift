//
//  ToastPresenter.swift
//  CoVID-19 Companion
//
//  Created by Oladipupo Oluwatobi on 08/06/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
import Toast_Swift

class ToastMessageRequest {
    var message: String? = nil
    var duration: TimeInterval = ToastManager.shared.duration
    var position: ToastPosition = ToastManager.shared.position
    var title: String? = nil
    var image: UIImage? = nil
    var style: ToastStyle = ToastManager.shared.style
    var completion: ((_ didTap: Bool) -> Void)? = nil
    fileprivate init() {}
    static func instance()-> ToastMessageRequest {
        return ToastMessageRequest()
    }
    
    static func make(message: String)-> ToastMessageRequest {
        let request = ToastMessageRequest.instance()
        request.message = message
        return request
    }
    
    func present() {
        ToastPresenter.makeToast(request: self)
    }
}

class ToastPresenter {
    static let NOTIF_NAME_SHOW_TOAST = Notification.Name("LoadingBanks")
    class func makeToast(request: ToastMessageRequest) {
        NotificationCenter.default.post(name: ToastPresenter.NOTIF_NAME_SHOW_TOAST, object: nil, userInfo: ["payload": request])
    }
}
