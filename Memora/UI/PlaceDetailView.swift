//
//  PlaceDetailView.swift
//  Memora
//
//  Created by Leskeu  on 06/08/2026.
//

import SwiftUI
import MapKit

struct PlaceDetailView: View {
    @State private var cameraPosition: MapCameraPosition = .automatic
    var place : Place
    var body: some View {
        ZStack{
            Color.background
            ScrollView {
                Image(place.image)
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: 250)
                    .clipped()
                VStack(alignment:.leading, spacing: 20){
                    Text(place.name)
                        .foregroundStyle(.supportRed)
                        .font(.largeTitle)
                        .bold()
                    VStack(alignment: .leading, spacing: 10){
                        Text("Description:")
                            .font(.title3)
                            .bold()
                            .foregroundStyle(.whiteBackground)
                        Text(place.detail)
                            .font(.title2)
                            .foregroundStyle(.whiteBackground)
                    } .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                        .padding(20)
                        .background(.supportGreen)
                        .cornerRadius(20)
                    VStack(alignment: .leading, spacing: 10){
                        Text("Adresse:")
                            .font(.title3)
                            .bold()
                            .foregroundStyle(.whiteBackground)
                        Text(place.adresse)
                            .font(.title3)
                            .foregroundStyle(.whiteBackground)
                    } .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                        .padding(20)
                        .background(.supportBlue)
                        .cornerRadius(20)
                    Map(position: $cameraPosition) {
                        Annotation("",coordinate: place.coordinate, anchor: .center) {
                            Image(place.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 40, height: 40)
                                .clipShape(.circle)
                        }
                    }
                    .onAppear {
                        let position =
                        place.coordinate
                        let positionSpan =
                        MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
                        let positionRegion =
                        MKCoordinateRegion(center: position, span: positionSpan)
                        cameraPosition =
                            .region(positionRegion)
                    } .frame(width: .infinity, height: 157)
                        .cornerRadius(26)
                        .padding(.vertical)
                        .colorScheme(.dark)

                } .padding(.horizontal)
                
            } .ignoresSafeArea()
            
        }
    }
}
#Preview {
    PlaceDetailView(place: emergencyPlace[0])
}
