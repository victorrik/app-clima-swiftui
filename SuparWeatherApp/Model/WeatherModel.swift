//
//  WeatherModel.swift
//  SuparWeatherApp
//
//  Created by Victor Andres Marcial on 30/01/23.
//

import Foundation

struct WeatherModel {
	let city: String
	let weather: String
	let description: String
	let iconURL: URL?
	let currentTemperature: String
	let minTemperature: String
	let maxTemperature: String
	let humidity: String
	let sunset: Date
	let sunrise: Date
	
	static let empty: WeatherModel = .init(city: "Meow", weather: "No meow", description: "Meow meow", iconURL: nil, currentTemperature: "0º", minTemperature: "0º Min.", maxTemperature: "0º Max.", humidity: "0%",sunset: .now, sunrise: .now)
	
}
