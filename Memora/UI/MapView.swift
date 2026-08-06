//
//  MapView.swift
//  Memora
//
//  Created by apprenant92 on 23/07/2026.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @State private var vm = MapViewModel()
    
    @State private var camera = MapCameraPosition.automatic
    
    var body: some View {
        
        ZStack(alignment: .bottomTrailing) {
            
            Map(position: $camera) {
                
                Annotation("Patient", coordinate: vm.userPosition) {
                    Image(systemName: "person")
                        .foregroundStyle(.white)
                        .padding()
                        .background(.supportBlue)
                        .clipShape(.circle)
                }
                
                Annotation("Patient", coordinate: vm.careGiversPosition) {
                    Image(systemName: "person")
                        .foregroundStyle(.white)
                        .padding()
                        .background(.supportRed)
                        .clipShape(.circle)
                }
                
            }
            
            VStack(alignment: .trailing) {
                
                Spacer()
                
                Button {
                    camera = .region(MKCoordinateRegion(
                        center: vm.careGiversPosition,
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
                        center: vm.userPosition,
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
