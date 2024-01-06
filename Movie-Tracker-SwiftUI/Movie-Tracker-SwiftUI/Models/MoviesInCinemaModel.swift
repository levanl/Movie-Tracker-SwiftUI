//
//  MoviesInCinemaModel.swift
//  Movie-Tracker-SwiftUI
//
//  Created by Levan Loladze on 05.01.24.
//

import Foundation

// MARK: - MoviesInCinemaResponse
struct MoviesInCinemaResponse: Decodable {
    let results: [Result]
}

// MARK: - Result
struct Result: Decodable, Identifiable, Hashable {
    var id = UUID()
    let originalTitle, overview: String
    let popularity: Double
    let posterPath, releaseDate: String
    let voteAverage: Double
    let voteCount: Int
    
    enum CodingKeys: String, CodingKey {
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
