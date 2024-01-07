//
//  TVSeriesOnAirView.swift
//  Movie-Tracker-SwiftUI
//
//  Created by Levan Loladze on 05.01.24.
//

import SwiftUI

struct TVSeriesOnAirView: View {
    // MARK: -Private properties
    @ObservedObject private var viewModel = TVSeriesOnAirViewModel()
    @State private var selectedTVSeries: TVSeriesOnAirModel? = nil
    @State private var searchText: String = ""

    // MARK: -Computed property for filtering the series
    private var filteredTVSeries: [TVSeriesOnAirModel] {
        if searchText.isEmpty {
            return viewModel.TVSeriesOnAir
        } else {
            return viewModel.TVSeriesOnAir.filter {
                $0.TVSeriesOnAirName.localizedCaseInsensitiveContains(searchText)
            }
        }
    }

    // MARK: LazyGrid
    private var grid: some View {
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

    // MARK: -Scrollable GridView
    private var OnAirGridView: some View {
        VStack {
            Spacer()
            OnAirTVSeriesSearchBar(onAirTvSeriesSearchText: $searchText)

            ScrollView {
                grid
            }
            .sheet(item: $selectedTVSeries) { series in
                TVSeriesOnAirDetailView(tvSeries: series)
            }
        }
    }

    // MARK: -Body
    var body: some View {
        OnAirGridView
    }
}




