//
//  PlaceDetailView.swift
//  Memora
//
//  Created by Leskeu  on 06/08/2026.
//

import SwiftUI
import MapKit

struct PlaceDetailView: View {
    
    @Environment(PlacesListViewModel.self) var placesListVM
    
    @Binding var path: [PlaceScreen]
    
    @State private var cameraPosition: MapCameraPosition = .automatic
    var place : Place
    var body: some View {
        ZStack{
            Color.background
                .ignoresSafeArea()
            ScrollView {
                AsyncImage(url: URL(string: place.picture)) { image in
                        image
                        .resizable()
                        .frame(maxWidth: .infinity, maxHeight: 250)
                        .clipped()
                } placeholder: {
                    Image(systemName: "photo.artframe")
                }
                VStack(alignment:.leading, spacing: 20){
                    Text(place.name)
                        .foregroundStyle(.black)
                        .font(.custom("Lexend-Bold", size: 30))
                    VStack(alignment: .leading, spacing: 10){
                        Text("Description:")
                            .font(.custom("Lexend-SemiBold", size: 20))
                            .bold()
                            .foregroundStyle(.black)
                        Text(place.detail)
                            .font(.custom("Lexend-Regular", size: 16))
                            .foregroundStyle(.black)
                    } .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                        .padding(20)
                        .background(.tagGreen)
                        .cornerRadius(20)
                    VStack(alignment: .leading, spacing: 10){
                        Text("Adresse:")
                            .font(.custom("Lexend-SemiBold", size: 20))
                            .foregroundStyle(.black)
                        Text(place.adresse)
                            .font(.custom("Lexend-Regular", size: 16))
                            .foregroundStyle(.black)
                    } .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                        .padding(20)
                        .background(.tagPurple)
                        .cornerRadius(20)
                    Map(position: $cameraPosition) {
                        Annotation("",coordinate: place.coordinate, anchor: .center) {
                            AnnotationPlacesView(place: place)
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
    PlaceDetailView(path: .constant([]), place: allPlaces[0])
        .environment(PlacesListViewModel())
}
