//
//  OnAirComponent.swift
//  Movie-Tracker-SwiftUI
//
//  Created by Levan Loladze on 05.01.24.
//

import SwiftUI
import NetworkManager


struct TVSeriesOnAirCell: View {
    let TVSeriesOnAirmodel: TVSeriesOnAirModel

    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: TVSeriesOnAirmodel.TVSeriesOnAirImage)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            .aspectRatio(contentMode: .fill)
            .frame(maxHeight: 1000)
            .cornerRadius(15)
            .shadow(radius: 50)

            Text(TVSeriesOnAirmodel.TVSeriesOnAirName)
                .font(.headline)
                .padding(.top, 4)
                .padding(.bottom, 2)

            HStack {
                Text("\(TVSeriesOnAirmodel.TVSeriesOnAirYear)")
                    .font(.subheadline)
                Spacer()
                Text("\(TVSeriesOnAirmodel.TVSeriesOnAirLanguage)")
                    .font(.subheadline)
            }
            .foregroundColor(.gray)
            
        }
        .shadow(radius: 20)
        .padding()
        
    }
}

struct OnAirTVSeriesSearchBar: View {
    @Binding var onAirTvSeriesSearchText: String

    var body: some View {
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
}
