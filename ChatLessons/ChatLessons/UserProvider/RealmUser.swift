//
//  RealmUser.swift
//  ChatLessons
//
//  Created by Michail Bondarenko on 3/14/19.
//  Copyright © 2019 Michail Bondarenko. All rights reserved.
//

import Foundation
import RealmSwift

class RealmUser: Object, UserModelStoraging {
    @objc dynamic var name: String?
    @objc dynamic var iconURL: String?
    
}
