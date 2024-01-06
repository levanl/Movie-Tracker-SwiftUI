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
                image.resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            .aspectRatio(contentMode: .fill)
            .frame(maxHeight: 1000)
            .cornerRadius(15)

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
        .padding()
    }
}
