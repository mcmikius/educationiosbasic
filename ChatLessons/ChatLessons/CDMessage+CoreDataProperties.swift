//
//  CDMessage+CoreDataProperties.swift
//  ChatLessons
//
//  Created by Michail Bondarenko on 3/11/19.
//  Copyright © 2019 Michail Bondarenko. All rights reserved.
//
//

import Foundation
import CoreData


extension CDMessage {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDMessage> {
        return NSFetchRequest<CDMessage>(entityName: "CDMessage")
    }

    @NSManaged public var text: String?
    @NSManaged public var receiver: CDUser?
    @NSManaged public var sender: CDUser?

}
