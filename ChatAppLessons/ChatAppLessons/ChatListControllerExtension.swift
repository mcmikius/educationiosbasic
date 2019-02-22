//
//  ChatListControllerExtension.swift
//  ChatAppLessons
//
//  Created by Michail Bondarenko on 2/21/19.
//  Copyright © 2019 Michail Bondarenko. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension ChatListTableViewController {
    
    func clearData() {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        if let context = appDelegate?.persistentContainer.viewContext {
            
            do {
                
                let entityNames = ["User", "Message"]
                
                for entityName in entityNames {
                    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
                    
                    let objects = try(context.fetch(fetchRequest)) as? [NSManagedObject]
                    
                    for object in objects! {
                        context.delete(object)
                    }
                }
                
                try(context.save())
                
                
            } catch let err {
                print(err)
            }
            
        }
    }
    
    func setupData() {
        
        clearData()
        
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        if let context = appDelegate?.persistentContainer.viewContext {
            
            let mark = NSEntityDescription.insertNewObject(forEntityName: "User", into: context) as! User
            mark.firstName = "Mark"
            mark.lastName = "Zuckerberg"
            mark.profileImageName = "zuckprofile"
            
            let message = NSEntityDescription.insertNewObject(forEntityName: "Message", into: context) as! Message
            message.user = mark
            message.text = "Hello, my name is Mark. Nice to meet you..."
            message.date = Date()
            
            let steve = NSEntityDescription.insertNewObject(forEntityName: "User", into: context) as! User
            steve.firstName = "Steve"
            steve.lastName = "Jobs"
            steve.profileImageName = "steve_profile"
            
            let messageSteve = NSEntityDescription.insertNewObject(forEntityName: "Message", into: context) as! Message
            messageSteve.user = steve
            messageSteve.text = "Apple creates great iOS Devices for the world..."
            messageSteve.date = Date()
            
            do {
                try(context.save())
            } catch let error {
                print(error)
            }
        }
        
        loadData()
        
    }
    
    func loadData() {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        if let context = appDelegate?.persistentContainer.viewContext {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Message")
            do {
                messages = try(context.fetch(fetchRequest)) as! [Message]
            } catch let error {
                print(error)
            }
            
        }
    }
    
}

