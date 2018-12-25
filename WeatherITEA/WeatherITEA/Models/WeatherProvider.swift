//
//  WeatherProvider.swift
//  WeatherITEA
//
//  Created by Michail Bondarenko on 12/25/18.
//  Copyright © 2018 Michail Bondarenko. All rights reserved.
//

import Foundation
import Alamofire

private let json = """
{"coord":{"lon":-0.13,"lat":51.51},"weather":[{"id":300,"main":"Drizzle","description":"light intensity drizzle","icon":"09d"}],"base":"stations","main":{"temp":280.32,"pressure":1012,"humidity":81,"temp_min":279.15,"temp_max":281.15},"visibility":10000,"wind":{"speed":4.1,"deg":80},"clouds":{"all":90},"dt":1485789600,"sys":{"type":1,"id":5091,"message":0.0103,"country":"GB","sunrise":1485762037,"sunset":1485794875},"id":2643743,"name":"London","cod":200}
"""

struct WeatherProvider {
    func fetchWeather(completion: @escaping (Result<WeatherModel>) -> Void) {
        let path = "https://samples.openweathermap.org/data/2.5/weather?q=London,uk&appid=b6907d289e10d714a6e88b30761fae22"
        Alamofire.request(path).validate(statusCode: 200..<300).responseJSON { result in
            guard let data = result.data
                else {
                    completion(.error(NSError()))
                    return
            }
            let result: WeatherModel
            do {
                result = try JSONDecoder().decode(WeatherModel.self, from: data)
            } catch {
                print(error.localizedDescription)
                completion(.error(error))
                return
            }
            completion(.success(result))
        }

        //TODO: fetch from API
/*        guard let data = json.data(using: .utf8) else {
            completion(.error(NSError()))
            return
        }
        
        let result: WeatherModel
        do {
            result = try JSONDecoder().decode(WeatherModel.self, from: data)
        } catch {
            print(error.localizedDescription)
            completion(.error(error))
            return
        }
        completion(.success(result))
 */
    }
}

