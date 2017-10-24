//
//  WeatherForecast.swift
//  weatherApplication
//
//  Created by dvt on 2017/10/23.
//  Copyright © 2017 dvt. All rights reserved.
//

import UIKit
import Alamofire

class WeatherForecast{
    
    private var _date: String!
    private var _weatherType: String!
    private var _highTemperature: String!
    private var _lowTemperature: String!
    
    var date: String {
        get{
            if _date == nil {
                _date = ""
            }
            return _date
        }
        set{
            _date = newValue
        }
    }
    
    var weatherType: String {
        get{
            if _weatherType == nil {
                _weatherType = ""
            }
            return _weatherType
        }
        set{
            _weatherType = newValue
        }
    }
    
    var highTemperature: String {
        get{
            if _highTemperature == nil {
                _highTemperature = ""
            }
            return _highTemperature
        }
        set{
            _highTemperature = newValue
        }
    }
    
    var lowTemperature: String {
        get{
            if _lowTemperature == nil {
                _lowTemperature = ""
            }
            return _lowTemperature
        }
        set{
            _lowTemperature = newValue
        }
    }
    
    init(with jsonToParse: Dictionary<String,Any>) {
        if let temp = jsonToParse["temp"] as? Dictionary<String,Any> {
            if let min = temp["min"] as? Double {
                let kelvinToCelsius = convertKevinToDegrees(value: min)
                self.lowTemperature = "\(kelvinToCelsius)"
            }
            if let max = temp["max"] as? Double {
                let kelvinToCelsius = convertKevinToDegrees(value: max)
                self.highTemperature = "\(kelvinToCelsius)"
            }
        }
        
        if let weather = jsonToParse["weather"] as? [Dictionary<String,Any>] {
            if let main = weather[0]["main"] as? String {
                self.weatherType = main
            }
        }
        
        if let date = jsonToParse["dt"] as? Double {
            let unixConvertedDate = Date(timeIntervalSince1970: date)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateFormatter.dateFormat = "EEEE"
            self.date = unixConvertedDate.dayOfTheWeek()
        }
    }
    
}

extension Date {
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}
