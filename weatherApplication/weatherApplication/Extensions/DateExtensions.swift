//
//  Date.swift
//  weatherApplication
//
//  Created by dvt on 2017/10/25.
//  Copyright © 2017 dvt. All rights reserved.
//

import Foundation

extension Date {
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}
