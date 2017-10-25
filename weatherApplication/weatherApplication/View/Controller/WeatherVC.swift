//
//  WeatherVC.swift
//  weatherApplication
//
//  Created by dvt on 2017/10/20.
//  Copyright © 2017 dvt. All rights reserved.
//

import UIKit
import Alamofire
import CoreLocation

class WeatherVC: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var currentWeatherTypeLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var currentWeather = CurrentWeather()
    var weatherViewModel = WeatherViewModel()
    let weatherForecastsViewModel = WeatherForecastsViewModel()
    let weatherRepositoryImplementation = WeatherRepositoryImplementation()
    var locationManager = CLLocationManager()
    var currentCoordinate: CLLocationCoordinate2D?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureLocationManager()
        weatherRepositoryImplementation.delegate = self
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Hello world")
    }
    func configureLocationManager(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startMonitoringSignificantLocationChanges()
    }
    
    func updateMainUI(){
        dateLabel.text = weatherViewModel.showDisplayableCurrentWeatherDate()
        currentTemperatureLabel.text = weatherViewModel.showDisplayableCurrentTemperature()
        currentWeatherTypeLabel.text = weatherViewModel.showDisplayableWeatherType()
        locationLabel.text = weatherViewModel.showDisplayableCityName()
        currentWeatherImage.image = UIImage(named: weatherViewModel.showDisplayableWeatherIcon())
    }
    
    func updateLocation(_ manager: CLLocationManager,
                        didUpdateLocations locations: [CLLocation],
                        updateComplete: @escaping(Double?,Double?) -> Void){
        manager.stopUpdatingLocation()
        guard let currentLocation = locations.first else {return}
        currentCoordinate = currentLocation.coordinate
        Location.sharedInstance.lattitude = currentCoordinate?.latitude
        Location.sharedInstance.longitude = currentCoordinate?.longitude
        updateComplete(Location.sharedInstance.lattitude, Location.sharedInstance.longitude)
    }
    
}

extension WeatherVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as? WeatherCell {
            let forecast = weatherForecastsViewModel.weatherForecasts[indexPath.row]
            cell.configure(with: forecast)
            return cell
        }
        return WeatherCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherForecastsViewModel.weatherForecastsCount
    }
}

extension WeatherVC: WeatherDelegate {
    func didFinishDownloadingWeatherData(with currentWeatherJSON: Dictionary<String, Any>?) {
        weatherRepositoryImplementation.fetchWeatherForecastData()
        weatherViewModel.parseJSON(jsonToParse: currentWeatherJSON!)
        self.updateMainUI()
    }
    
    func didFinishDownloadingWeatherForecastData(with weatherForecast: Dictionary<String, Any>?) {
        weatherForecastsViewModel.parseJSON(jsonToParse: weatherForecast!)
        tableView.reloadData()
    }
}

extension WeatherVC: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        updateLocation(manager, didUpdateLocations: locations, updateComplete: { (lattitude,longitude) in
            self.weatherRepositoryImplementation.fetchCurrentWeatherData()
        })
    }
}
