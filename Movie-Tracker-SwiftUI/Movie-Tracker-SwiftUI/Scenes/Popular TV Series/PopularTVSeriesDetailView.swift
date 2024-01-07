//
//  PopularTVSeriesDetailView.swift
//  Movie-Tracker-SwiftUI
//
//  Created by Levan Loladze on 07.01.24.
//

import SwiftUI

struct PopularTVSeriesDetailView: View {
    
    // MARK: - Properties
    let tvSeries: PopularTVSeriesResult
    
    // MARK: - Body
    var body: some View {
        PopularTVSeriesDetailCardView(tvSeries: tvSeries)
    }
}
