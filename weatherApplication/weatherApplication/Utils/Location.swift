//
//  Location.swift
//  weatherApplication
//
//  Created by dvt on 2017/10/25.
//  Copyright © 2017 dvt. All rights reserved.
//

import CoreLocation

class Location {
    static var sharedInstance = Location()
    private init() {}
    
    var lattitude: Double!
    var longitude: Double!
}
