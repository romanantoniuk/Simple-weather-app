//
//  AppCoordinatorView.swift
//  Simple weather app
//
//  Created by Roman Antoniuk on 10.02.2024.
//

import SwiftUI

struct AppCoordinatorView: View {
    
    private var apiClient = APIClient()
    
    @State var stack: [Screen] = [.weatherView]
    
    var body: some View {
        NavigationView {
            CustomNavigationStack(stack: $stack) { screen in
                switch screen {
                case .weatherView:
                    WeatherView(viewModel: .init(apiClient: apiClient), tappedToSearch: pushToSearch)
                case .listCitiesView:
                    ListCitiesView(viewModel: .init(apiClient: apiClient), dismiss: pop)
                }
            }
        }
    }
    
    private func pushToSearch() {
        stack.append(.listCitiesView)
    }
        
    private func pop() {
        stack = stack.dropLast()
    }
    
}
