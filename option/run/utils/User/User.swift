//
//  User.swift
//  VirtualCoins
//
//  Created by 任超 on 2018/5/11.
//  Copyright © 2018年 Abyss. All rights reserved.
//

import UIKit
import DefaultsKit
import SwiftyJSON

public struct User: Codable, Userable {
    var rawData: JSON?
    var token: String = ""
    {
        didSet
        {
            let defaults = Defaults()
            let key = Key<String>("token")
            
            defaults.set(token, for: key)
        }
    }

    func save() { User.save(self) }
}

public protocol Userable {
    static func latest() -> User?
    static func islogin() -> Bool
    static func token() -> String!
    static func save(_ user: User)
}

public extension Userable {
    
    static func latest() -> User? {
        let defaults = Defaults()
        let key = Key<User>("latest")
        
        if defaults.has(key) {
            return defaults.get(for: key)
        } else {
            return nil
        }
    }
    
    static func islogin() -> Bool {
        return User.token().count > 0
    }
    
    
    static func token() -> String! {
        let defaults = Defaults()
        let key = Key<String>("token")
        
        if defaults.has(key) {
            return defaults.get(for: key) ?? ""
        } else {
            return ""
        }
    }
    
    static func save(_ user: User) {
        let defaults = Defaults()
        let key = Key<User>("latest")
        
        defaults.set(user, for: key)
    }
}
