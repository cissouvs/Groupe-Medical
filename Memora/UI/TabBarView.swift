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
            Tab("Carte", systemImage: "map.fill") {
                PlacesView()
            }
            Tab("Profil", systemImage: "person.fill") {
                ProfileView()
            }
        }
        .tint(.accent)
    }
}

#Preview {
    TabBarView()
}
