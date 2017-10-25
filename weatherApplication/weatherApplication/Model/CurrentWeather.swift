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
        
        get{
            if _cityName == nil {
                _cityName = ""
            }
            return _cityName
        }
        set{
            _cityName = newValue
        }
    }
    
    var date: String {
        
        get{
            if _date == nil {
                _date = ""
            }
            _date = todaysDate
            return _date
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
    
    var currentTemperature: Double {
        get{
            if _currentTemperature == nil {
                _currentTemperature = 0.0
            }
            return _currentTemperature
        }
        set{
            _currentTemperature = newValue
        }
    }
}
