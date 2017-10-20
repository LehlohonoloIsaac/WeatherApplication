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

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)-36\(LONGITUDE)123\(APP_ID)\(API_KEY)"

typealias DownloadComplete = () -> ()
