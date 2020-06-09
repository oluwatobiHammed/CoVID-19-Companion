//
//  BaseViewModel.swift
//  CoVID-19 Companion
//
//  Created by Oladipupo Oluwatobi on 08/06/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
import RxSwift

class BaseViewModel {
    
    let disposeBag = DisposeBag()
    let apiError: PublishSubject<ApiError> = PublishSubject()
    let throwableError: PublishSubject<Error> = PublishSubject()
   
    
    func viewDidLoad() { }
    
    func viewWillAppear() { }
    
    func viewDidAppear() { }
    
    func viewWillDisappear() { }
    
    func viewDidDisappear() { }
    
}
