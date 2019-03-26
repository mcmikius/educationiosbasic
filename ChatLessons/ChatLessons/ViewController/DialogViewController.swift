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
        viewModel.observableText.bidirectionalBind(to: messageTextView.reactive.text)
//        messageTextView.reactive.text.bind(to: viewModel.observableText)
        viewModel.isActionEnable.bind(to: sendButton.reactive.isEnabled)
//        viewModel.textColor.bind(to: messageTextView.reactive.textColor)
        
        let obs = viewModel.observe(\.color) { [unowned self] object, change in
            self.messageTextView.textColor = object.color
        }

        self.messagesTableView.delegate = self
        self.messagesTableView.dataSource = self
        
        let tapGesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: Selector(("tableViewTapped")))
        self.messagesTableView.addGestureRecognizer(tapGesture)
    } 
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func sendButtonTapped(_ sender: UIButton) {
        viewModel.sendMessage { text in
            
        }
    }
    
    func tableViewTapped() {
        if messageTextView.text.isEmpty == false {
            
        }
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

//extension DialogViewController: UITextViewDelegate {
//    func textViewDidChange(_ textView: UITextView) {
//        viewModel.text = messageTextView.text
//    }
//}
