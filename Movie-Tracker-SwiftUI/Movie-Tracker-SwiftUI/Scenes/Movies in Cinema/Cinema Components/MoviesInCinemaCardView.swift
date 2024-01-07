//
//  MoviesInCinemaCardView.swift
//  Movie-Tracker-SwiftUI
//
//  Created by Anna Sumire on 05.01.24.
//

import SwiftUI

struct MoviesInCinemaCardView: View {
    
    // MARK: - Properties
    var movieInCinema: Result
    
    // MARK: - Body
    var body: some View {
        mainVStack
    }
    
    private var mainVStack: some View {
        VStack(alignment: .center) {
            movieInCinemaAsyncImage
            infoVStack
        }
        .frame(maxWidth: 140)
        .padding(EdgeInsets(top: 20, leading: 15, bottom: 15, trailing: 15))
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: .gray, radius: 6, x: 0, y: 6)
    }
    
    private var movieInCinemaAsyncImage: some View {
        AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movieInCinema.posterPath)")) { image in
            image
                .resizable()
                .scaledToFill()
            
        } placeholder: {
            ProgressView()
        }
        .frame(maxWidth: 120, maxHeight: 150)
    }
    
    
    private var infoVStack: some View {
        VStack {
            Text(movieInCinema.originalTitle)
                .foregroundColor(Color.primary)
                .font(.headline)
                .padding(.top, 10)
                .lineLimit(1)
            
            Text("Rating: \(String(format: "%.1f", movieInCinema.voteAverage)) ⭐️")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }
}
