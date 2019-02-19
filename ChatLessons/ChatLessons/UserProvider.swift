//
//  UserProvider.swift
//  ChatLessons
//
//  Created by Michail Bondarenko on 2/18/19.
//  Copyright © 2019 Michail Bondarenko. All rights reserved.
//

import Foundation
struct UserProvider {
    func getUsers(_ completion: @escaping ([UserModel]) -> Void) {
        
        //url
        //request (get, body, parametrs)
        //fetch data from API
        
        let result =  [UserModel(), UserModel()]
        completion(result)
    }
}
