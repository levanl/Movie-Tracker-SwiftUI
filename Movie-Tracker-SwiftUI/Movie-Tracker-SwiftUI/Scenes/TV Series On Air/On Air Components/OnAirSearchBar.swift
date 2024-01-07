//
//  OnAirSearchBar.swift
//  Movie-Tracker-SwiftUI
//
//  Created by Salome Lapiashvili on 07.01.24.
//

import SwiftUI


struct OnAirTVSeriesSearchBar: View {
//MARK: -Properties:
    @Binding var onAirTvSeriesSearchText: String

// MARK: -Private Properties:
    private var searchBarHStack: some View {
        HStack {
            TextField("Search for TV Series on air right now", text: $onAirTvSeriesSearchText)
                .padding(8)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal, 10)
                .padding(.vertical, 5)

            Spacer()

            if !onAirTvSeriesSearchText.isEmpty {
                Button(action: {
                    onAirTvSeriesSearchText = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
            }
        }
    }
//MARK: -Body:
    var body: some View {
        searchBarHStack
    }
}
