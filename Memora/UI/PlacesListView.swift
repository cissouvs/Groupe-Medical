//
//  PlacesListView.swift
//  Memora
//
//  Created by Leskeu  on 06/08/2026.
//

import SwiftUI

struct PlacesListView: View {
    var places : [Place]
    var body: some View {
        NavigationStack {
            ZStack{
                Color.background
                    .ignoresSafeArea()
                List(places) { place in
                    NavigationLink {
                        PlaceDetailView(place: place)
                    } label: {
                        PlacesListRowView(place: place)
                    }
                }
            }
            .navigationTitle("Lieu de prise en charge")
        }
    }
}

#Preview {
    PlacesListView(places: emergencyPlace)
}
