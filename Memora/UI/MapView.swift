//
//  MapView.swift
//  Memora
//
//  Created by apprenant92 on 23/07/2026.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @State var camera = MapCameraPosition.automatic
    
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
                
            }
            
            VStack(alignment: .trailing){
                
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
