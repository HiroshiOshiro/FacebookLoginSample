//
//  UserInfo.swift
//  FacebookLoginSample
//
//  Created by hiroshi on 2019/07/07.
//  Copyright © 2019 hiroshi. All rights reserved.
//

import RealmSwift

class User: Object {
    @objc dynamic var id: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var email: String = ""
    @objc dynamic var birthDay: String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
