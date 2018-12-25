//
//  WeatherModel.swift
//  WeatherITEA
//
//  Created by Michail Bondarenko on 12/25/18.
//  Copyright © 2018 Michail Bondarenko. All rights reserved.
//

import Foundation

struct WeatherModel: Codable {
    
    let main: Main
    let name: String
    
    struct Main: Codable {
        let temp: Double
    }
    
    let weather:[Weather]
    
    struct Weather: Codable {
        let main: String
        let icon: String
    }
    
    let sys: Sys
    
    struct Sys: Codable {
        let country: String
    }
    
}

extension WeatherModel {
    var displayTemperature: String {
        return "\(main.temp)" + "º"
    }
    
    var iconUrlPath: String {
        guard let iconName = weather.first?.icon else { return "" }
        return "https://openweathermap.org/img/w/\(iconName).png"
    }
}
