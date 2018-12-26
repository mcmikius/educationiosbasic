//
//  BatchWeatherModel.swift
//  WeatherITEA
//
//  Created by Michail Bondarenko on 12/26/18.
//  Copyright © 2018 Michail Bondarenko. All rights reserved.
//

import Foundation

struct BatchWeatherModel: Codable {
    let list: [WeatherModel]
}
