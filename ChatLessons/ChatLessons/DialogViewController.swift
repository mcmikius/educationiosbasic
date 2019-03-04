//
//  DialogViewController.swift
//  ChatLessons
//
//  Created by Michail Bondarenko on 2/21/19.
//  Copyright © 2019 Michail Bondarenko. All rights reserved.
//

import UIKit

class DialogViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    
    
    @IBOutlet weak var dockViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var messageTextView: UITextView!
    @IBOutlet weak var messagesTableView: UITableView!
    
    var viewModel: DialogViewModel!
    var messagesArray:[String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.messagesTableView.delegate = self
        self.messagesTableView.dataSource = self
        
        let tapGesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "tableViewTapped")
        self.messagesTableView.addGestureRecognizer(tapGesture)
        
        //Sample data
        self.messagesArray.append("Test 1")
        self.messagesArray.append("Test 2")
        self.messagesArray.append("Test 3")
    } 
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func sendButtonTapped(_ sender: UIButton) {
        self.messageTextView.endEditing(true)
    }
    
    func tableViewTapped() {
        self.messageTextView.endEditing(true)
    }
    
    // MARK: TextField Delegate Methods
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.view.layoutIfNeeded()
        UIView.animate(withDuration: 0.5, animations: {
            self.dockViewHeightConstraint.constant = 400
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        self.view.layoutIfNeeded()
        UIView.animate(withDuration: 0.5, animations: {
            self.dockViewHeightConstraint.constant = 60
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    // MARK: TableView Delegate Methods
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messagesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.messagesTableView.dequeueReusableCell(withIdentifier: "MessageCell") as! UITableViewCell
        cell.textLabel?.text = self.messagesArray[indexPath.row]
        
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
