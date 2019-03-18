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
import ReactiveKit

protocol TitleUpdate {
    func updateTitle()
}

final class ViewModel {
    private let bag = DisposeBag()
    private let provider: UserProvider
    let observableTitle: Observable<String> = Observable("Messages")
    
    
    private(set) var items: [UserViewObjectProtocol] = []
    let observableItems: MutableObservableArray<UserViewObjectProtocol> = MutableObservableArray([])
    
    init(provider: UserProvider) {
        self.provider = provider
    }
    
    func update() {
        if provider.shouldFetchFromAPI() {
            provider.getUsers { [weak self] users in
                //            self?.items = users.map { UserViewObject(raw: $0) }
                let userObjects = users.map { UserViewObjectStruct(raw: $0) }
                self?.observableItems.insert(contentsOf: userObjects, at: 0)
                self?.provider.save(users: userObjects)
            }
        } else {
            guard let cdUsers = provider.getCDUser() else { return }
            let userObjects = cdUsers.map {
                return CDUserViewObject(raw: $0)
            }
            observableItems.insert(contentsOf: userObjects, at: 0)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.observableTitle.value = "new title"
        }
    }
    
    func makeDialogViewModel() -> DialogViewModel {
        return DialogViewModel()
    }
    
    func updateMessages(for userViewModel: UserViewObjectProtocol) {
        combineLatest(provider.getMessages(for: userViewModel.userId), provider.getMessages(for: userViewModel.userId)).observe { (result) in
            print(result)
        }
        provider.getMessages(for: userViewModel.userId)
            .executeOn(.global())
            .first()
            .observeOn(.main)
            .observe { [weak self] event in
                switch event {
                case .completed:
                    break
                case .next(let messages):
                    //save messages
                    //raw model objects => serialize viewModel layer objects
                    print(messages)
                case .failed(let error):
                    //handle error
                    print(error)
                }
            }.dispose(in: bag)
    }
    
}

protocol UserViewObjectProtocol {
    var userId: String { get }
    var name: String { get }
    var message: String { get }
    var iconURL: String { get }
    var nameColor: UIColor { get }
    var nameFont: UIFont { get }
}

struct CDUserViewObject: UserViewObjectProtocol {
    var userId: String = ""
    
    var name: String = ""
    
    var message: String = ""
    
    var iconURL: String
    
    var nameColor: UIColor = .red
    
    var nameFont: UIFont = UIFont.systemFont(ofSize: 30)
    
    init(raw: UserModelStoraging) {
        name = raw.name ?? ""
        iconURL = raw.iconURL ?? ""
    }
}

struct UserViewObjectStruct: UserViewObjectProtocol {
    
    private let raw: UserModel
    
    var userId: String { return "id" }
    var name: String { return raw.name }
    var message: String { return raw.lastMessage }
    var iconURL: String { return raw.iconURL }
    var nameColor: UIColor = .red
    var nameFont: UIFont = UIFont.systemFont(ofSize: 30)
    init(raw: UserModel) {
        self.raw = raw
    }
}
