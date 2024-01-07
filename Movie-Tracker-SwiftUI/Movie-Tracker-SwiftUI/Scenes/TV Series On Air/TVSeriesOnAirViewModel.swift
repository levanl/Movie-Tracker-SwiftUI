//
//  TVSeriesOnAirViewModel.swift
//  Movie-Tracker-SwiftUI
//
//  Created by Levan Loladze on 05.01.24.
//


import SwiftUI
import NetworkManager

// MARK: - MUSHAOBSS?
final class TVSeriesOnAirViewModel: ObservableObject {
    @Published public var TVSeriesOnAir: [TVSeriesOnAirModel] = []
//MARK: -init:
    init() {
        Task {
            await fetchTvSeriesOnAir()
        }
    }
    //MARK: -fetching method for the Series
    private func fetchTvSeriesOnAir() async {
        let urlString = "\(OnAirAPIConstants.endpoint)?api_key=\(OnAirAPIConstants.apiKey)&language=en-US&page=1"
        
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

//MARK: -constants for using in the fetching
struct OnAirAPIConstants {
    static let apiKey = "d5e1c3de8a3ef453ca0aa2c1ff4fadc6"
    static let endpoint = "https://api.themoviedb.org/3/tv/on_the_air"
}
