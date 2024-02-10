//
//  CityCellView.swift
//  Simple weather app
//
//  Created by Roman Antoniuk on 10.02.2024.
//

import SwiftUI

struct CityCellView: View {
    
    var city: CityData
    var onTap: ((CityData) -> ())
    
    var body: some View {
        HStack {
            Text(city.name + ", " + city.country)
                .font(.system(size: 24, weight: .light))
                .foregroundStyle(.textLight)
                .multilineTextAlignment(.leading)
                .padding(.horizontal, 16)
            
            Spacer()
        }
        .frame(height: 70)
        .background {
            Rectangle()
                .fill(Color(.backgroundCell))
                .cornerRadius(10)
            
        }
        .padding(.horizontal, 24)
        .onTapGesture {
            onTap(city)
        }
    }
    
}
