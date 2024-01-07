//
//  SeriesComponent.swift
//  Movie-Tracker-SwiftUI
//
//  Created by Levan Loladze on 05.01.24.
//

import SwiftUI

struct PopularTVSeriesCardView: View {
    
    // MARK: - Properties
    let tvSeries: PopularTVSeriesResult
    
    // MARK: - Body
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(tvSeries.posterPath)")) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            .cornerRadius(10)
            
            Text(tvSeries.name)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
        }
    }
}
