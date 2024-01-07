//
//  TVSeriesOnAirDetailView.swift
//  Movie-Tracker-SwiftUI
//
//  Created by Salome Lapiashvili on 07.01.24.
//

import SwiftUI

struct TVSeriesOnAirDetailView: View {
    //MARK: -properties
    let tvSeries: TVSeriesOnAirModel

    //MARK: -Private properties
    private var detailsHStack: some View {
        HStack {
            Text("Release: \(tvSeries.TVSeriesOnAirYear)")
            Spacer()
            Text("Original Language: \(tvSeries.TVSeriesOnAirLanguage)")
        }
        .padding(.leading)
        .padding(.trailing)
    }

    private var detailsViewImages: some View {
        AsyncImage(url: URL(string: tvSeries.TVSeriesOnAirImage)) { image in
            image.resizable()
                .aspectRatio(contentMode: .fit)
        } placeholder: {
            ProgressView()
        }
        .cornerRadius(15)
        .padding()
    }

    private var overviewZStackView: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color.gray.opacity(70), Color.white.opacity(2)]),
                startPoint: .bottom,
                endPoint: .top
            )
            .edgesIgnoringSafeArea(.all)

            Text(tvSeries.TVSeriesOnAirOverview)
                .foregroundColor(.black)
                .padding(40)

            Spacer()
        }
    }

    private var TVSeriesOnAirTitle: some View {
        Text(tvSeries.TVSeriesOnAirName)
            .font(.title)
            .bold()
            .padding()
    }

    private var OnAirDetailsViewVStack: some View {
        VStack {
            TVSeriesOnAirTitle
            detailsHStack
            detailsViewImages
            overviewZStackView
        }
    }

    // MARK: -Body:
    var body: some View {
        OnAirDetailsViewVStack
    }
}
