//
//  TVSeriesOnAirModel.swift
//  Movie-Tracker-SwiftUI
//
//  Created by Levan Loladze on 05.01.24.
//

import SwiftUI

struct TVSeriesOnAirModel: Identifiable {
    let TVSeriesOnAirName: String
    let TVSeriesOnAirYear: String
    var TVSeriesOnAirLanguage: String
    let TVSeriesOnAirImage: String
    let TVSeriesOnAirOverview: String
    let id = UUID()
    
    init(_ tvSeries: TVSeriesOnAir) {
        TVSeriesOnAirName = tvSeries.original_name
        TVSeriesOnAirYear = String(tvSeries.first_air_date.prefix(4))
        TVSeriesOnAirLanguage = tvSeries.original_language.uppercased()
        TVSeriesOnAirImage = "https://image.tmdb.org/t/p/w500" + tvSeries.poster_path
        TVSeriesOnAirOverview = tvSeries.overview
    }
}


extension TVSeriesOnAirModel {
    private enum CodingKeys: String, CodingKey {
        case TVSeriesOnAirName = "original_name"
        case TVSeriesOnAirYear = "first_air_date"
        case TVSeriesOnAirLanguage = "original_language"
        case TVSeriesOnAirImage = "poster_path"
        case TVSeriesOnAirOverview = "overview"
    }
}

struct TVSeriesOnAirResponse: Decodable {
    let results: [TVSeriesOnAir]

    private enum CodingKeys: String, CodingKey {
        case results
    }
}

struct TVSeriesOnAir: Decodable {
    let original_name: String
    let first_air_date: String
    var original_language: String
    let poster_path: String
    let overview: String
    

    private enum CodingKeys: String, CodingKey {
        case original_name
        case first_air_date
        case original_language
        case poster_path
        case overview
    }
}
