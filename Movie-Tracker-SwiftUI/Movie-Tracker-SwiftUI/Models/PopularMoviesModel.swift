//
//  PopularMoviesModel.swift
//  Movie-Tracker-SwiftUI
//
//  Created by Levan Loladze on 05.01.24.
//

import Foundation

// MARK: - Welcome
struct PopularMovie: Decodable {
    let page: Int
    let results: [PopularMoviesResult]
    let totalPages, totalResults: Int
    
    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct PopularMoviesResult: Decodable {
    let id: Int
    let posterPath, title: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case posterPath = "poster_path"
        case title
    }
}


