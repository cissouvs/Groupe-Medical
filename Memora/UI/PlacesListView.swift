//
//  PlacesListView.swift
//  Memora
//
//  Created by Leskeu  on 06/08/2026.
//

import SwiftUI

struct PlacesListView: View {
    @Environment(PlacesListViewModel.self) var placesListVM
    
    @Binding var path: [PlaceScreen]
    
    var body: some View {
            ZStack{
                Color.background
                    .ignoresSafeArea()
                List(placesListVM.filteredPlaces) { place in
                    Button {
                        path.append(.detail(place))
                    } label: {
                        PlacesListRowView(place: place)
                    }
                }
                .navigationTitle("Lieux fréquentés")
            }
    }
}

#Preview {
    PlacesListView(path: .constant([]))
        .environment(PlacesListViewModel())
}
