//
//  TVSeriesOnAirView.swift
//  Movie-Tracker-SwiftUI
//
//  Created by Levan Loladze on 05.01.24.
//

import SwiftUI


struct TVSeriesOnAirView: View {
    @ObservedObject private var viewModel = TVSeriesOnAirViewModel()

    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                ForEach(viewModel.TVSeriesOnAir, id: \.TVSeriesOnAirName) { series in
                    TVSeriesOnAirCell(TVSeriesOnAirmodel: series)
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                }
            }
            .padding()
        }
    }
}


