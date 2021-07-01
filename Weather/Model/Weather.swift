//
//  Weather.swift
//  Weather
//
//  Created by cladendas on 30.06.2021.
//

import Foundation


struct Weather: Codable {
    private(set) var geoObject: GeoObject
    private(set) var fact: Fact

    enum CodingKeys: String, CodingKey {
        case geoObject = "geo_object"
        case fact
    }
    
    init?(json: Dictionary<String, Any>) {
        guard
            let geoObject = json["geo_object"] as? Dictionary <String, Any>,
            let tmpGeoObject = GeoObject(json: geoObject),
//            let fact = json["fact"] as? Dictionary <String, Any>,
            let tmpFact = Fact(json: json["fact"] as! Dictionary<String, Any>)
        else { return nil }
        
        self.geoObject = tmpGeoObject
        self.fact = tmpFact
    }
}

struct GeoObject: Codable {
    private(set) var locality, province: Country
    
    init?(json: Dictionary<String, Any>) {
        guard
            let locality = json["locality"] as? Dictionary <String, Any>,
            let province = json["province"] as? Dictionary <String, Any>,
            let tmpLoacality = Country(json: locality),
            let tmpProvince = Country(json: province)
        else { return nil }
        
        self.locality = tmpLoacality
        self.province = tmpProvince
    }
}

///Населённый пункт
struct Country: Codable {
    private(set) var id: Int
    private(set) var name: String
    
    init?(json: Dictionary<String, Any>) {
        guard
            let id = json["id"] as? Int,
            let name = json["name"] as? String
        else { return nil }
        
        self.id = id
        self.name = name
    }
}

///Объект содержит информацию о погоде на данный момент
struct Fact: Codable {
    ///Температура (°C)
    private(set) var temp: Int
    ///Код иконки погоды
//    private(set) var icon: Icon
    ///Код расшифровки погодного описания
    private(set) var condition: Condition
    ///Скорость ветра (в м/с)
    private(set) var windSpeed: Double
    ///Облачность
    private(set) var cloudness: Double
    

    enum CodingKeys: String, CodingKey {
        case temp
        case condition, cloudness
        case windSpeed = "wind_speed"
    }
    
    init?(json: Dictionary<String, Any>) {
        guard
            let temp = json["temp"] as? Int,
            let condition = json["condition"] as? Condition,
            let windSpeed = json["wind_speed"] as? Double,
            let cloudness = json["cloudness"] as? Double
        else { return nil }
        
        self.temp = temp
        self.condition = condition
        self.windSpeed = windSpeed
        self.cloudness = cloudness
    }
}

///Код расшифровки погодного описания
enum Condition: String, Codable {
    case clear = "clear"
    case cloudy = "cloudy"
    case lightRain = "light-rain"
    case overcast = "overcast"
    case partlyCloudy = "partly-cloudy"
    case drizzle = "drizzle"
    case rain = "rain"
    case moderateRain = "moderate-rain"
    case heavyRain = "heavy-rain"
    case continuousHeavyRain = "continuous-heavy-rain"
    case showers = "showers"
    case wetSnow = "wet-snow"
    case lightSnow = "light-snow"
    case snow = "snow"
    case snowShowers = "snow-showers"
    case hail = "hail"
    case thunderstorm = "thunderstorm"
    case thunderstormWithRain = "thunderstorm-with-rain"
    case thunderstormWithHail = "thunderstorm-with-hail"
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


