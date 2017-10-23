//
//  WeatherVC.swift
//  weatherApplication
//
//  Created by dvt on 2017/10/20.
//  Copyright © 2017 dvt. All rights reserved.
//

import UIKit
import Alamofire

class WeatherVC: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var currentWeatherTypeLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var currentWeather = CurrentWeather()
    var forecast: Forecast!
    var forecasts = [Forecast]()
    override func viewDidLoad() {
        super.viewDidLoad()

        currentWeather.downloadWeatherDetails {
            self.downloadForecastData {
                self.updateMainUI()
                print("Done downloading data from Open Weather Api......")
            }
        }
    }
    
    func updateMainUI(){
        dateLabel.text = currentWeather.date
        currentTemperatureLabel.text = "\(currentWeather.currentTemperature)"
        currentWeatherTypeLabel.text = currentWeather.weatherType
        locationLabel.text = currentWeather.cityName
        currentWeatherImage.image = UIImage(named: currentWeather.weatherType)
    }
    
    func downloadForecastData(completion: @escaping DownloadComplete ){
        let forecastURL = URL(string: FORECAST_URL)!
        Alamofire.request(forecastURL).responseJSON(completionHandler: {
            response in
            if let dict = response.value as? Dictionary<String,Any>{
                if let list = dict["list"] as? [Dictionary<String,Any>] {
                    for item in list {
                        let forecast = Forecast(weatherDict: item)
                        self.forecasts.append(forecast)
                    }
                }
            }
            completion()
        })
    }
}

extension WeatherVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) 
            return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
}
