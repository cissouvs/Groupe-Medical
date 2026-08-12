//
//  AnnotationView.swift
//  Memora
//
//  Created by apprenant92 on 11/08/2026.
//

import SwiftUI

struct AnnotationView: View {
    
    var place : Place
    
    var body: some View {
        ZStack {
            Triangle()
                .fill(.supportRed)
                .frame(width: 25, height: 20)
                .offset(x: 0, y: 20)
            AsyncImage(url: URL(string: place.picture))
                .scaledToFill()
                .frame(width: 30, height: 30)
                .clipShape(Circle())
                .overlay {
                    Circle()
                        .stroke(.supportRed, lineWidth: 3)
                }
        }
    }
}

#Preview {
    AnnotationView(place: Place(
        picture: "https://mairie-montcuq-en-quercy-blanc.fr/wp-content/uploads/2024/03/mediatheque_mtq.jpg",
        name: "Médiathèque Intercommunale du Quercy Blanc",
        adresse: "6 Place de la Halle aux Grains, 46800 Montcuq",
        detail: "Médiathèque calme proposant livres, animations et espace de lecture.",
        coordinate: mediathequePosition,
        places: .contact
    ))
}
