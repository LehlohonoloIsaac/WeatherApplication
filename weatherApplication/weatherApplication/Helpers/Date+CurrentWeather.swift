//
//  Date+CurrentWeather.swift
//  weatherApplication
//
//  Created by dvt on 2017/10/25.
//  Copyright © 2017 dvt. All rights reserved.
//

import Foundation
import UIKit

var todaysDate: String = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .long
    dateFormatter.timeStyle = .none
    let currentDate = dateFormatter.string(from: Date())
    return  "Today, \(currentDate)"
}()
