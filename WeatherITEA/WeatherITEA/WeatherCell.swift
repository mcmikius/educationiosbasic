//
//  WeatherCell.swift
//  WeatherITEA
//
//  Created by Michail Bondarenko on 12/25/18.
//  Copyright © 2018 Michail Bondarenko. All rights reserved.
//

import UIKit

protocol WeatherTableViewCellDelegate: class {
    func userDidClickCell(_ cell: WeatherCell)
}

class WeatherCell: UITableViewCell {

    @IBOutlet weak var iconWeatherCondition: UIImageView!
    @IBOutlet weak var labelLocation: UILabel!
    @IBOutlet weak var labelCondition: UILabel!
    @IBOutlet weak var labelTemperature: UILabel!
    
    weak var delegate: WeatherTableViewCellDelegate?
    
    var clickCompletion: ((WeatherCell) -> Void)?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        if selected {
//            delegate?.userDidClickCell(self)
            clickCompletion?(self)
        }

        // Configure the view for the selected state
    }

}
