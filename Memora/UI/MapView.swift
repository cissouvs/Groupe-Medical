//
//  MapView.swift
//  Memora
//
//  Created by apprenant92 on 23/07/2026.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @State var placesListVM = PlacesListViewModel()
    
    @State var camera = MapCameraPosition.automatic
    
    @State var selectedPlace : Place?
    
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
                                        .frame(width: 30, height: 30)
                                        .clipShape(.circle)
                                }
                                Annotation("Vous", coordinate: careGiversPosition) {
                                    Image(systemName: "person")
                                        .foregroundStyle(.white)
                                        .padding()
                                        .background(.supportRed)
                                        .frame(width: 30, height: 30)
                                        .clipShape(.circle)
                                }
                ForEach(placesListVM.filteredPlaces) { place in
                    Annotation(place.name, coordinate: place.coordinate)
                    {
                        Button(action: {
                            selectedPlace = place
                        }) {
                            AnnotationView(place: place)
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
                    Image(systemName: "paperplane")
                        .font(.system(size: 16))
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
                        .font(.system(size: 16))                        .foregroundStyle(.white)
                        .padding(10)
                        .background(.supportBlue)
                        .clipShape(.circle)
                }
            }
            .padding()
            .environment(placesListVM)
        }
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        
        return path
    }
}

#Preview {
    MapView()
        .environment(PlacesListViewModel())
}
