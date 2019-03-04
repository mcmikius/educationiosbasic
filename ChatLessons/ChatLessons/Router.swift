//
//  Router.swift
//  ChatLessons
//
//  Created by Michail Bondarenko on 2/18/19.
//  Copyright © 2019 Michail Bondarenko. All rights reserved.
//

import Foundation
import UIKit

struct Router {
    
    func showDialogViewController(for viewController: ViewController) {
        let dialogViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: DialogViewController.self)) as! DialogViewController
        dialogViewController.viewModel = viewController.viewModel.makeDialogViewModel()
        viewController.navigationController?.show(dialogViewController, sender: viewController)
    }
}
