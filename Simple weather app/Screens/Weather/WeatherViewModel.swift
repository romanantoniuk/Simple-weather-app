//
//  WeatherViewModel.swift
//  Simple weather app
//
//  Created by Roman Antoniuk on 10.02.2024.
//

import SwiftUI
import RealmSwift

final class WeatherViewModel: ObservableObject {
    
    @Published var weatherData: CurrentWeatherData?
    @Published var selectedCity: CityData
    
    private var selectedCityToken: NotificationToken?
    private let realmManager = RealmManager.shared
    
    private weak var apiClient: APIWeatherClientProtocol?
    
    init(apiClient: APIWeatherClientProtocol) {
        self.apiClient = apiClient
        let realmObject = try! Realm()
           realmObject.refresh()
           try! realmObject.write{
               realmObject.deleteAll()
           }

        if let existingObject = realmManager.getAllObjects(ofType: CityData.self).first {
            selectedCity = existingObject
        } else {
            let newObject = CityData(name: "Kyiv", country: "UA", latitude: "50.4500", longitude: "30.5233")
            realmManager.addObject(newObject)
            selectedCity = newObject
        }
        selectedCityToken = realmManager.observeObject(selectedCity) { [weak self] updatedCityObject in
            guard let updatedCityObject = updatedCityObject else { return }
            self?.selectedCity = updatedCityObject
            self?.fetchWeatherData()
        }
        fetchWeatherData()
    }
    
    func fetchWeatherData() {
        apiClient?.fetchCurrentWeather(endpoint: .current(selectedCity)) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let data):
                self.weatherData = data.current
            case .failure(let error):
                print(error.localizedDescription)
                self.weatherData = nil
            }
        }
    }
    
}
