//
//  PopularTVSeriesView.swift
//  Movie-Tracker-SwiftUI
//
//  Created by Levan Loladze on 05.01.24.
//

import SwiftUI

struct PopularTVSeriesView: View {
    
    // MARK: - Properties
    @StateObject var viewModel = PopularTVSeriesViewModel()
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            List(viewModel.popularTVSeries, id: \.id) { tvSeries in
                NavigationLink(destination: {
                    PopularTVSeriesDetailView(tvSeries: tvSeries)
                },label: {
                    PopularTVSeriesCardView(tvSeries: tvSeries)
                })
            }
            .listStyle(PlainListStyle())
            .background(Color.clear)
            .navigationTitle("Popular TV Series")
        }
    }
}

#Preview {
    PopularTVSeriesView(viewModel: PopularTVSeriesViewModel())
}

