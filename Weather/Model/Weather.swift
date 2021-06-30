//
//  Weather.swift
//  Weather
//
//  Created by cladendas on 30.06.2021.
//

import Foundation


struct Weather: Codable {
    let geoObject: GeoObject
    let fact: Fact

    enum CodingKeys: String, CodingKey {
        case geoObject = "geo_object"
        case fact
    }
}

struct GeoObject: Codable {
    let locality, province: Country
}

struct Country: Codable {
    let id: Int
    let name: String
}

///Объект содержит информацию о погоде на данный момент
struct Fact: Codable {
    ///Температура (°C)
    let temp: Int
    
    let icon: Icon
    
    let condition: Condition
    let windSpeed: Double
    let cloudness: Double
    

    enum CodingKeys: String, CodingKey {
        case temp
        case icon, condition, cloudness
        case windSpeed = "wind_speed"
    }
}

///Код расшифровки погодного описания
enum Condition: String, Codable {
    case clear = "clear"
    case cloudy = "cloudy"
    case lightRain = "light-rain"
    case overcast = "overcast"
    case partlyCloudy = "partly-cloudy"
}

///Код иконки погоды. Иконка доступна по адресу https://yastatic.net/weather/i/icons/blueye/color/svg/<значение из поля icon>.svg
enum Icon: String, Codable {
    case bknD = "bkn_d"
    case bknN = "bkn_n"
    case bknRaD = "bkn_-ra_d"
    case ovc = "ovc"
    case ovcRa = "ovc_-ra"
    case skcD = "skc_d"
    case skcN = "skc_n"
}


