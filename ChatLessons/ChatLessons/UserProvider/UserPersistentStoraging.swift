//
//  UserPersistentStorageProtocol.swift
//  ChatLessons
//
//  Created by Michail Bondarenko on 3/14/19.
//  Copyright © 2019 Michail Bondarenko. All rights reserved.
//

import Foundation

protocol UserPersistentStoraging {
    func save(users: [UserViewObjectProtocol])
    func getCDUser() -> [UserModelStoraging]?
    func shouldFetchFromAPI() -> Bool
}

extension UserPersistentStoraging {
    func shouldFetchFromAPI() -> Bool {
        return getCDUser()?.isEmpty == false
    }
}

protocol UserModelStoraging {
    var name: String? { get set }
    var iconURL: String? { get set }
}

