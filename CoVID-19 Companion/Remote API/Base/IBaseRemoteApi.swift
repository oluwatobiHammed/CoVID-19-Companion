//
//  IBaseRemoteApi.swift
//  CoVID-19 Companion
//
//  Created by Oladipupo Oluwatobi on 08/06/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
import RxSwift

protocol IBaseRemoteApi {
    //MARK: function for URLSession takes
    func makeAPIRequestObservable<T: Codable>(responseType: T.Type, url: URL, method: Method,params: [String : String]?) -> Observable<T>

}
