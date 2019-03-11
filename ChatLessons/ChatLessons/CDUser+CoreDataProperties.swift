//
//  CDUser+CoreDataProperties.swift
//  ChatLessons
//
//  Created by Michail Bondarenko on 3/11/19.
//  Copyright © 2019 Michail Bondarenko. All rights reserved.
//
//

import Foundation
import CoreData


extension CDUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDUser> {
        return NSFetchRequest<CDUser>(entityName: "CDUser")
    }

    @NSManaged public var iconURL: String?
    @NSManaged public var name: String?

}
