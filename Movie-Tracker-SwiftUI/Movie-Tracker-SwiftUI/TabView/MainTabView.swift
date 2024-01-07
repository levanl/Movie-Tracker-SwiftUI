//
//  MainTabView.swift
//  Movie-Tracker-SwiftUI
//
//  Created by Levan Loladze on 05.01.24.
//
import SwiftUI

struct MainTabView: View {
    
    // MARK: - Body
    var body: some View {
        TabView {
            PopularMoviesView()
                .tabItem {
                    Image(systemName: "movieclapper")
                    Text("Movies")
                }
            PopularTVSeriesView()
                .tabItem {
                    Image(systemName: "tv.inset.filled")
                    Text("TV Series")
                }
            MoviesInCinemaView()
                .tabItem {
                    Image(systemName: "sparkles.tv")
                    Text("Cinema")
                }
            TVSeriesOnAirView()
                .tabItem {
                    Image(systemName: "play.tv.fill")
                    Text("On Air")
                }
        }
    }
}

#Preview {
    MainTabView()
}
