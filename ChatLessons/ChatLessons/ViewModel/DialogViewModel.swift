//
//  DialogViewModel.swift
//  ChatLessons
//
//  Created by Michail Bondarenko on 2/25/19.
//  Copyright © 2019 Michail Bondarenko. All rights reserved.
//

import Foundation
import Bond

final class DialogViewModel: NSObject {
    private var provider: MessageProvider!
    var text: String! = "" {
        didSet {
            isActionEnable.value = !text.isEmpty
        }
    }
    
    var color: UIColor = .black
    
    
    let textColor: Observable<UIColor> = Observable(.black)
    
    let observableText: Observable<String?> = Observable("default value")
    
    let isActionEnable: Observable<Bool> = Observable(false)
    
    init(provider: MessageProvider) {
        self.provider = provider
        observableText.map { $0?.isEmpty == false }.bind(to: isActionEnable)
        observableText.map { $0?.lowercased() == "red" ? UIColor.red : UIColor.black }.bind(to: textColor)
    }
    
    
    
    func sendMessage(completion: @escaping (String?) -> Void) {
        guard !text.isEmpty else { return }
        
        let message = Message(text: text, timestamp: Date().timeIntervalSince1970)
        provider.send(message: message, completion: { success in
            completion(success ? self.text : nil)
        })
    }
}
