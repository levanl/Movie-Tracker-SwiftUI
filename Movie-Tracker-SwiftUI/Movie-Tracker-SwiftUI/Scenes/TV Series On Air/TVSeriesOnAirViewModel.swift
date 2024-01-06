//
//  TVSeriesOnAirViewModel.swift
//  Movie-Tracker-SwiftUI
//
//  Created by Levan Loladze on 05.01.24.
//

import SwiftUI
import NetworkManager

final class TVSeriesOnAirViewModel: ObservableObject {
    @Published public var TVSeriesOnAir: [TVSeriesOnAirModel] = []
    
    init() {
        Task {
            await fetchTvSeriesOnAir()
        }
    }
    
    private func fetchTvSeriesOnAir() async {
        let urlString = "https://api.themoviedb.org/3/tv/on_the_air?api_key=d5e1c3de8a3ef453ca0aa2c1ff4fadc6&language=en-US&page=1"
        do {
            let response: TVSeriesOnAirResponse = try await NetworkManager.shared.fetchData(fromURL: urlString)
            await MainActor.run {
                TVSeriesOnAir = response.results.map { TVSeriesOnAirModel($0) }
            }
        } catch {
            print("Error fetching TV series on air: \(error.localizedDescription)")
        }
    }
}
