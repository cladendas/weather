//
//  ExtensionsForSearchViewController.swift
//  Weather
//
//  Created by cladendas on 29.06.2021.
//

import Foundation
import UIKit


extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("didSelectRow")
        let tmpVC = DetailsViewController()
        
        self.navigationController?.pushViewController(tmpVC, animated: true)
    }
}
