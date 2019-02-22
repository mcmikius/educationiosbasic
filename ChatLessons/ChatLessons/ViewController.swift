//
//  ViewController.swift
//  ChatLessons
//
//  Created by Michail Bondarenko on 2/18/19.
//  Copyright © 2019 Michail Bondarenko. All rights reserved.
//

import UIKit
import Bond

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: ViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.update()
        viewModel.observableTitle.observeNext { [weak self] value in
            self?.title = value
            }.dispose(in: bag)
        viewModel.observableTitle.map {
            $0.count == "new title".count ? UIColor.white : UIColor.red
            } .bind(to: tableView.reactive.backgroundColor)
        viewModel.observableItems.observeOn(.main).bind(to: tableView) { (items, indexPath, tableView) -> UITableViewCell in
            let obj = items[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! UserTableViewCell
            cell.viewObject = obj
            return cell
        }
        DispatchQueue.global().asyncAfter(deadline: .now() + 3) {
            self.viewModel.update()
        }
    }
    
    
}

//extension ViewController: UITableViewDataSource, UITableViewDelegate {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return viewModel.items.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let obj = viewModel.items[indexPath.row]
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! UserTableViewCell
//        cell.viewObject = obj
//
//        return cell
//    }
//
//
//}
