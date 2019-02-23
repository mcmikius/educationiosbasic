//
//  ChatListTableViewCell.swift
//  ChatAppLessons
//
//  Created by Michail Bondarenko on 2/21/19.
//  Copyright © 2019 Michail Bondarenko. All rights reserved.
//

import UIKit

class ChatListTableViewCell: UITableViewCell {
    
    var message: Message? {
        didSet {
            fullNameLabel.text = message?.user?.name
            if let profileImageName = message?.user?.profileImageName {
                profileImageView.image = UIImage(named: profileImageName)
            }
            messageLabel.text = message?.text
            if let date = message?.date {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "h:mm a"
                let elapsedTimeInSeconds = Date().timeIntervalSince(date)
                
                let secondInDays: TimeInterval = 60 * 60 * 24
                
                if elapsedTimeInSeconds > 7 * secondInDays {
                    dateFormatter.dateFormat = "MM/dd/yy"
                } else if elapsedTimeInSeconds > secondInDays {
                    dateFormatter.dateFormat = "EEE"
                }
                
                timeLabel.text = dateFormatter.string(from: date)
            }
        }
    }
    

    @IBOutlet weak var profileImageView: UIImageView! {
        didSet {
            profileImageView.layer.cornerRadius = profileImageView.frame.size.height / 2
            profileImageView.layer.masksToBounds = true
        }
    }
    
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
