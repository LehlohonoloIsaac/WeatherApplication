//
//  WeatherVC.swift
//  weatherApplication
//
//  Created by dvt on 2017/10/20.
//  Copyright © 2017 dvt. All rights reserved.
//

import UIKit

class WeatherVC: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var currentWeatherTypeLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

