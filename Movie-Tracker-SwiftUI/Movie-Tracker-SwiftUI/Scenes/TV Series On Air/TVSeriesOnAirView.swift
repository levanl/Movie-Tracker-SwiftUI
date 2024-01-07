//
//  TVSeriesOnAirView.swift
//  Movie-Tracker-SwiftUI
//
//  Created by Levan Loladze on 05.01.24.
//

import SwiftUI

struct TVSeriesOnAirView: View {
    @ObservedObject private var viewModel = TVSeriesOnAirViewModel()
    @State private var selectedTVSeries: TVSeriesOnAirModel? = nil
    @State private var searchText: String = ""

    var filteredTVSeries: [TVSeriesOnAirModel] {
        if searchText.isEmpty {
            return viewModel.TVSeriesOnAir
        } else {
            return viewModel.TVSeriesOnAir.filter {
                $0.TVSeriesOnAirName.localizedCaseInsensitiveContains(searchText)
            }
        }
    }

    var body: some View {
        VStack {
            Spacer()
            OnAirTVSeriesSearchBar(onAirTvSeriesSearchText: $searchText)

            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                    ForEach(filteredTVSeries, id: \.TVSeriesOnAirName) { series in
                        TVSeriesOnAirCell(TVSeriesOnAirmodel: series)
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity)
                            .onTapGesture {
                                selectedTVSeries = series
                            }
                    }
                }
                .padding()
            }
            .sheet(item: $selectedTVSeries) { series in
                TVSeriesOnAirDetailView(tvSeries: series)
            }
        }
    }
}


struct TVSeriesOnAirDetailView: View {
    let tvSeries: TVSeriesOnAirModel

    var body: some View {
        
        VStack {
            Spacer()
            Text(tvSeries.TVSeriesOnAirName)
                .font(.title)
                .bold()
                .padding()

            HStack {
                Text("Release: \(tvSeries.TVSeriesOnAirYear)")
                Spacer()
                Text("Original Languge: \(tvSeries.TVSeriesOnAirLanguage)")
            } .padding(.leading)
            .padding(.trailing)

            AsyncImage(url: URL(string: tvSeries.TVSeriesOnAirImage)) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            .cornerRadius(15)
            .padding()
            
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
    }
}

