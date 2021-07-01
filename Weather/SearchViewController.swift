//
//  SearchViewController.swift
//  Weather
//
//  Created by cladendas on 29.06.2021.
//

import UIKit
import CoreLocation

final class SearchViewController: UIViewController {
    
    
    ///Строка поиска
    private let searchBar: UITextView = {
        let text = UITextView()
        text.font = UIFont.systemFont(ofSize: 22)
        text.textColor = .label
        text.textAlignment = .left
        return text
    }()
    
    ///Кнопка поиска
    private lazy var searchButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Search", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 44 / 2
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(search), for: .touchUpInside)
        return button
    }()
    
    ///Таблица с городами
    private let citiesTableView = UITableView.init(frame: .zero, style: UITableView.Style.grouped)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        citiesTableView.register(CityTableViewCell.self, forCellReuseIdentifier: "CityTableViewCell")
        
        citiesTableView.estimatedRowHeight = 85.0
        citiesTableView.rowHeight = UITableView.automaticDimension
        
        citiesTableView.delegate = self
        citiesTableView.dataSource = self
        
        view.addSubview(searchBar)
        view.addSubview(searchButton)
        view.addSubview(citiesTableView)
        
        
        for i in vv {
            
            NetworkManager.performSearch(i[0], i[1]) { weather in
                DispatchQueue.main.async {
                    self.ww.append(weather)
                    self.citiesTableView.reloadData()
                }
            }
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    var ww: [Weather] = []
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        let dd = view.bounds.width / 2 + (view.bounds.width / 4)
        
        searchBar.frame = CGRect(x: 0, y: (self.navigationController?.navigationBar.frame.maxY)!, width: dd, height: 40)
        searchButton.frame = CGRect(x: searchBar.frame.maxX + 8, y: (self.navigationController?.navigationBar.frame.maxY)!, width: 78, height: 40)
        citiesTableView.frame = CGRect(x: 0, y: searchBar.frame.maxY + 2, width: view.bounds.width, height: view.bounds.height - 70)
    }
    
    
    ///Действие при нажатии на кнопку поиска
    @objc
    private func search() {
        geocoder(from: searchBar.text)
    }
    
    let vv = [
        ["59.9342562", "30.3351228"],
        ["55.7615902", "37.60946"],
        ["41.0117968", "28.9754277"],
        ["42.9640162", "47.4991496"],
        ["23.1359337", "-82.3475813"],
        ["64.147208", "-21.9424"],
        ["59.9115582", "10.7333611"],
        ["-1.2871605", "36.8218219"],
        ["55.7038574", "38.2249945"],
        ["52.2866549", "104.2819267"],
        ["64.7328563", "177.5078217"],
    ]
    
    ///По названию местоположения возвращает широту и долготу в виде массива с двумя элементами
    private func geocoder(from city: String) {
        let geocoder = CLGeocoder()
        
        geocoder.geocodeAddressString(city) { (placemarks, error) in
            
            let placemark = placemarks?.first
            if
                let lat = placemark?.location?.coordinate.latitude.description,
                let lon = placemark?.location?.coordinate.longitude.description {

                NetworkManager.performSearch(lat, lon) { weather in
                    DispatchQueue.main.async {
                        self.ww.append(weather)
                        self.citiesTableView.reloadData()
                    }
                }
            }
        }
    }
}
