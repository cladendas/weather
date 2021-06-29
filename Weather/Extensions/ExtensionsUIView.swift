//
//  ExtensionsUIView.swift
//  Weather
//
//  Created by cladendas on 29.06.2021.
//

import UIKit

extension UIView {
    
    ///Отключить AutorecizingMask. Чтобы не писать каждый раз для каждого элемента в отдельности
    func turnOffAutorecizingMask() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}
