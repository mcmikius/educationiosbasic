//
//  TaskListCell.swift
//  Planner
//
//  Created by Michail Bondarenko on 12/20/18.
//  Copyright © 2018 Michail Bondarenko. All rights reserved.
//

import UIKit

class TaskListCell: UITableViewCell {

    @IBOutlet weak var labelTaskName: UILabel!
    @IBOutlet weak var labelTaskCategory: UILabel!
    @IBOutlet weak var labelDeadline: UILabel!
    @IBOutlet weak var labelPriority: UILabel!
    @IBOutlet weak var buttonTaskinfo: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
