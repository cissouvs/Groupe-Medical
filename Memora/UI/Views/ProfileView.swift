//
//  ProfileView.swift
//  Memora
//
//  Created by Apprenant76 on 31/07/2026.
//

import SwiftUI

enum ProfileScreen: Hashable {
    case list
    case detail(UUID)
}

struct ProfileView: View {
    
    @State var path: [ProfileScreen] = []
    
    var body: some View {
        NavigationStack(path: $path) {
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
                            path.append(.list)
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
                        .font(.custom("Lexend-Bold", size: 34))
                }
            }
            .navigationDestination(for: ProfileScreen.self) { screen in
                switch screen {
                case .detail(let index):
                    ContactDetailView(contactID: index)
                        .toolbarVisibility(.hidden, for: .tabBar)
                case .list:
                    ContactsListView()
                        .toolbarVisibility(.hidden, for: .tabBar)
                }
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    ProfileView()
        .environment(NotificationViewModel())
}
