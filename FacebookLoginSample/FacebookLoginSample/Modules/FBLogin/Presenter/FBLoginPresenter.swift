//
//  FBLoginPresenter.swift
//  FacebookLoginSample
//
//  Created by hiroshi on 2020/05/02.
//  Copyright © 2019 hiroshi. All rights reserved.
//

import Foundation

class FBLoginPresenter: FBLoginPresentation {
    
    weak var view: FBLoginView?
    var interactor: FBLoginUseCase!
    var router: FBLoginWireframe!
    
    func viewDidLoad() {
        self.view?.hideUserDetail()
        interactor.getUser()
    }
    
    func loginSucceeded() {
        interactor.getUser()
    }
    
    func logoutSucceeded() {
        interactor.deleteUser()
        gotUser(user: nil)
    }
}

extension FBLoginPresenter: FBLoginInteractorOutput {
    func gotUser(user: User?) {
        if let user = user {
            self.view?.showUserDetail(user: user)
        } else {
            self.view?.hideUserDetail()
        }
    }
}

