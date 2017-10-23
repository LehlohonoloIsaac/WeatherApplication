//
//  Forecast.swift
//  weatherApplication
//
//  Created by dvt on 2017/10/23.
//  Copyright © 2017 dvt. All rights reserved.
//

import UIKit
import Alamofire

class Forecast{
    
    private var _date: String!
    private var _weatherType: String!
    private var _highTemperature: String!
    private var _lowTemperature: String!
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var highTemperature: String {
        if _highTemperature == nil {
            _highTemperature = ""
        }
        return _highTemperature
    }
    
    var lowTemperature: String {
        if _lowTemperature == nil {
            _lowTemperature = ""
        }
        return _lowTemperature
    }

    init(weatherDict: Dictionary<String,Any>) {
        if let temp = weatherDict["temp"] as? Dictionary<String,Any> {
            if let min = temp["min"] as? Double {
                let kelvinToCelsius = convertKevinToDegrees(value: min)
                self._lowTemperature = "\(kelvinToCelsius)"
            }
            if let max = temp["max"] as? Double {
                let kelvinToCelsius = convertKevinToDegrees(value: max)
                self._highTemperature = "\(kelvinToCelsius)"
            }
        }
        
        if let weather = weatherDict["weather"] as? [Dictionary<String,Any>] {
            if let main = weather[0]["main"] as? String {
                self._weatherType = main
            }
        }
        
        if let date = weatherDict["dt"] as? Double {
            let unixConvertedDate = Date(timeIntervalSince1970: date)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateFormatter.dateFormat = "EEEE"
            self._date = unixConvertedDate.dayOfTheWeek()
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
