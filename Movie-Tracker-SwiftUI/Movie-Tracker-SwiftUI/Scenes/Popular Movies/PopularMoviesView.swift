//
//  PopularMoviesView.swift
//  Movie-Tracker-SwiftUI
//
//  Created by Levan Loladze on 05.01.24.
//

import SwiftUI

struct PopularMoviesView: View {
    @ObservedObject var viewModel = PopularMoviesViewModel()

    var body: some View {
        NavigationStack {
            List(viewModel.movies, id: \.id) { movie in
                Text(movie.title)
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.posterPath)")) { image in
                                            image.resizable()
                                                .aspectRatio(contentMode: .fit)
                                        } placeholder: {
                                            ProgressView()
                                        }
                                        .cornerRadius(10)
            }
            .navigationBarTitle("Popular Movies")
        }
       
    }
}

struct PopularMoviesView_Previews: PreviewProvider {
    static var previews: some View {
        PopularMoviesView()
    }
}
