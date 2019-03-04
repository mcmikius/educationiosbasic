//
//  UserProvider.swift
//  ChatLessons
//
//  Created by Michail Bondarenko on 2/18/19.
//  Copyright © 2019 Michail Bondarenko. All rights reserved.
//

import Foundation
import ReactiveKit
struct UserProvider {
    func getUsers(_ completion: @escaping ([UserModel]) -> Void) {
        
        //url
        //request (get, body, parametrs)
        //fetch data from API
        
        let result =  [UserModel(), UserModel()]
        completion(result)
    }
    
    func getMessages(for userId: String) -> Signal<[Message], NSError> {
        return Signal { observer in
            
            observer.next([])
            observer.failed(NSError(domain: "debug", code: 400, userInfo: nil))
            observer.completed()
            
            return BlockDisposable { }
        }
    }
    
    func post(message: Message) {
        
    }
}
