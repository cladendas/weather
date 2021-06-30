//
//  ForSearchViewController.swift
//  Weather
//
//  Created by cladendas on 29.06.2021.
//

import Foundation
import UIKit


extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityTableViewCell", for: indexPath) as! CityTableViewCell
        
        cell.name.text = "hjhjhjhjhj"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("didSelectRow")
        let tmpVC = DetailsViewController()
        
        self.navigationController?.pushViewController(tmpVC, animated: false)
    }
}
