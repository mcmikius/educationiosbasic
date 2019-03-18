//
//  CoreDataUserPersistentStorage.swift
//  ChatLessons
//
//  Created by Michail Bondarenko on 3/14/19.
//  Copyright © 2019 Michail Bondarenko. All rights reserved.
//

import Foundation
import CoreData



struct CoreDataUserPersistentStorage: UserPersistentStoraging {
    
    
    
    private let coreData: CoreDataStack!
    init(coreData: CoreDataStack) {
        self.coreData = coreData
    }
    
    func save(users: [UserViewObjectProtocol]) {
        let cdUsers: [NSManagedObject] = users.map {
            let entity = NSEntityDescription.entity(forEntityName: "CDUser", in: coreData.context)!
            let object = NSManagedObject.init(entity: entity, insertInto: coreData.context)
            object.setValue($0.iconURL, forKey: "iconURL")
            object.setValue($0.name, forKey: "name")
            return object
        }
        print(cdUsers)
        coreData.saveContext()
    }
    
    func getCDUser() -> [UserModelStoraging]? {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: String(describing: CDUser.self))
        let users = try? coreData.context.fetch(request) as? [UserModelStoraging]
        return users ?? nil
    }
}
