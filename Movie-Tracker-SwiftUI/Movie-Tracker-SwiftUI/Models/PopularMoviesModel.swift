//
//  PopularMoviesModel.swift
//  Movie-Tracker-SwiftUI
//
//  Created by Levan Loladze on 05.01.24.
//


 
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
    let adult: Bool
    let backdropPath: String
    let genreIDS: [Int]
    let id: Int
    let originalLanguage: OriginalLanguage
    let originalTitle, overview: String
    let popularity: Double
    let posterPath, releaseDate, title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
 }
 
enum OriginalLanguage: String, Codable {
    case en = "en"
    case es = "es"
    case tl = "tl"
}


