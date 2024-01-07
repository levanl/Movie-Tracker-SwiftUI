//
//  PopularTVSeriesModel.swift
//  Movie-Tracker-SwiftUI
//
//  Created by Levan Loladze on 05.01.24.
//

import Foundation


// MARK: - PopularTVSeriesModel
struct PopularTVSeriesModel: Codable {
    let results: [PopularTVSeriesResult]

    enum CodingKeys: String, CodingKey {
        case results
    }
}

// MARK: - Result
struct PopularTVSeriesResult: Codable, Hashable {
    let id: Int
    let originCountry: [String]
    let originalLanguage, originalName, overview: String
    let popularity: Double
    let posterPath, firstAirDate, name: String

    enum CodingKeys: String, CodingKey {
        case id
        case originCountry = "origin_country"
        case originalLanguage = "original_language"
        case originalName = "original_name"
        case overview, popularity
        case posterPath = "poster_path"
        case firstAirDate = "first_air_date"
        case name
    }
}
