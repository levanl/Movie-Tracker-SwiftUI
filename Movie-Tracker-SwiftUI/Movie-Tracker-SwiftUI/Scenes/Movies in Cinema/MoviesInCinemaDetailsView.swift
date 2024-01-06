//
//  MoviesInCinemaDetailsView.swift
//  Movie-Tracker-SwiftUI
//
//  Created by Anna Sumire on 05.01.24.
//

import SwiftUI

struct MoviesInCinemaDetailsView: View {
    // MARK: - Properties
    var movieInCinema: Result
    
    // MARK: - Body
    var body: some View {
       moviesInCinemaScrollView
    }
    
    private var moviesInCinemaScrollView: some View {
        ScrollView {
            mainVStack
        }
    }
    
    private var mainVStack: some View {
        VStack(spacing: 10) {
            moviesInCinemaAsyncImage
            detailsVStack
        }
        .padding()
    }
    
    private var moviesInCinemaAsyncImage: some View {
        AsyncImage(url: URL(string:
            "https://image.tmdb.org/t/p/w500\(movieInCinema.posterPath)")) { image in
            image
                .resizable()
                .scaledToFit()
            
        } placeholder: {
            ProgressView()
        }
        .frame(maxWidth: 270)
        .cornerRadius(10)
        .shadow(radius: 10)
    }
    
    private var detailsVStack: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("\(movieInCinema.originalTitle)")
                .font(.custom("Avenir Next", size: 28))
                .fontWeight(.bold)
            
            Text("Release Date: \(movieInCinema.releaseDate)")
                .font(.custom("Avenir Next", size: 14))
            
            Text("Popularity: \(String(format: "%.2f", movieInCinema.popularity))")
                .font(.custom("Avenir Next", size: 14))
            
            Text("Vote Average: \(String(format: "%.1f", movieInCinema.voteAverage)) ⭐️")
                .font(.custom("Avenir Next", size: 14))
            
            Text("Vote Count: \(movieInCinema.voteCount)")
                .font(.custom("Avenir Next", size: 14))
            
            Text("\(movieInCinema.overview)")
                .font(.custom("Avenir Next", size: 14))
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 0)
    }
}
