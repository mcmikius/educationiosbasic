//
//  ViewController.swift
//  WeatherITEA
//
//  Created by Michail Bondarenko on 12/19/18.
//  Copyright © 2018 Michail Bondarenko. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
 
    
    private let itemsKey = "items"
    private let lastUpdateTimeKey = "lastUpdateTime"
    
    
    let cities: [City] = City.allCases
    


    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var errorMessageLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var warningView: UIView!
    
    private let provider = WeatherProvider()
    private var items: [WeatherModel] = []
    private var selectedItem: WeatherModel?
    
    private var refresh = UIRefreshControl(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.refreshControl = refresh
        
        refresh.addTarget(self, action: #selector(onPullToRefresh(sender:)), for: .valueChanged)
        
        tableView.tableFooterView = UIView(frame: .zero)
    }
    
    fileprivate func fetchWeatherData() {
        provider.fetchWeather(for: cities) { [weak self] result in
            switch result {
            case .success(let cityWeather):
                self?.updateItems(with: cityWeather)
                self?.hideError()
                self?.cacheItems(model: cityWeather)
            case .error(_):
                self?.extractCache()
                self?.showError()
            }
            self?.refresh.endRefreshing()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        fetchWeatherData()
        
    }
    
    @objc private func onPullToRefresh(sender: UIRefreshControl) {
        
        fetchWeatherData()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "details" {
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let item = items[indexPath.row]
        }
    }
    
    private func updateItems(with model: BatchWeatherModel) {
        items = model.list
        tableView.reloadData()
    }
    
    private func cacheItems(model: BatchWeatherModel) {
        let data: Data? = try? JSONEncoder().encode(model)
        UserDefaults.standard.setValue(data, forKey: itemsKey)
        UserDefaults.standard.setValue(Date(), forKey: lastUpdateTimeKey)
    }
    
    private func extractCache() {
        if let date = UserDefaults.standard.value(forKey: lastUpdateTimeKey) as? Date {
            
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy MMMM HH:mm"
            let formattedDate = formatter.string(from: date)
            
            
//            let localizedString = NSLocalizedString("weatherList.warning.text", comment: "some comment")
            
//            errorMessageLabel.text = localizedString
            

        errorMessageLabel.text = String(format: NSLocalizedString("weatherList.warning.text.format", comment: ""), formattedDate)
    }
        
        if let weatherData = UserDefaults.standard.data(forKey: itemsKey),
            let model = try? JSONDecoder().decode(BatchWeatherModel.self, from: weatherData) {
        
            updateItems(with: model)
    }
}
//    private func fetchWeatherForLondon() {
//
//        provider.fetchSingleCityWeather(completion: { [weak self] result in
//            switch result {
//            case .success(let weatherModel):
//                self?.updateTableView(with: weatherModel)
//            case .error( _):
//                self?.showError()
//            }
//        })
//    }
    
    private func updateTableView(with model: WeatherModel) {
        items.append(model)
        let indexPath: [IndexPath] = [IndexPath(row: items.count - 1, section: 0)]
        tableView.insertRows(at: indexPath, with: .fade)
    }
    
    private func showError() {
        warningView.isHidden = false
    }
    
    private func hideError() {
        warningView.isHidden = true
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
        cell.iconWeatherCondition.updateImage(with: model.iconUrlPath, placeholderImage: nil)
//        cell.delegate = self
        cell.clickCompletion = { [weak self] sell in
            guard let indexPath = self?.tableView.indexPath(for: cell),
                let item = self?.items[indexPath.row] else { return }
            self?.selectedItem = item
            self?.performSegue(withIdentifier: "details", sender: self)
        }
//        cell.labelTemperature.text = model.displayTemperature
        return cell
    }

}

extension ViewController: WeatherTableViewCellDelegate {
    func userDidClickCell(_ cell: WeatherCell) {
        
        performSegue(withIdentifier: "details", sender: self)
    }
    
    
}

