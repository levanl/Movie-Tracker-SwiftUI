//
//  PopularTVSeriesDetailView.swift
//  Movie-Tracker-SwiftUI
//
//  Created by Levan Loladze on 07.01.24.
//

import SwiftUI

struct PopularTVSeriesDetailView: View {
    
    // MARK: - Properties
    let tvSeries: PopularTVSeriesResult
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(tvSeries.posterPath)")) { phase in
                switch phase {
                case .empty:
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 200)
                        .clipped()
                    
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 400)
                        .clipped()
                    
                case .failure(_):
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 200)
                        .clipped()
                    
                @unknown default:
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 200)
                        .clipped()
                }
            }
            .frame(height: 400)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(tvSeries.name)
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("Country: \(tvSeries.originCountry.joined(separator: ", "))")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Text("Release Year: \(tvSeries.firstAirDate)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Text("Popularity: \(tvSeries.popularity)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Spacer()
            }
            .padding(16)
        }
    }
}
