//
//  CurrentWeather.swift
//  weatherApplication
//
//  Created by dvt on 2017/10/20.
//  Copyright © 2017 dvt. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather {
    private var _cityName: String!
    private var _date: String!
    private var _weatherType: String!
    private var _currentTemperature: Double!
    
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today, \(currentDate)"
        return _date
    }
    
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var currentTemperature: Double {
        if _currentTemperature == nil {
            _currentTemperature = 0.0
        }
        return _currentTemperature
    }
    
    func downloadWeatherDetails(completed: @escaping DownloadComplete) {
        print(CURRENT_WEATHER_URL)
        let currentWeatherURL = URL(string: CURRENT_WEATHER_URL)!
        Alamofire.request(currentWeatherURL).responseJSON(completionHandler: { [weak self] response in
            let result = response
            
            if let dict = result.value as? Dictionary<String,Any> {
                
                if let name = dict["name"] as? String {
                    self?._cityName = name.capitalized
                }

                if let weather = dict["weather"] as? [Dictionary<String,Any>] {
                    if let main = weather[0]["main"] as? String {
                        self?._weatherType = main.capitalized
                    }
                }
                
                if let main = dict["main"] as? Dictionary<String, Any> {
                    if let currentTemperature = main["temp"] as? Double {
                        let kelvinToCelsius = currentTemperature - 273.15
                        self?._currentTemperature = kelvinToCelsius
                    }
                }
            }
            completed()
        })
        
    }
    
}
