//
//  Constants.swift
//  weatherApplication
//
//  Created by dvt on 2017/10/20.
//  Copyright © 2017 dvt. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "894453542b710663fe4d5e3681f4aa1c"

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)\(Location.sharedInstance.lattitude!)\(LONGITUDE)\(Location.sharedInstance.longitude!)\(APP_ID)\(API_KEY)"

let FORECAST_URL = "http://samples.openweathermap.org/data/2.5/forecast/daily?lat=\(Location.sharedInstance.lattitude!)&lon=\(Location.sharedInstance.longitude!)&cnt=10&appid=894453542b710663fe4d5e3681f4aa1c"

typealias DownloadComplete = () -> ()
