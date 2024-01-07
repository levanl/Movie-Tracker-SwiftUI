//
//  PopularTVSeriesViewModel.swift
//  Movie-Tracker-SwiftUI
//
//  Created by Levan Loladze on 05.01.24.
//

import SwiftUI
import NetworkManager

final class PopularTVSeriesViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var popularTVSeries: [PopularTVSeriesResult] = []
    
    // MARK: - Init
    init() {
        Task {
            await fetchPopularTVSeries()
        }
    }
    
    // MARK: - GET Network Call
    private func fetchPopularTVSeries() async {
        let urlString = Constnats.popularTVSeriesEndpoint
        
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


// MARK: - Constants
struct Constnats {
    static var API_KEY = "a27bd3ea25aaafd9c7c1fea4183a7eba"
    static var popularTVSeriesEndpoint = "https://api.themoviedb.org/3/tv/popular?api_key=\(API_KEY)"
}
