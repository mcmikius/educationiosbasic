//
//  RealmUserPersistentStorage.swift
//  ChatLessons
//
//  Created by Michail Bondarenko on 3/14/19.
//  Copyright © 2019 Michail Bondarenko. All rights reserved.
//

import Foundation
import RealmSwift

struct RealmWrapper {
    private let queue = DispatchQueue(label: "realm_queue")
    
    func execute(block: () -> Void) {
        queue.sync(execute: block)
    }
}

struct RealmUserPersistentStorage: UserPersistentStoraging {
    
    
    let wrapper = RealmWrapper()
    func save(users: [UserViewObjectProtocol]) {
        let realm = try? Realm()
        wrapper.execute {
            do {
                let serializedUsers: [RealmUser] = users.compactMap {
                    let realmUser = RealmUser()
                    realmUser.name = $0.name
                    realmUser.iconURL = $0.iconURL
                    return realmUser
                }
                try realm?.write {
                    serializedUsers.forEach {
                        realm?.add($0)
                    }
                }
            } catch {
                print(error)
            }
        }
    }
    
    func getCDUser() -> [UserModelStoraging]? {
        let realm = try? Realm()
        if let result = realm?.objects(RealmUser.self) {
            return Array(result)
        } else {
            return nil
        }
        
    }
}
