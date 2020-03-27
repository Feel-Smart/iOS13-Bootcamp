//
//  WeatherModel.swift
//  Clima
//
//  Created by Matthew Musgrove on 3/8/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    
    let conditionID: Int
    let cityName: String
    let temperature: Double
    
    var temperatureString: String {
        return String(format: "%.1f", temperature)
    }
    
    var conditionName: String {
        switch conditionID {
        case 200...232:
            return "cloud.bolt" // thunderstorm
        case 300...321:
            return "cloud.drizzle" // drizzle
        case 500...504:
            return "cloud.rain" // rain
        case 511:
            return "cloud.sleet" // freezing rain
        case 520...531:
            return "cloud.rain" // rain
        case 600...622:
            return "cloud.snow" // snow
        case 700...781:
            return "cloud.fog" // fog
        case 800:
            return "sun.max" // clear
        case 801...804: // clouds
            return "cloud" // clouds
        default:
            return "smoke" // ash
        }
    }
    
}
