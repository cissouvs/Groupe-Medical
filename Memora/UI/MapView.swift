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
    
    var userPosition = CLLocationCoordinate2D(latitude: 44.340861, longitude: 1.2024031597201768)
    
    var body: some View {
        
        ZStack{
            
            Map(position: $camera) {
                
                Annotation("Patient", coordinate: userPosition) {
                    Image(systemName: "person")
                        .foregroundStyle(.white)
                        .padding()
                        .background(.supportBlue)
                        .clipShape(.circle)
                }
                
            }
            
            VStack(alignment: .trailing){
                
                Spacer()
                Button {
                    camera = .region(MKCoordinateRegion(
                        center: userPosition,
                        latitudinalMeters: 200,
                        longitudinalMeters: 200))
                } label: {
                    Image(systemName: "person")
                        .foregroundStyle(.white)
                        .padding()
                        .background(.supportBlue)
                        .clipShape(.circle)
                }
                
                
            }
            
        }
    }
}

#Preview {
    MapView()
}
