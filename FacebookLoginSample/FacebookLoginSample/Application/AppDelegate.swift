//
//  AppDelegate.swift
//  FacebookLoginSample
//
//  Created by hiroshi on 2020/05/02.
//  Copyright © 2019 hiroshi. All rights reserved.
//

import UIKit
import FacebookCore
import FBSDKCoreKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FBSDKCoreKit.ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        RootRouter().presentFBLoginScreen(in: window!)
        return true
    }
}

