//
//  WeatherForecastsViewModel.swift
//  weatherApplication
//
//  Created by dvt on 2017/10/24.
//  Copyright © 2017 dvt. All rights reserved.
//

import Foundation
import UIKit

class WeatherForecastsViewModel {
    private var _weatherForecasts =  [WeatherForecast]()
    
    var weatherForecasts: [WeatherForecast] {
        get{
            return self._weatherForecasts
        }
    }
    
    var weatherForecastsCount: Int {
        get{
            return _weatherForecasts.count
        }
    }
    
    func parseJSON(jsonToParse: Dictionary<String,Any>) {
        if let list = jsonToParse["list"] as? [Dictionary<String,Any>] {
            for item in list {
                let forecast = WeatherForecast(with: item)
                self._weatherForecasts.append(forecast)
            }
            self._weatherForecasts.removeFirst()
        }
    }
    
}
