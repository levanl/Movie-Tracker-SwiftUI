//
//  PopularTVSeriesView.swift
//  Movie-Tracker-SwiftUI
//
//  Created by Levan Loladze on 05.01.24.
//

import SwiftUI

struct PopularTVSeriesView: View {
    
    @StateObject var viewModel: PopularTVSeriesViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.popularTVSeries, id: \.id) { tvSeries in
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
            .listStyle(PlainListStyle()) // Set the list style to PlainListStyle
            .background(Color.clear)
            .navigationTitle("Popular TV Series")
            
        }
    }
}

#Preview {
    PopularTVSeriesView(viewModel: PopularTVSeriesViewModel())
}
