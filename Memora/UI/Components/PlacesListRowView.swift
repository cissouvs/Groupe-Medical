//
//  PlacesListRowView.swift
//  Memora
//
//  Created by Leskeu  on 06/08/2026.
//

import SwiftUI

struct PlacesListRowView: View {
    var place : Place
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: place.picture)) { image in
                    image
                    .resizable()
                    .frame(width: 60, height: 60)
                    .cornerRadius(400)
                    .clipped()
            } placeholder: {
                Image(systemName: "pills.fill")
            }
            VStack(alignment: .leading) {
                Text(place.name)
                    .bold()
                HStack(alignment: .top) {
                    Image(systemName: "mappin.circle.fill")
                        .foregroundStyle(.secondText)
                    Text(place.adresse)
                }
            }
        }
    }
}

#Preview {
    PlacesListRowView(place: Place(
        picture: "mediatheque",
        name: "Médiathèque Intercommunale",
        adresse: "6 Place de la Halle aux Grains, 46800 Montcuq",
        detail: "Médiathèque calme proposant livres, animations et espace de lecture.",
        coordinate: mediathequePosition,
        places: .favorite
    ))
}
