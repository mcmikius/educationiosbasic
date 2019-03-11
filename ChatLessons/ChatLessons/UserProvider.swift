//
//  UserProvider.swift
//  ChatLessons
//
//  Created by Michail Bondarenko on 2/18/19.
//  Copyright © 2019 Michail Bondarenko. All rights reserved.
//

import Foundation
import ReactiveKit
import CoreData

struct UserProvider {
    
    private let coreData: CoreDataStack!
    
    init(coreDataStack: CoreDataStack) {
        self.coreData = coreDataStack
    }
    
    func shouldFetchFromAPI() -> Bool {
        
        return false
    }
    
    func save(users: [UserViewObjectProtocol]) {
        let cdUsers: [NSManagedObject] = users.map {
            let entity = NSEntityDescription.entity(forEntityName: "CDUser", in: coreData.context)!
            let object = NSManagedObject.init(entity: entity, insertInto: coreData.context)
            object.setValue($0.iconUrl, forKey: "iconURL")
            object.setValue($0.name, forKey: "name")
            return object
        }
        print(cdUsers)
        coreData.saveContext()
    }
    
    func getCDUser() -> [CDUser]? {
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: String(describing: CDUser.self))
        let users = try? coreData.context.fetch(request) as? [CDUser]
        return users ?? nil
    }
    
    func getUsers(_ completion: @escaping ([UserModel]) -> Void) {
        
        //url
        //request (get, body, parametrs)
        //fetch data from API
        
        let result =  [UserModel(), UserModel()]
        completion(result)
    }
    
    func getMessages(for userId: String) -> Signal<[Message], NSError> {
        return Signal { observer in
            
            observer.next([])
            observer.failed(NSError(domain: "debug", code: 400, userInfo: nil))
            observer.completed()
            
            return BlockDisposable { }
        }
    }
    
    func post(message: Message) {
        
    }
}
