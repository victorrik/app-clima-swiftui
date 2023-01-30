//
//  WeatherViewModel.swift
//  SuparWeatherApp
//
//  Created by Victor Andres Marcial on 30/01/23.
//

import Foundation
//https://api.openweathermap.org/data/2.5/weather?q=acapulco&appid=0428a62de7bac5378ed26374b8a587be&units=metric&lang=esp

final class WeatherViewModel: ObservableObject {
	@Published var weatherModel: WeatherModel = .empty
	private let weatherModelMapper: WeatherModelMapper = WeatherModelMapper()
	
	func getWeather(city:String) async {
		let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=0428a62de7bac5378ed26374b8a587be&units=metric&lang=es")!
		do{
			async let (data,_) = try await URLSession.shared.data(from: url)
			let dataModel = try! await JSONDecoder().decode(WeatherResponseDataModel.self, from: data)
			DispatchQueue.main.async {
				self.weatherModel = self.weatherModelMapper.mapDataModelToModel(dataModel: dataModel)
			}
		}catch{
			print(error.localizedDescription)
		}
	}
}
