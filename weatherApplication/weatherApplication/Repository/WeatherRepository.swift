//
//  WeatherRepository.swift
//  weatherApplication
//
//  Created by dvt on 2017/10/24.
//  Copyright © 2017 dvt. All rights reserved.
//

import Foundation
import UIKit

protocol WeatherRepository {
    func fetchCurrentWeatherData()
    func fetchWeatherForecastData()
}
