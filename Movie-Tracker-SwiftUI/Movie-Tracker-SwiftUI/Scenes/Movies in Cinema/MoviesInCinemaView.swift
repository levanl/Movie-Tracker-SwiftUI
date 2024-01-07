//
//  MoviesInCinemaView.swift
//  Movie-Tracker-SwiftUI
//
//  Created by Levan Loladze on 05.01.24.
//

import SwiftUI

struct MoviesInCinemaView: View {
    // MARK: - Properties
    @StateObject var viewModel = MoviesInCinemaViewModel()
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            ScrollView {
                moviesInCinemaGrid
            }
        }
    }
    
    // MARK: - CinemaGrid
    private var moviesInCinemaGrid: some View {
        NavigationStack {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(viewModel.moviesInCinema) { movie in
                    NavigationLink(value: movie, label: {
                        MoviesInCinemaCardView(movieInCinema: movie)
                    })
                        .padding(.bottom, 10)
                }
            }
            .navigationTitle("Movies in Cinema")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: Result.self) { movie in
                MoviesInCinemaDetailsView(movieInCinema: movie)
            }
        }
    }
}

// MARK: - Preview
#Preview {
    MoviesInCinemaView()
}
