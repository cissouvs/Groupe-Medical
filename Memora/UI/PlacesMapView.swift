//
//  MapView.swift
//  Memora
//
//  Created by apprenant92 on 23/07/2026.
//

import SwiftUI
import MapKit

struct PlacesMapView: View {
    
    @Environment(PlacesListViewModel.self) var placesListVM
    
    @Binding var path: [PlaceScreen]
    
    @State var camera = MapCameraPosition.automatic
    
    @State var selectedPlace : Place?
    
    var userPosition = CLLocationCoordinate2D(
        latitude: 44.340861,
        longitude: 1.2024031597201768)
    
    var careGiversPosition = CLLocationCoordinate2D(
        latitude: 44.339932,
        longitude: 1.212311)
    
    var body: some View {
        
        ZStack(alignment: .bottomTrailing) {
            Map(position: $camera) {
                Annotation("Patient", coordinate: userPosition) {
                    AnnotationPersonView(color: .supportGreen, picture: "colette")
                }
                Annotation("Vous", coordinate: careGiversPosition) {
                    AnnotationPersonView(color: .supportOrange, picture: "yann")
                }
                ForEach(placesListVM.filteredPlaces) { place in
                    Annotation(place.name, coordinate: place.coordinate)
                    {
                        Button(action: {
                            path.append(.detail(place))
                        }) {
                            AnnotationPlacesView(place: place)
                        }
                    }
                }
            }
            .onAppear {
                let position = careGiversPosition
                let zoom = MKCoordinateSpan(latitudeDelta: 0.004, longitudeDelta: 0.004)
                let positionRegion = MKCoordinateRegion(center: position, span: zoom)
                camera = .region(positionRegion)
            }
            VStack(alignment: .trailing) {
                Button {
                    camera = .region(MKCoordinateRegion(
                        center: careGiversPosition,
                        latitudinalMeters: 200,
                        longitudinalMeters: 200))
                } label: {
                    ButtonMap(symbole: "paperplane.fill", color: .supportOrange)
                }
                Button {
                    camera = .region(MKCoordinateRegion(
                        center: userPosition,
                        latitudinalMeters: 200,
                        longitudinalMeters: 200))
                } label: {
                    ButtonMap(symbole: "cross.fill", color: .supportGreen)
                }
            }
            .padding()
        }
    }
}


#Preview {
    PlacesMapView(path: .constant([]))
        .environment(PlacesListViewModel())
}
