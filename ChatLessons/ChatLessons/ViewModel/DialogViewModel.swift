//
//  DialogViewModel.swift
//  ChatLessons
//
//  Created by Michail Bondarenko on 2/25/19.
//  Copyright © 2019 Michail Bondarenko. All rights reserved.
//

import Foundation
import Bond

final class DialogViewModel {
    private var provider: MessageProvider!
    var text: String! = ""
    
    init(provider: MessageProvider) {
        self.provider = provider
    }
    
    func sendMessage(completion: @escaping (String?) -> Void) {
        guard !text.isEmpty else { return }
        let message = Message(text: text, timestamp: Date().timeIntervalSince1970)
        provider.send(message: message, completion: { success in
            completion(success ? self.text : nil)
        })
    }
}
