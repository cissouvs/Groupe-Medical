//
//  ProfileView.swift
//  Memora
//
//  Created by Apprenant76 on 31/07/2026.
//

import SwiftUI

struct ProfileView: View {

    @Environment(NotificationViewModel.self) var notificationVM

    var body: some View {
        ZStack {
            Color.background
            VStack(spacing: 63) {
                VStack(spacing: 10) {
                    Image("colette")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 150)
                        .clipShape(.circle)
                        .clipped()
                    Text("Yann")
                        .font(.custom("Lexend-SemiBold", size: 26))

                    Text("Aidant")
                        .font(.custom("Lexend-Regular", size: 16))

                }
                VStack(spacing: 12) {
                    Button {

                    } label: {
                        ProfileItemView(profileItemType: .personalData)
                        
                    }
                    Button {
                        notificationVM.mainPageNavigationPath.append(.emergencyContact)
                    } label: {
                        ProfileItemView(profileItemType: .emergencyContact)
                    }
                    Button {

                    } label: {
                        ProfileItemView(profileItemType: .settings)
                    }
                }
                .padding(12)
            }
        }
        .toolbar{
            ToolbarItem(placement: .principal) {
                Text("Profil")
                    .font(.largeTitle)
                    .bold()
            }
            ToolbarItem(placement: .confirmationAction) {
                Image(systemName: "pencil.line")
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ProfileView()
        .environment(NotificationViewModel())
}
