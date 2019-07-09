//
//  FBLoginPresenter.swift
//  FacebookLoginSample
//
//  Created by hiroshi on 2019/07/07.
//  Copyright © 2019 hiroshi. All rights reserved.
//

import Foundation

class FBLoginPresenter: FBLoginPresentation {
    
    weak var view: FBLoginView?
    var interactor: FBLoginUseCase!
    var router: FBLoginWireframe!
    
    var user: User? {
        didSet {
            if let user = user {
                view?.showUserDetail(user: user)
            } else {
                view?.hideUserDetail()
            }
        }
    }
    
    func viewDidLoad() {
        self.user = nil
        interactor.getUser()
    }
    
    func loginSucceeded() {
        interactor.getUser()
    }
    
    func logoutSucceeded() {
        if let user = self.user {
            interactor.deleteUser(user: user)
            gotUser(user: nil)
        }
    }
}

extension FBLoginPresenter: FBLoginInteractorOutput {
    func gotUser(user: User?) {
        self.user = user
    }
}

