//
//  ChatRoomTableViewController.swift
//  ChatAppLessons
//
//  Created by Michail Bondarenko on 2/22/19.
//  Copyright © 2019 Michail Bondarenko. All rights reserved.
//

import UIKit
import CoreData

class ChatRoomTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate, UIScrollViewDelegate {
    private let MessageItem = "MessageItem"
    var messages: [Message]?
    var user: User? {
        didSet {
            navigationItem.title = user?.name
        }
    }
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    func handleSend() {
        
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        
        ChatListTableViewController.createMessageWithText(text: inputTextField.text!, user: user!, minutesAgo: 0, context: context, isSender: true)
        
        do {
            try context.save()
            inputTextField.text = nil
            
        } catch let error {
            print(error)
        }
    }
    
    func simulate() {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        ChatListTableViewController.createMessageWithText(text: "Here's a text message that was sent a few minutes ago...", user: user!, minutesAgo: 1, context: context)
        ChatListTableViewController.createMessageWithText(text: "Another message that was received a while ago...", user: user!, minutesAgo: 1, context: context)
        
        do {
            try context.save()
            
        } catch let error {
            print(error)
        }
        
    }
    
    
    lazy var fetchedResultsControler: NSFetchedResultsController = { () -> NSFetchedResultsController<NSFetchRequestResult> in
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Message")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "date", ascending: true)]
        fetchRequest.predicate = NSPredicate(format: "user.name = %@", self.user!.name!)
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        let fetchedResultsControler = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResultsControler.delegate = self
        return fetchedResultsControler
    }()
    
    var blockOperations = [BlockOperation]()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        do {
            try fetchedResultsControler.performFetch()
            
            print(fetchedResultsControler.sections?[0].numberOfObjects)
            
        } catch let error {
            print(error)
        }
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardNotification), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardNotification), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    @objc func handleKeyboardNotification(notification: NSNotification) {
        
        if let userInfo = notification.userInfo {
            
            _ = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as AnyObject).cgRectValue
            
            let isKeyboardShowing = notification.name == UIResponder.keyboardWillShowNotification
            
            UIView.animate(withDuration: 0, delay: 0, options: UIView.AnimationOptions.curveEaseOut, animations: {
                
                self.view.layoutIfNeeded()
                
            }, completion: { (completed) in
                
                if isKeyboardShowing {
                    let lastItem = self.fetchedResultsControler.sections![0].numberOfObjects - 1
                    let indexPath = IndexPath(row: lastItem, section: 0)
                    self.tableView .scrollToRow(at: indexPath, at: UITableView.ScrollPosition.bottom, animated: true)
                }
                
            })
        }
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = messages?.count {
            return count
        }
        return 0    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MessageItem, for: indexPath) as! MessageTableViewCell

        

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        inputTextField.endEditing(true)
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - IBAction

    @IBAction func inputTextField(_ sender: UITextField) {
    }
    @IBAction func sendButton(_ sender: UIButton) {
    }
    
    
}
