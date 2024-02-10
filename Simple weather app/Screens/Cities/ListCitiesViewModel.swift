//
//  ListCitiesViewModel.swift
//  Simple weather app
//
//  Created by Roman Antoniuk on 10.02.2024.
//

import SwiftUI

final class ListCitiesViewModel: ObservableObject {
    
    @Published var listFilteredCities: [CityData] = []
    @Published var searchText: String = "" {
        didSet {
            filterCities()
        }
    }
    
    private var loadedCities: [CityData] = [] {
        didSet {
            filterCities()
        }
    }
    
    private weak var apiClient: APIGeoClientProtocol?
    private let realmManager = RealmManager.shared
    
    init(apiClient: APIGeoClientProtocol) {
        self.apiClient = apiClient
        fetchCities()
    }
    
    func fetchCities() {
        apiClient?.fetchAllCitiesResults(endpoint: .allCities, completion: { response in
            switch response {
            case .success(let data):
                self.loadedCities = data
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
    
    func select(_ city: CityData) {
        if let existingObject = realmManager.getAllObjects(ofType: CityData.self).first {
            realmManager.updateObject(existingObject, with: ["name":city.name,
                                                             "country": city.country,
                                                             "latitude": city.latitude,
                                                             "longitude": city.longitude])
        } else {
            realmManager.addObject(city)
        }
        
    }
    
    private func filterCities() {
        if searchText.isEmpty {
            listFilteredCities = []
        } else {
            listFilteredCities = loadedCities.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
    
}




