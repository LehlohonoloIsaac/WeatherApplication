//
//  WeatherCell.swift
//  weatherApplication
//
//  Created by dvt on 2017/10/23.
//  Copyright © 2017 dvt. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weatherTypeLabel: UILabel!
    @IBOutlet weak var highTemperatureLabel: UILabel!
    @IBOutlet weak var lowTemperatureLabel: UILabel!
    
    func configure(with forecast: WeatherForecast){
        weatherIcon.image = UIImage(named: forecast.weatherType)
        dayLabel.text = forecast.date
        weatherTypeLabel.text = forecast.weatherType
        highTemperatureLabel.text = "\(forecast.highTemperature)"
        lowTemperatureLabel.text = "\(forecast.lowTemperature)"
    }
}
