//
//  DetailsViewController.swift
//  Weather
//
//  Created by cladendas on 29.06.2021.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var weather: Weather?
    
    private let temp: UILabel = {
        let label = UILabel()
        label.font = UIFont.italicSystemFont(ofSize: 120)
        label.textColor = .label
        label.textAlignment = .center
        label.text = "--1 °C"
        label.turnOffAutorecizingMask()
        return label
    }()
    
    private let condition: UILabel = {
        let label = UILabel()
        label.font = UIFont.italicSystemFont(ofSize: 28)
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.turnOffAutorecizingMask()
        return label
    }()
    
    private let windSpeed: UILabel = {
        let label = UILabel()
        label.font = UIFont.italicSystemFont(ofSize: 52)
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        label.turnOffAutorecizingMask()
        return label
    }()
    
    private let cloudness: UILabel = {
        let label = UILabel()
        label.font = UIFont.italicSystemFont(ofSize: 32)
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        label.turnOffAutorecizingMask()
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        [temp, condition, windSpeed, cloudness].forEach { view.addSubview($0)}
        
        guard let weather = weather else { return }
        
        builWeather(from: weather)
        self.navigationItem.title = weather.geoObject.locality.name
    }
    
    override func viewWillLayoutSubviews() {
        setupLayout()
    }
    
    private func builWeather(from weather: Weather) {
        temp.text = "\(weather.fact.temp) °C"
        
        windSpeed.text = "ветер \(weather.fact.windSpeed) м/с"
        
        cloudness.text = weather.fact.cloudnessQ
        condition.text = weather.fact.conditionQ
    }
    
    ///Настройка констрейнтов
    private func setupLayout() {
        
        let nCmaxY = self.navigationController?.navigationBar.frame.maxY
        condition.sizeToFit()
        [
            temp.topAnchor.constraint(equalTo: view.topAnchor, constant: nCmaxY ?? 64 + 8),
            temp.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            condition.topAnchor.constraint(equalTo: temp.bottomAnchor, constant: 14),
            condition.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            condition.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -14),
            condition.heightAnchor.constraint(equalToConstant: 79),
            condition.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
            condition.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -14),
            
            
            windSpeed.topAnchor.constraint(equalTo: condition.bottomAnchor, constant: 14),
            windSpeed.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            cloudness.topAnchor.constraint(equalTo: windSpeed.bottomAnchor, constant: 14),
            cloudness.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ].forEach { $0.isActive = true }
        
        condition.sizeToFit()
    }
}

