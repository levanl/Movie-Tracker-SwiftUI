//
//  PopularMoviesViewModel.swift
//  Movie-Tracker-SwiftUI
//
//  Created by Levan Loladze on 05.01.24.
//

import SwiftUI
import NetworkManager

class PopularMoviesViewModel: ObservableObject {
    @Published var movies: [Result] = []
    init() {
            Task {
                await fetchPopularMovies()
            }
        }

    func fetchPopularMovies() async {
        let apiKey = "a27bd3ea25aaafd9c7c1fea4183a7eba"
        let urlString = "https://api.themoviedb.org/3/movie/popular?api_key=\(apiKey)"
        
        do {
            let popularMovies: PopularMovie = try await NetworkManager.shared.fetchData(fromURL: urlString)
            await MainActor.run {
                movies = popularMovies.results
            }
        } catch {
            print(error)
        }
    }

}
