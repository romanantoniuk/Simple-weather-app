//
//  WeatherView.swift
//  Simple weather app
//
//  Created by Roman Antoniuk on 10.02.2024.
//

import SwiftUI

struct WeatherView: View {
        
    @StateObject var viewModel: WeatherViewModel
    var tappedToSearch: (()->())
    
    var body: some View {
        NavigationView {
            BackgroundWithImageView()
                .overlay {
                    VStack(spacing: 0) {
                        Spacer(minLength: 60)
                        VStack(alignment: .center, spacing: 0) {
                            Text(viewModel.selectedCity.name)
                                .font(.system(size: 34, weight: .regular))
                                .foregroundStyle(.textLight)
                                .multilineTextAlignment(.center)
                            Text(viewModel.weatherData?.temperature != nil ? "\(Int(viewModel.weatherData!.temperature.rounded()))°" : "- °")
                                .font(.system(size: 96, weight: .thin))
                                .foregroundStyle(.textLight)
                            Text("Wind speed")
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundStyle(.textInactivePlaceholder)
                            Text(viewModel.weatherData?.windSpeed != nil ? "\(Int(viewModel.weatherData!.windSpeed.rounded())) km/h" : "- km/h")
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundStyle(.textLight)
                        }
                        .padding(.horizontal)
                        Spacer()
                        Image(.house)
                    }
                    .ignoresSafeArea()
                }
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            tappedToSearch()
                        } label: {
                            Image(systemName: "magnifyingglass")
                                .foregroundStyle(.textLight)
                        }
                    }
                }
        }
        
    }
    
}
