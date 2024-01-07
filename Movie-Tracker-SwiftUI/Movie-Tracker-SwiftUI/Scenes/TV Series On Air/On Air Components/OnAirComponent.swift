//
//  OnAirComponent.swift
//  Movie-Tracker-SwiftUI
//
//  Created by Levan Loladze on 05.01.24.
//

import SwiftUI
import NetworkManager


struct TVSeriesOnAirCell: View {
    //MARK: -properties
    let TVSeriesOnAirmodel: TVSeriesOnAirModel

//MARK: -private properties
    private var asyncImageView: some View {
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
    }

    private var titleText: some View {
        Text(TVSeriesOnAirmodel.TVSeriesOnAirName)
            .font(.headline)
            .padding(.top, 4)
            .padding(.bottom, 2)
    }

    private var detailsHStack: some View {
        HStack {
            Text("\(TVSeriesOnAirmodel.TVSeriesOnAirYear)")
                .font(.subheadline)
            Spacer()
            Text("\(TVSeriesOnAirmodel.TVSeriesOnAirLanguage)")
                .font(.subheadline)
        }
        .foregroundColor(.gray)
    }

    private var cellVStack: some View {
        VStack(alignment: .leading) {
            asyncImageView
            titleText
            detailsHStack
        }
        .shadow(radius: 20)
        .padding()
    }
//MARK: -body
    var body: some View {
        cellVStack
    }
}
