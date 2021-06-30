//
//  CityTableViewCell.swift
//  Weather
//
//  Created by cladendas on 29.06.2021.
//

import UIKit

final class CityTableViewCell: UITableViewCell {
    
    private let icon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "aligator")
        //растянет изображение по границе фрейма
        imageView.contentMode = .scaleAspectFit
        imageView.turnOffAutorecizingMask()
        return imageView
    }()
    
    var name: UILabel = {
        let label = UILabel()
        label.turnOffAutorecizingMask()
        label.textAlignment = .center
//        label.lineBreakMode = .byTruncatingTail
//        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
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
        
        [icon, name, currentWeather, temperature].forEach { contentView.addSubview($0) }
        
//        contentView.addSubview(name)
        
        [
            contentView.heightAnchor.constraint(greaterThanOrEqualToConstant: icon.image?.size.height ?? 13),
            
            icon.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            icon.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            icon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
//            icon.widthAnchor.constraint(equalToConstant: contentView.frame.height / 2),
            
//            contentView.topAnchor.constraint(equalTo: topAnchor),
//            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
//            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
//            name.topAnchor.constraint(equalTo: topAnchor, constant: 0),
//            name.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
//            name.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
//            name.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
//            name.heightAnchor.constraint(greaterThanOrEqualToConstant: 57)
            
        ].forEach { $0.isActive = true }
    }
}
