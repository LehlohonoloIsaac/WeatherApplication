//
//  WeatherViewModel.swift
//  weatherApplication
//
//  Created by dvt on 2017/10/24.
//  Copyright © 2017 dvt. All rights reserved.
//

import Foundation
import UIKit


class WeatherViewModel {
    private var currentWeather: CurrentWeather!

    func parseJSON(jsonToParse: Dictionary<String,Any>){
        currentWeather = CurrentWeather()
            
            if let name = jsonToParse["name"] as? String {
                currentWeather.cityName = name.capitalized
            }
            
            if let weather = jsonToParse["weather"] as? [Dictionary<String,Any>] {
                if let main = weather[0]["main"] as? String {
                    currentWeather.weatherType = main.capitalized
                }
            }
            
            if let main = jsonToParse["main"] as? Dictionary<String, Any> {
                if let currentTemperature = main["temp"] as? Double {
                    let kelvinToCelsius = convertKevinToDegrees(value: currentTemperature)
                    currentWeather.currentTemperature = kelvinToCelsius
                }
            }
        print(jsonToParse)
    }

    func showDisplayableWeatherIcon() -> String{
        return currentWeather.weatherType
    }
    
    func showDisplayableWeatherType() -> String {
        return currentWeather.weatherType
    }
    
    func showDisplayableCityName() -> String {
        return currentWeather.cityName
    }
    
    func showDisplayableCurrentTemperature() -> String {
        return "\(currentWeather.currentTemperature)° C"
    }
    
    func showDisplayableCurrentWeatherDate() -> String {
        return currentWeather.date
    }
    
}


