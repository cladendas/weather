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
        
        let tmp = "На небе "
        
        switch weather.fact.cloudness {
        case 0:
            cloudness.text = tmp + "ясно"
        case 0.25:
            cloudness.text = tmp + "малооблачно"
        case 0.5, 0.75:
            cloudness.text = tmp + "облачно с прояснениями"
        case 1:
            cloudness.text = tmp + "пасмурно"
        default:
            cloudness.text = ""
        }
        
        switch weather.fact.condition {
        case .clear:
            condition.text = "ясно"
        case .partlyCloudy:
            condition.text = "малооблачно"
        case .cloudy:
            condition.text = "облачно с прояснениями"
        case .overcast:
            condition.text = "пасмурно"
        case .drizzle:
            condition.text = "морось"
        case .lightRain:
            condition.text = "небольшой дождь"
        case .rain:
            condition.text = "дождь"
        case .moderateRain:
            condition.text = "умеренно сильный дождь"
        case .heavyRain:
            condition.text = "сильный дождь"
        case .continuousHeavyRain:
            condition.text = "длительный сильный дождь"
        case .showers:
            condition.text = "ливень"
        case .wetSnow:
            condition.text = "дождь со снегом"
        case .lightSnow:
            condition.text = "небольшой снего"
        case .snow:
            condition.text = "снег"
        case .snowShowers:
            condition.text = "снегопад"
        case .hail:
            condition.text = "град"
        case .thunderstorm:
            condition.text = "гроза"
        case .thunderstormWithRain:
            condition.text = "дождь с грозой"
        case .thunderstormWithHail:
            condition.text = "гроза с градом"
        }
    }
    
    private func setupLayout() {
        
        let nCmaxY = self.navigationController?.navigationBar.frame.maxY

        [
            temp.topAnchor.constraint(equalTo: view.topAnchor, constant: nCmaxY ?? 64 + 8),
            temp.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            condition.topAnchor.constraint(equalTo: temp.bottomAnchor, constant: 14),
            condition.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            windSpeed.topAnchor.constraint(equalTo: condition.bottomAnchor, constant: 14),
            windSpeed.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            cloudness.topAnchor.constraint(equalTo: windSpeed.bottomAnchor, constant: 14),
            cloudness.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ].forEach { $0.isActive = true }
    }
}

