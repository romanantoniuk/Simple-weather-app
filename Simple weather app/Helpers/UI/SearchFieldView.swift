//
//  SearchFieldView.swift
//  Simple weather app
//
//  Created by Roman Antoniuk on 10.02.2024.
//

import SwiftUI

struct SearchFieldView: View {
    
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass").foregroundColor(.gray)
            TextField(text: $text) {
                Text("Search for a city")
                    .foregroundStyle(.textInactivePlaceholder)
            }
            .font(.system(size: 17, weight: .light))
            .foregroundStyle(.textLight)
        }
        .padding(8)
        .background(content: {
            Rectangle()
                .fill(Color(.backgroundInput))
        })
        .cornerRadius(10)
    }
    
}
