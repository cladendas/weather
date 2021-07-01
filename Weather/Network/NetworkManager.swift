//
//  NetworkManager.swift
//  Weather
//
//  Created by cladendas on 30.06.2021.
//

import Foundation

final class NetworkManager {
    
//https://api.weather.yandex.ru/v2/forecast?lat=45.048624&lon=38.985650&extra=true
    
    ///Создание запроса на получение данных о погоде
    ///- parameter lat: широта
    ///- parameter lon: долгота
    private static func request(_ lat: String, _ lon: String) -> URLRequest? {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.weather.yandex.ru"
        urlComponents.path = "/v2/forecast"
        
        urlComponents.queryItems = [
            URLQueryItem(name: "lat", value: "45.048624"),
            URLQueryItem(name: "lon", value: "38.985650")
        ]
        
        guard let url = urlComponents.url else { return nil }
        
        var request = URLRequest(url: url)
        
        request.allHTTPHeaderFields = ["X-Yandex-API-Key" : "b84bff10-a735-468b-8aac-e6729dd8d37f"]
        
        return request
    }
    
    ///Выполненение запроса на получение данных о погоде
    ///- parameter lat: широта
    ///- parameter lon: долгота
    static func performSearch(_ lon: String, _ lat: String, comlition: @escaping (_ weather: Weather) -> ()) {
        
        guard let urlRequest = request(lon, lat) else {
            print("url request error")
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            
            if let error = error {
                print(error.localizedDescription)
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                print("http status code: \(httpResponse.statusCode)")
            }
            
            guard let data = data else {
                print("no data received")
                return
            }
            
            guard let weather = parseJSON(withData: data) else { return }
            
            comlition(weather)
        }
        dataTask.resume()
    }
    
    ///Парсинг полученных данных
    private static func parseJSON(withData data: Data) -> Weather? {
        let decoder = JSONDecoder()
        
        do {
            let weatherData = try decoder.decode(Weather.self, from: data)
            return weatherData
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
}
