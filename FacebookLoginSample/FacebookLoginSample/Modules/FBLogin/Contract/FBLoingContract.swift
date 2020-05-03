//
//  FBLoingContract.swift
//  FacebookLoginSample
//
//  Created by hiroshi on 2020/05/02.
//  Copyright © 2019 hiroshi. All rights reserved.
//

import UIKit

protocol FBLoginView: class {
    func showUserDetail(user: User)
    func hideUserDetail()
}

protocol FBLoginPresentation: class {
    var view: FBLoginView? { get set }
    var interactor: FBLoginUseCase! { get set }
    var router: FBLoginWireframe! { get set }
    
    func viewDidLoad()
    func loginSucceeded()
    func logoutSucceeded()
}

protocol FBLoginUseCase: class {
    func getUser()
    func saveUser(user: User)
    func deleteUser(user: User)
}

protocol FBLoginInteractorOutput: class {
    func gotUser(user: User?)
}

protocol FBLoginWireframe: class {
    var viewController: UIViewController? { get set }
    static func assembleModule() -> UIViewController
}
