//
//  SearchViewController.swift
//  Weather
//
//  Created by cladendas on 29.06.2021.
//

import UIKit

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
    }
    
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
        
    }
}
