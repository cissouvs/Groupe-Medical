//
//  ProfileItemView.swift
//  Memora
//
//  Created by Apprenant76 on 31/07/2026.
//

import SwiftUI

enum ProfileItemType {
    case personalData
    case emergencyContact
    case settings
}

struct ProfileItemView: View {

    var profileItemType: ProfileItemType

    var logo: String {
        switch profileItemType {
        case .personalData:
            "person.fill"
        case .emergencyContact:
            "cross.case.fill"
        case .settings:
            "gearshape.fill"
        }     }

    var logoBackgroundColor: Color {
        switch profileItemType {
        case .personalData:
                .supportOrange
        case .emergencyContact:
                .supportRed
        case .settings:
                .supportGreen
        }
    }

    var text: String {
        switch profileItemType {
        case .personalData:
            "Données Personnelles"
        case .emergencyContact:
            "Contacts d'urgence"
        case .settings:
            "Paramètres"
        }
    }

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: logo)
                .font(.title)
                .padding(10)
                .background(logoBackgroundColor)
                .clipShape(.circle)
                .clipped()
                .frame(width: 50, height: 50)
            Text(text)
                .foregroundStyle(.mainText)
                .font(.custom("Lexend-Regular", size: 20))
                .frame(maxWidth: .infinity)
            Image(systemName: "chevron.forward")
                .padding(10)
                .background(Color.background)
                .cornerRadius(10)
        }
        .foregroundStyle(.mainText)
        .padding(.vertical, 6)
        .padding(.horizontal, 17)
        .background(.white)
        .cornerRadius(20)
    }
}


#Preview {
    ProfileItemView(profileItemType: .emergencyContact)
}
