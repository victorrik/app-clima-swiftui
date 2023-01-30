//
//  WeatherModelMapper.swift
//  SuparWeatherApp
//
//  Created by Victor Andres Marcial on 30/01/23.
//

import Foundation

struct WeatherModelMapper {
	func mapDataModelToModel(dataModel:WeatherResponseDataModel) -> WeatherModel {
		guard let weather = dataModel.weather.first else{
			return .empty
		}
		let temperature = dataModel.temperature
		let sunsetWithTimeZone = dataModel.sun.sunset.addingTimeInterval(dataModel.timezone - Double(TimeZone.current.secondsFromGMT()))
		let sunriseWithTimeZone = dataModel.sun.sunrise.addingTimeInterval(dataModel.timezone - Double(TimeZone.current.secondsFromGMT()))
		return WeatherModel(city: dataModel.city,
												weather: weather.main,
												description: "\(weather.description)",
												iconURL: URL(string: "http://openweathermap.org/img/wn/\(weather.iconURLString)@2x.png"),
												currentTemperature: "\(Int(temperature.currentTemperature))º",
												minTemperature: "\(Int(temperature.minTemperature))º Min.",
												maxTemperature: "\(Int(temperature.maxTemperature))º Max.",
												humidity: "\(temperature.humidity)%",
												sunset: sunsetWithTimeZone,
												sunrise: sunriseWithTimeZone)
		
	}
}
