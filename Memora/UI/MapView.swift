//
//  MapView.swift
//  Memora
//
//  Created by apprenant92 on 23/07/2026.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @State private var placesListVM = PlacesListViewModel()
    
    @State private var camera = MapCameraPosition.automatic
    
    @State private var selectedPlace : Place?
    
//    var place: Place
    
    var userPosition = CLLocationCoordinate2D(
        latitude: 44.340861,
        longitude: 1.2024031597201768)
    
    var careGiversPosition = CLLocationCoordinate2D(
        latitude: 44.33878193104696,
        longitude: 1.2116824676429137)
    
    var body: some View {
        
        ZStack(alignment: .bottomTrailing) {
            
            Map(position: $camera) {
                
                Annotation("Patient", coordinate: userPosition) {
                    Image(systemName: "person")
                        .foregroundStyle(.white)
                        .padding()
                        .background(.supportBlue)
                        .clipShape(.circle)
                }
                
                Annotation("Patient", coordinate: careGiversPosition) {
                    Image(systemName: "person")
                        .foregroundStyle(.white)
                        .padding()
                        .background(.supportRed)
                        .clipShape(.circle)
                }
                ForEach(placesListVM.filteredPlaces) { place in
                    Annotation(place.name, coordinate: place.coordinate) {
                        
                        Button(action: {
                            selectedPlace = place
                        }) {
                            
                            Image(place.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 25, height: 25)
                                .clipShape(Circle())
                                .padding(.trailing, 5)
                            
                        }
                    }
                }
            }
            
            VStack(alignment: .trailing) {
                
                Spacer()
                
                Button {
                    camera = .region(MKCoordinateRegion(
                        center: careGiversPosition,
                        latitudinalMeters: 200,
                        longitudinalMeters: 200))
                } label: {
                    Image(systemName: "mappin")
                        .font(.title)
                        .foregroundStyle(.white)
                        .padding(10)
                        .background(.supportRed)
                        .clipShape(.circle)
                }
                
                Button {
                    camera = .region(MKCoordinateRegion(
                        center: userPosition,
                        latitudinalMeters: 200,
                        longitudinalMeters: 200))
                } label: {
                    Image(systemName: "mappin")
                        .font(.title)
                        .foregroundStyle(.white)
                        .padding(10)
                        .background(.supportBlue)
                        .clipShape(.circle)
                }
            }
            .padding()
        }
    }
}

#Preview {
    MapView()
}
