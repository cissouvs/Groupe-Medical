//
//  PlacesView.swift
//  Memora
//
//  Created by apprenant92 on 11/08/2026.
//

import SwiftUI

enum PlaceScreen: Hashable {
    case list
    case map
    case detail(Place)
}

struct PlacesView: View {
    
    @State var placesListVM = PlacesListViewModel()
    
    @State var path: [PlaceScreen] = []
    
    @State private var showPopover = false

    @State private var selectedTab = 0
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                if selectedTab == 0 {
                    PlacesMapView(path: $path)
                }
                if selectedTab == 1 {
                    PlacesListView(path: $path)
                }
            }
            .navigationDestination(for: PlaceScreen.self) { screen in
                switch screen {
                case .list:
                    PlacesListView(path: $path)
                case .map:
                    PlacesMapView(path: $path)
                case .detail(let place):
                    PlaceDetailView(path: $path, place: place )
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showPopover.toggle()
                    }label: {
                        Image(systemName: "line.3.horizontal.decrease.circle")
                            .foregroundStyle(.mainText)
                    }.popover(isPresented: $showPopover) {
                        VStack {
                            Text("Liste des filtres")
                                .bold()
                                .font(.title)
                            ForEach(DifferentPlaces.allCases) { type in
                                Button {
                                    placesListVM.selectedFilter = type
                                } label: {
                                        Text(type.rawValue)
                                            .foregroundStyle(placesListVM.selectedFilter == type ? .accent: .mainText)
                                            .font(.title3)
                                            .bold()
                                            .padding(.horizontal, 40)
                                            .padding(.vertical, 10)
                                            .frame(width: 300, height: 70)
                                            .background(.white)
                                            .cornerRadius(40)
                                            .font(.title2)

                                }
                            }
                        } .frame(width: 300, height: 350)
                            .padding()
                            .background(Color.background)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                            .presentationCompactAdaptation(.popover)
                    }
                }
                ToolbarItem(placement: .principal) {
                    HStack(spacing: 20) {
                        Picker("", selection: $selectedTab) {
                            Text("Carte").tag(0)
                            Text("Liste").tag(1)
                        }
                    }
                    .pickerStyle(.segmented)
                    .frame(width: 280)
                }
            }
        }
        .environment(placesListVM)
    }
}

#Preview {
    PlacesView()
}
