//
//  BaseRemoteApiImpl.swift
//  CoVID-19 Companion
//
//  Created by Oladipupo Oluwatobi on 08/06/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
import RxSwift

enum Method: String {
    case Get
    case Post
    case Put
    case Delete
}



public class BaseRemoteApiImpl: IBaseRemoteApi {
    private lazy var jsonEncoder = JSONEncoder()
    //private let apiKey = "be8f742bc8e144648c79305c47e60eae"
    private var urlSession: URLSession
    public init(config:URLSessionConfiguration) {
        urlSession = URLSession(configuration:
            URLSessionConfiguration.default)
    }
    func makeAPIRequestObservable<T>(responseType: T.Type, url: URL, method: Method = .Get,params: [String : String]?) -> Observable<T> where T : Codable {
        var request = URLRequest(url:url)
        //request.addValue(apiKey, forHTTPHeaderField: "X-Auth-Token")
        request.httpMethod = method.rawValue.uppercased()
        switch method {
        case .Get:
            print("No body need ")
        case .Post:
            request.httpBody =  try? jsonEncoder.encode(params)
        case .Put:
            print("No body need ")
        case .Delete:
            print("No body need ")
        }
        
        //MARK: creating our observable
        return urlSession.rx.response(request: request)
            .debug()
            .flatMap { (response, responseString) -> Observable<T> in
                let responseData = String(data: responseString, encoding: String.Encoding.iso2022JP)
                do {
                    //check if the `responseString` contains the `errors` key, create a new json string with key `error`
                    //otherwise, create a new json string with key `data`
                    
                    let jsonString = (responseData?.localizedCaseInsensitiveContains("errors"))! ? try self.getJsonString(withKey: "error", forValue: responseData!) : try self.getJsonString(withKey: "data", forValue: responseData!)
                    
                    //map the result of `jsonString` above to the `responseType`
                    let requestResponse = try responseType.mapTo(jsonString: jsonString)!
                    return Observable.just(requestResponse)
                    
                }
                catch let error as NSError {
                    throw error
                }
        }
    }
    
    
    
    fileprivate func getJsonString(withKey: String, forValue: String) throws -> String {
        let jsonStringDictionary = "{\"\(withKey)\": \(forValue)}"
        return jsonStringDictionary
    }
}



    
   





