//
//  ViewController.swift
//  WeatherITEA
//
//  Created by Michail Bondarenko on 12/19/18.
//  Copyright © 2018 Michail Bondarenko. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {


    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var errorMessageLabel: UILabel!
    
    private let provider = WeatherProvider()
    private var items: [WeatherModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let date = Date()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        let formattedDate = formatter.string(from: date)
        
        errorMessageLabel.text = String(format: "Offline mode... Time: %@", formattedDate)
        
        tableView.tableFooterView = UIView(frame: .zero)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        provider.fetchWeather(completion: { [weak self] result in
            switch result {
            case .success(let weatherModel):
                self?.updateTableView(with: weatherModel)
            case .error( _):
                self?.showError()
            }
        })
    }
    private func updateTableView(with model: WeatherModel) {
        items.append(model)
        let indexPath: [IndexPath] = [IndexPath(row: items.count - 1, section: 0)]
        tableView.insertRows(at: indexPath, with: .fade)
    }
    
    private func showError() {
        
    }
    
    private func hideError() {
        
    }

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherCell
        cell.labelTemperature.text = model.displayTemperature
//        cell.labelTemperature.text = model.displayTemperature
//        cell.labelTemperature.text = model.displayTemperature
        return cell
    }

}

