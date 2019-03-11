//
//  UserTableViewCell.swift
//  ChatLessons
//
//  Created by Michail Bondarenko on 2/18/19.
//  Copyright © 2019 Michail Bondarenko. All rights reserved.
//

import UIKit

final class UserTableViewCell: UITableViewCell {

    var viewObject: UserViewObjectProtocol! {
        didSet {
            textLabel?.text = viewObject.name
            textLabel?.textColor = viewObject.nameColor
            textLabel?.font = viewObject.nameFont
            detailTextLabel?.text = viewObject.message
        }
    }

}
