//
//  FBLoginInteractor.swift
//  FacebookLoginSample
//
//  Created by hiroshi on 2020/05/02.
//  Copyright © 2019 hiroshi. All rights reserved.
//

import Foundation
import RealmSwift
import FBSDKCoreKit

class FBLoginInteractor {
    weak var output: FBLoginInteractorOutput?
}

extension FBLoginInteractor: FBLoginUseCase {
    func getUser() {
        if AccessToken.current == nil {
            self.output?.gotUser(user: nil)
        }
        
        let request = GraphRequest(graphPath: "/me",
                                   parameters: ["fields": "\(FBParameters.id.rawValue), \(FBParameters.name.rawValue), \(FBParameters.email.rawValue), \(FBParameters.birthday.rawValue)"],
                                   httpMethod: .get)
        request.start { [weak self] _, result, error in
            print(result.debugDescription)
            switch (result, error) {
            case let (result?, nil):
                guard let response = result as? [String: Any] else { return }
                let user = User()
                user.id = response[FBParameters.id.rawValue] as! String
                user.name = response[FBParameters.name.rawValue] as! String
                user.email = response[FBParameters.email.rawValue] as! String
                user.birthDay = response[FBParameters.birthday.rawValue] as! String
                
                self?.saveUser(user: user)
                self?.output?.gotUser(user: user)
            case let (nil, error?):
                print("Facebook Graph Request Failed: \(error)")
            case (_, _):
                print("Facebook Graph Request Failed: unknown error")
            }
        }
    }
    
    internal func saveUser(user: User) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(user, update: .all)
        }
    }
    
    func deleteUser() {
        let realm = try! Realm()
        try! realm.write {
            realm.delete(realm.objects(User.self))
        }
    }
}


