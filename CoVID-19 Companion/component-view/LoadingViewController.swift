//
//  LoadingViewController.swift
//  CoVID-19 Companion
//
//  Created by Oladipupo Oluwatobi on 08/06/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class LoadingViewController: UIViewController, OverlayViewController, ViewControllerPresentedDidDisappear {
    var navigationBarIsHidden = true
    @IBOutlet weak var mainTitleLabel: UILabel?
    @IBOutlet weak var subTitleLabel: UILabel?
    @IBOutlet weak var activity: UIActivityIndicatorView?
    var mainTitle: String?
    var subTitle: String?
    var didRemoveViewControllerSubject: PublishSubject<Any?>?
    var viewControllerWillDisappearData: Any?
    
    deinit {
        print("Destroying LoadingViewController")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTitleLabel?.text = mainTitle
        subTitleLabel?.text = subTitle
        self.mainTitleLabel?.useCaptionFont(by: 3)
        subTitleLabel?.useDefaultFont(by: 1.8)
        activity?.color = ThemeManager.currentTheme().mainColor
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//        if self.isMovingFromParentViewController {
//            self.onRemovingFromParent()
//        }
    }
    
    
    func dismissController() {
        self.removeFromFCMBParent()
        self.onRemovingFromParent()
    }
    
    class func showViewController(_ parent: UIViewController, mainTitle: String? = nil, subTitle: String? = nil)-> UIViewController {
        let controller = StoryBoardsID.boardOnBoarding.get(for: .onboarding__creatingModal)!
        if let controller = controller as? LoadingViewController {
            controller.mainTitle = mainTitle
            controller.subTitle = subTitle
        }
        parent.addToParent(controller, slideFrom: nil, duration: 0.5)
        return controller
    }
    
    class func showViewController(mainTitle: String? = nil, subTitle: String? = nil)-> ViewControllerPresentRequest {
        let controller = StoryBoardsID.boardOnBoarding.get(for: .onboarding__creatingModal)!
        if let controller = controller as? LoadingViewController {
            controller.mainTitle = mainTitle
            controller.subTitle = subTitle
        }
        let request = ViewControllerPresentRequest(mode: .addToParent, viewController: controller)
        ViewControllerPresenter.shared.presentViewController(request: request)
        return request
    }
}

