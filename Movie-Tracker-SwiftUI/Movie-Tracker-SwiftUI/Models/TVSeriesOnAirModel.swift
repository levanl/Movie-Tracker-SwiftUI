//
//  TVSeriesOnAirModel.swift
//  Movie-Tracker-SwiftUI
//
//  Created by Levan Loladze on 05.01.24.
//

import SwiftUI

struct TVSeriesOnAirModel {
    let TVSeriesOnAirName: String
    let TVSeriesOnAirYear: String
    let TVSeriesOnAirLanguage: String
    let TVSeriesOnAirImage: String
    let TVSeriesOnAirOverview: String
    
    init(_ tvSeries: TVSeriesOnAir) {
        TVSeriesOnAirName = tvSeries.original_name
        TVSeriesOnAirYear = tvSeries.first_air_date
        TVSeriesOnAirLanguage = tvSeries.original_language
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
    let original_language: String
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
