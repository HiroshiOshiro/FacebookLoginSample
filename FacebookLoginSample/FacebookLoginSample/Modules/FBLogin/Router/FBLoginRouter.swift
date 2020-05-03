//
//  FBLoginRouter.swift
//  FacebookLoginSample
//
//  Created by hiroshi on 2020/05/02.
//  Copyright © 2019 hiroshi. All rights reserved.
//

import UIKit

class FBLoginRouter: FBLoginWireframe {
    weak var viewController: UIViewController?
    
    private init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    static func assembleModule() -> UIViewController {
        
        guard let view = R.storyboard.fbLogin.fbLoginViewController() else {
            return UIViewController()
        }
        
        let presenter = FBLoginPresenter()
        let interactor = FBLoginInteractor()
        let router = FBLoginRouter(viewController: view)
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        
        router.viewController = view
        
        return view
    }
}
