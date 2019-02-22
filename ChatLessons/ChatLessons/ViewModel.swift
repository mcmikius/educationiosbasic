//
//  ViewModel.swift
//  ChatLessons
//
//  Created by Michail Bondarenko on 2/18/19.
//  Copyright © 2019 Michail Bondarenko. All rights reserved.
//

import Foundation
import UIKit
import Bond

protocol TitleUpdate {
    func updateTitle()
}

final class ViewModel {
    private let provider: UserProvider
    let observableTitle: Observable<String> = Observable("Messages")
    
    
    private(set) var items: [UserViewObject] = []
    let observableItems: MutableObservableArray<UserViewObject> = MutableObservableArray([])
    
    init(provider: UserProvider) {
        self.provider = provider
    }
    
    func update() {
        provider.getUsers { [weak self] users in
            //            self?.items = users.map { UserViewObject(raw: $0) }
            self?.observableItems.insert(contentsOf: users.map{ UserViewObject(raw: $0) }, at: 0)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.observableTitle.value = "new title"
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
