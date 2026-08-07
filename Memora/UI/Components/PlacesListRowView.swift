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
            Image(place.image)
                .resizable()
                .cornerRadius(400)
                .frame(width: 60, height: 60)
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
        image: "mediatheque",
        name: "Médiathèque Intercommunale",
        adresse: "6 Place de la Halle aux Grains, 46800 Montcuq",
        detail: "Médiathèque calme proposant livres, animations et espace de lecture.",
        coordinate: mediathequePosition,
        places: .favorite
    ))
}
