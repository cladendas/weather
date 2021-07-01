//
//  CityTableViewCell.swift
//  Weather
//
//  Created by cladendas on 29.06.2021.
//

import UIKit
import WebKit

final class CityTableViewCell: UITableViewCell {
    
    private let icon: UIImageView = {
        
        
        var imageView = UIImageView()
//        imageView.image = UIImage(named: "bkn_d")
        
        let url = "https://yastatic.net/weather/i/icons/blueye/color/svg/bkn_d.svg"
//        imageView.kf.setImage(with: URL(string: "https://github.githubassets.com/images/modules/logos_page/GitHub-Logo.png"))
        
        //растянет изображение по границе фрейма
        imageView.contentMode = .scaleAspectFit
        imageView.turnOffAutorecizingMask()
        
        return imageView
    }()
    
    var name: UILabel = {
        let label = UILabel()
        label.turnOffAutorecizingMask()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 22)
//        label.lineBreakMode = .byTruncatingTail
//        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        return label
    }()
    
    var currentWeather: UILabel = {
        let label = UILabel()
        label.turnOffAutorecizingMask()
        label.text = "Облачно на"
        return label
    }()
    
    var temperature: UILabel = {
        let label = UILabel()
        label.turnOffAutorecizingMask()
        label.textColor = .secondaryLabel
        label.text = "28 C"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        setupLayout()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")

    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func setupLayout() {
        
        [name, currentWeather, temperature].forEach { contentView.addSubview($0) }
        
//        contentView.addSubview(name)
        
//        var dd: Int {
//            if Int(icon.image?.size.height ?? 54) >= Int(icon.image?.size.width ?? 54) {
//                return Int(icon.image?.size.height ?? 54)
//            } else {
//                return Int(icon.image?.size.width ?? 54)
//            }
//        }
        
        [
            
            contentView.heightAnchor.constraint(greaterThanOrEqualToConstant: 58),
            
//            icon.heightAnchor.constraint(equalToConstant: 50),
//            icon.widthAnchor.constraint(equalToConstant: 50),
//            icon.topAnchor.constraint(equalTo: topAnchor, constant: 0),
//            icon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            
            
            name.centerYAnchor.constraint(equalTo: centerYAnchor),
            name.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            
            currentWeather.centerYAnchor.constraint(equalTo: centerYAnchor),
            currentWeather.leadingAnchor.constraint(equalTo: name.trailingAnchor, constant: 8),
            
            temperature.centerYAnchor.constraint(equalTo: centerYAnchor),
            temperature.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
            
        ].forEach { $0.isActive = true }
    }
}
