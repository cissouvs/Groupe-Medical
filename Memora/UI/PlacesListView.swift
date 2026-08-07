//
//  PlacesListView.swift
//  Memora
//
//  Created by Leskeu  on 06/08/2026.
//

import SwiftUI

struct PlacesListView: View {
    @State private var vm = PlacesListViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack{
                Color.background
                    .ignoresSafeArea()
                List(vm.filteredPlaces) { place in
                    NavigationLink {
                        PlaceDetailView(place: place)
                    } label: {
                        PlacesListRowView(place: place)
                    }
                }
                .navigationTitle("Lieux fréquentés")
            }
            .toolbar {
                ToolbarItem {
                    Menu {
                        ForEach(DifferentPlaces.allCases) { type in
                            Button {
                                vm.selectedFilter = type
                            } label: {
                                if vm.selectedFilter == type {
                                    Text(type.rawValue)
                                        .foregroundStyle(.tagRed)
                                        .font(.title)
                                } else {
                                    Text(type.rawValue)
                                        .foregroundStyle(.mainText)
                                        .font(.title)
                                }
                            }
                        }
                    } label: {
                        Label("Filtre", systemImage: "line.3.horizontal.decrease.circle")
                    }
                }
            }
        }
    }
}

#Preview {
    PlacesListView()
}
