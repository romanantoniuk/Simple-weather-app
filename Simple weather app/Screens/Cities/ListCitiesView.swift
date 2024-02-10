//
//  ListCitiesView.swift
//  Simple weather app
//
//  Created by Roman Antoniuk on 10.02.2024.
//

import SwiftUI

struct ListCitiesView: View {
    
    @StateObject var viewModel: ListCitiesViewModel
    var dismiss: (()->())

    var body: some View {
        NavigationView {
            BackgroundView()
                .overlay {
                    VStack(spacing: 10) {
                        SearchFieldView(text: $viewModel.searchText)
                            .padding(.horizontal, 16)
                            .padding(.bottom)
                        if viewModel.listFilteredCities.isEmpty {
                            Spacer()
                            Image(systemName: "list.bullet")
                                .resizable()
                                .frame(width: 284, height: 210)
                                .foregroundStyle(.textLight)
                            Spacer()
                        } else {
                            ScrollView {
                                LazyVStack(alignment: .leading, spacing: 20) {
                                    ForEach(viewModel.listFilteredCities) { city in
                                        CityCellView(city: city) { selectedCity in
                                            viewModel.select(selectedCity)
                                            dismiss()
                                        }
                                    }
                                }
                                .padding(.bottom, 8)
                            }
                        }
                    }
                    .navigationTitle("")
                    .navigationBarTitleDisplayMode(.inline)
                }
        }
    }
    
    
}
