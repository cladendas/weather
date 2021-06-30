//
//  NetworkManager.swift
//  Weather
//
//  Created by cladendas on 30.06.2021.
//

import Foundation

final class NetworkManager {
    
//https://api.weather.yandex.ru/v2/forecast?lat=45.048624&lon=38.985650&extra=true
    
    private static func request(_ lat: String, _ lon: String) -> URLRequest? {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.weather.yandex.ru"
        urlComponents.path = "/v2/forecast"
        
        urlComponents.queryItems = [
            URLQueryItem(name: "lat", value: lat),
            URLQueryItem(name: "lon", value: lon)
        ]
        
        guard let url = urlComponents.url else { return nil }
        
        let request = URLRequest(url: url)
        
        return request
    }
    
    private static func performSearch(_ lon: String, _ lat: String, comlotion: @escaping (_ weather: Weather) -> ()) {
        
    }
}
