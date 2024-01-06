//
//  PopularTVSeriesViewModel.swift
//  Movie-Tracker-SwiftUI
//
//  Created by Levan Loladze on 05.01.24.
//

import SwiftUI
import NetworkManager

class PopularTVSeriesViewModel: ObservableObject {
    
    @Published var bangladesh: String = "yoyo"
    @Published var popularTVSeries: [Result] = []

    init() {
        Task {
            await fetchPopularTVSeries()
        }
    }
    
    
    private func fetchPopularTVSeries() async {
        let urlString = "https://api.themoviedb.org/3/tv/popular?api_key=a27bd3ea25aaafd9c7c1fea4183a7eba"

        do {
            let popularTVSeriesResponse: PopularTVSeriesModel = try await NetworkManager.shared.fetchData(fromURL: urlString)
            await MainActor.run {
                popularTVSeries = popularTVSeriesResponse.results
            }
        } catch {
            print(error)
        }
    }
}
