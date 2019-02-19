//
//  ViewModel.swift
//  ChatLessons
//
//  Created by Michail Bondarenko on 2/18/19.
//  Copyright © 2019 Michail Bondarenko. All rights reserved.
//

import Foundation
import UIKit

protocol TitleUpdate {
    func updateTitle()
}

final class ViewModel {
    private let provider: UserProvider
    
    var title: String = "Messages" {
        didSet {
            titleObservers.forEach {
                $0.updateTitle()
            }
        }
    }
    
    var titleObservers: [TitleUpdate] = []
    
    private(set) var items: [UserViewObject] = []
    
    init(provider: UserProvider) {
        self.provider = provider
    }
    
    func update() {
        provider.getUsers { [weak self] users in
            self?.items = users.map { UserViewObject(raw: $0) }
        }
    }
   
}

struct UserViewObject {
    
    private let raw: UserModel
    
    var name: String { return raw.name }
    var message: String { return raw.lastMessage }
    var iconUrl: String { return raw.iconUrl }
    var nameColor: UIColor = .red
    var nameFont: UIFont = UIFont.systemFont(ofSize: 20)
    init(raw: UserModel) {
        self.raw = raw
    }
}
