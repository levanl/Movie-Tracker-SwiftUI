//
//  MoviesInCinemaViewModel.swift
//  Movie-Tracker-SwiftUI
//
//  Created by Levan Loladze on 05.01.24.
//

import NetworkManager
import SwiftUI

// MARK: - MoviesInCinemaViewModel
final class MoviesInCinemaViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var moviesInCinema: [Result] = []
    
    // MARK: - Init
    init() {
        Task {
            await fetchMoviesInCinema()
        }
    }
    
    // MARK: - Private Methods
    private func fetchMoviesInCinema() async {
        let urlString = "https://api.themoviedb.org/3/movie/now_playing?language=en-US&page=1&api_key=\(Constants.apiKey)"
        do {
            let moviesInCinemaResponse: MoviesInCinemaResponse = try await NetworkManager.shared.fetchData(fromURL: urlString)
            await MainActor.run {
                moviesInCinema = moviesInCinemaResponse.results
            }
        } catch {
            print(error)
        }
    }
}

struct Constants {
    static let apiKey = "a7105b611883e6587847c2feebcbf151"
}
