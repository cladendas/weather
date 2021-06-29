//
//  CityTableViewCell.swift
//  Weather
//
//  Created by cladendas on 29.06.2021.
//

import UIKit

final class CityTableViewCell: UITableViewCell {
    
    var name: UILabel = {
        let label = UILabel()
        label.turnOffAutorecizingMask()
        return label
    }()
    
    var currentWeather: UILabel = {
        let label = UILabel()
        label.turnOffAutorecizingMask()
        return label
    }()
    
    var temperature: UILabel = {
        let label = UILabel()
        label.turnOffAutorecizingMask()
        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
