//
//  PopularTVSeriesView.swift
//  Movie-Tracker-SwiftUI
//
//  Created by Levan Loladze on 05.01.24.
//

import SwiftUI

struct PopularTVSeriesView: View {
    
    @StateObject var viewModel: PopularTVSeriesViewModel
    
    var body: some View {
        Text(viewModel.bangladesh)
    }
}

#Preview {
    PopularTVSeriesView(viewModel: PopularTVSeriesViewModel())
}
