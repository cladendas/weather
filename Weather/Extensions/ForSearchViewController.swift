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
        ww.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityTableViewCell", for: indexPath) as! CityTableViewCell
        
        cell.name.text = ww[indexPath.row].geoObject.locality.name
        cell.temperature.text = ww[indexPath.row].fact.temp.description
        cell.currentWeather.text = ww[indexPath.row].fact.cloudnessQ.description
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let tmpVC = DetailsViewController()
        NetworkManager.performSearch(vv[indexPath.row][0], vv[indexPath.row][1]) { [weak self] weather in
            tmpVC.weather = weather
            
            DispatchQueue.main.async {
                self?.navigationController?.pushViewController(tmpVC, animated: false)
            }
        }
    }
}
