//
//  Result.swift
//  WeatherITEA
//
//  Created by Michail Bondarenko on 12/25/18.
//  Copyright © 2018 Michail Bondarenko. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T)
    case error(Error)
}
