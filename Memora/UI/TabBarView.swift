//
//  TabView.swift
//  Memora
//
//  Created by Apprenant76 on 29/07/2026.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            Tab("Accueil", systemImage: "house.fill") {
                LandingScreenView()
            }
            Tab("Communauté", systemImage: "person.3.fill") {

            }
            Tab("Carte", systemImage: "map.fill") {
                PlacesView()
            }
        }
        .tint(.accent)
    }
}

#Preview {
    TabBarView()
}
