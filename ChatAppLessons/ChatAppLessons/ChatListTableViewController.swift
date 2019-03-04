//
//  ChatListTableViewController.swift
//  ChatAppLessons
//
//  Created by Michail Bondarenko on 2/21/19.
//  Copyright © 2019 Michail Bondarenko. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class ChatListTableViewController: UITableViewController {
    private let chatListCell = "ChatListCell"
    var messages: [Message]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupData()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = messages?.count {
            return count
        }
        return 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: chatListCell, for: indexPath) as! ChatListTableViewCell
        
        if let message = messages?[indexPath.row] {
            cell.message = message
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "ShowChatRoom", sender: self)
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    

     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let viewController = segue.destination as? ChatRoomTableViewController else { return }
     }

    
}

extension ChatListTableViewController {
    
    func clearData() {
        let delegate = UIApplication.shared.delegate as? AppDelegate
        
        if let context = delegate?.persistentContainer.viewContext {
            
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
        
        let delegate = UIApplication.shared.delegate as? AppDelegate
        
        if let context = delegate?.persistentContainer.viewContext {
            
            let mark = NSEntityDescription.insertNewObject(forEntityName: "User", into: context) as! User
            mark.name = "Mark Zuckerberg"
            mark.profileImageName = "zuckprofile"
            
            let message = NSEntityDescription.insertNewObject(forEntityName: "Message", into: context) as! Message
            message.user = mark
            message.text = "Hello, my name is Mark. Nice to meet you..."
            message.date = Date()
            
            createSteveMessagesWithContext(context: context)
            
            let donald = NSEntityDescription.insertNewObject(forEntityName: "User", into: context) as! User
            donald.name = "Donald Trump"
            donald.profileImageName = "donald_trump_profile"
            
            ChatListTableViewController.createMessageWithText(text: "You're fired", user: donald, minutesAgo: 5, context: context)
            
            let gandhi = NSEntityDescription.insertNewObject(forEntityName: "User", into: context) as! User
            gandhi.name = "Mahatma Gandhi"
            gandhi.profileImageName = "gandhi"
            
            ChatListTableViewController.createMessageWithText(text: "Love, Peace, and Joy", user: gandhi, minutesAgo: 60 * 24, context: context)
            
            let hillary = NSEntityDescription.insertNewObject(forEntityName: "User", into: context) as! User
            hillary.name = "Hillary Clinton"
            hillary.profileImageName = "hillary_profile"
            
            ChatListTableViewController.createMessageWithText(text: "Please vote for me, you did for Billy!", user: hillary, minutesAgo: 8 * 60 * 24, context: context)
            
            
            do {
                try(context.save())
            } catch let err {
                print(err)
            }
        }
        
        loadData()
        
    }
    
    private func createSteveMessagesWithContext(context: NSManagedObjectContext) {
        let steve = NSEntityDescription.insertNewObject(forEntityName: "User", into: context) as! User
        steve.name = "Steve Jobs"
        steve.profileImageName = "steve_profile"
        
        ChatListTableViewController.createMessageWithText(text: "Good morning..", user: steve, minutesAgo: 3, context: context)
        ChatListTableViewController.createMessageWithText(text: "Hello, how are you? Hope you are having a good morning!", user: steve, minutesAgo: 2, context: context)
        ChatListTableViewController.createMessageWithText(text: "Are you interested in buying an Apple device? We have a wide variety of Apple devices that will suit your needs.  Please make your purchase with us.", user: steve, minutesAgo: 1, context: context)
        
        ChatListTableViewController.createMessageWithText(text: "Yes, totally looking to buy an iPhone 7.", user: steve, minutesAgo: 1, context: context, isSender: true)
        
        ChatListTableViewController.createMessageWithText(text: "Totally understand that you want the new iPhone 7, but you'll have to wait until September for the new release. Sorry but thats just how Apple likes to do things.", user: steve, minutesAgo: 1, context: context)
        
        ChatListTableViewController.createMessageWithText(text: "Absolutely, I'll just use my gigantic iPhone 6 Plus until then!!!", user: steve, minutesAgo: 1, context: context, isSender: true)
    }
    
    static func createMessageWithText(text: String, user: User, minutesAgo: Double, context: NSManagedObjectContext, isSender: Bool = false) {
        let message = NSEntityDescription.insertNewObject(forEntityName: "Message", into: context) as! Message
        message.user = user
        message.text = text
        message.date = Date().addingTimeInterval(-minutesAgo * 60)
        message.isSender = NSNumber(value: isSender)
    }
    
    func loadData() {
        let delegate = UIApplication.shared.delegate as? AppDelegate
        
        if let context = delegate?.persistentContainer.viewContext {
            
            if let users = fetchUsers() {
                
                messages = [Message]()
                
                for user in users {
                    
                    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Message")
                    fetchRequest.sortDescriptors = [NSSortDescriptor(key: "date", ascending: false)]
                    fetchRequest.predicate = NSPredicate(format: "user.name = %@", user.name!)
                    fetchRequest.fetchLimit = 1
                    
                    do {
                        
                        let fetchedMessages = try(context.fetch(fetchRequest)) as? [Message]
                        messages?.append(contentsOf: fetchedMessages!)
                        
                    } catch let err {
                        print(err)
                    }
                }
                
                messages = messages?.sorted(by: {$0.date!.compare($1.date! as Date) == .orderedDescending})
                
            }
        }
    }
    
    private func fetchUsers() -> [User]? {
        let delegate = UIApplication.shared.delegate as? AppDelegate
        if let context = delegate?.persistentContainer.viewContext {
            
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
            
            do {
                
                return try context.fetch(request) as? [User]
                
            } catch let err {
                print(err)
            }
            
        }
        
        return nil
    }
    
}
