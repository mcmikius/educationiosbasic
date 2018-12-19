//
//  ViewController.swift
//  WeatherITEA
//
//  Created by Michail Bondarenko on 12/19/18.
//  Copyright © 2018 Michail Bondarenko. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet weak var errorMessageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let date = Date()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        let formattedDate = formatter.string(from: date)
        //let time = "15:10"
        errorMessageLabel.text = String(format: "Offline mode... Time: %@", formattedDate)
        // Do any additional setup after loading the view, typically from a nib.
    }


}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }

}
