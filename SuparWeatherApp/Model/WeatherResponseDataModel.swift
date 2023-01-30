//
//  WeatherResponseDataModel.swift
//  SuparWeatherApp
//
//  Created by Victor Andres Marcial on 30/01/23.
//

import Foundation

struct WeatherResponseDataModel: Decodable {
	let city: String
	let weather: [WeatherDataModel]
	let temperature: TemperatureDataModel
	let sun:SunModel
	let timezone: Double
	
	enum CodingKeys: String, CodingKey{
		case city = "name"
		case weather
		case temperature = "main"
		case sun = "sys"
		case timezone
	}
}

struct SunModel: Decodable {
	let sunrise: Date
	let sunset: Date
	
}

struct WeatherDataModel: Decodable {
	let main: String
	let description: String
	let iconURLString: String
	
	enum CodingKeys: String, CodingKey  {
		case main
		case description
		case iconURLString = "icon"
	}
}

struct TemperatureDataModel: Decodable {
	let currentTemperature: Double
	let minTemperature: Double
	let maxTemperature: Double
	let humidity: Int
	
	
	enum CodingKeys: String, CodingKey {
		case currentTemperature = "temp"
		case minTemperature = "temp_min"
		case maxTemperature = "temp_max"
		case humidity
	}
}


//{
//		"coord": {
//				"lon": 2.159,
//				"lat": 41.3888
//		},
//		"weather": [
//				{
//						"id": 800,
//						"main": "Clear",
//						"description": "clear sky",
//						"icon": "01n"
//				}
//		],
//		"base": "stations",
//		"main": {
//				"temp": 8.38,
//				"feels_like": 5.95,
//				"temp_min": 6.19,
//				"temp_max": 9.74,
//				"pressure": 1025,
//				"humidity": 55
//		},
//		"visibility": 10000,
//		"wind": {
//				"speed": 4.12,
//				"deg": 300
//		},
//		"clouds": {
//				"all": 0
//		},
//		"dt": 1675103891,
//		"sys": {
//				"type": 2,
//				"id": 18549,
//				"country": "ES",
//				"sunrise": 1675062311,
//				"sunset": 1675098229
//		},
//		"timezone": 3600,
//		"id": 3128760,
//		"name": "Barcelona",
//		"cod": 200
//}
