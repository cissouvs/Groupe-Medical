//
//  PlacesListView.swift
//  Memora
//
//  Created by Leskeu  on 06/08/2026.
//

import SwiftUI

struct PlacesListView: View {
    @State private var vm = PlacesListViewModel()
    @State private var showPopover = false
    
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
                                    vm.selectedFilter = type
                                } label: {
                                        Text(type.rawValue)
                                            .foregroundStyle(vm.selectedFilter == type ? .accent: .mainText)
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
            }
        }
    }
}

#Preview {
    PlacesListView()
}
