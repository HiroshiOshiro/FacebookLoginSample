//
//  RootRouter.swift
//  FacebookLoginSample
//
//  Created by hiroshi on 2020/05/03.
//  Copyright © 2019 hiroshi. All rights reserved.
//

import UIKit

class RootRouter: RootWireframe {
    func presentFBLoginScreen(in window: UIWindow) {
        window.makeKeyAndVisible()
        window.rootViewController = FBLoginRouter.assembleModule()
    }
}
