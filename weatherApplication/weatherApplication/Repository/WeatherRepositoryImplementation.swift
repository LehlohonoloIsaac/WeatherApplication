//
//  WeatherRepositoryImplementation.swift
//  weatherApplication
//
//  Created by dvt on 2017/10/24.
//  Copyright © 2017 dvt. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

protocol WeatherDelegate {
    func didFinishDownloadingWeatherData(with currentWeatherJSON: Dictionary<String,Any>?)
    func didFinishDownloadingWeatherForecastData(with weatherForecast: Dictionary<String,Any>?)
}


class WeatherRepositoryImplementation {
    var delegate: WeatherDelegate!
}

extension WeatherRepositoryImplementation: WeatherRepository {
    func fetchCurrentWeatherData() {
        let currentWeatherURL = URL(string: CURRENT_WEATHER_URL)!
        Alamofire.request(currentWeatherURL).responseJSON(completionHandler: { [weak self] response in
            let result = response
            
            if let dict = result.value as? Dictionary<String,Any> {
                      self?.delegate.didFinishDownloadingWeatherData(with: dict)
            }
        })
    }
    
    func fetchWeatherForecastData() {
            let forecastURL = URL(string: FORECAST_URL)!
            Alamofire.request(forecastURL).responseJSON(completionHandler: {
                response in
                if let dict = response.value as? Dictionary<String,Any>{
                    self.delegate.didFinishDownloadingWeatherForecastData(with: dict)
                }
            })
    }
    
    
}
