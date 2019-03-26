//
//  MessageProvider.swift
//  ChatLessons
//
//  Created by Michail Bondarenko on 3/25/19.
//  Copyright © 2019 Michail Bondarenko. All rights reserved.
//

import Foundation

struct MessageProvider {
    func send(message: Message, completion: @escaping (Bool) -> Void) {
        DispatchQueue.global().async {
            completion(true)
        }
    }
}
