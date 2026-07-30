//
//  ContactDetailView.swift
//  Memora
//
//  Created by Leskeu  on 23/07/2026.
//

import SwiftUI
import UIKit
import MapKit

func sendEmail(openUrl: OpenURLAction) {
    let urlString = "mailto:colettelevrelle@gmail.com"
    guard let url = URL(string: urlString) else { return }
    
    openUrl(url) { accepted in
        if !accepted {
            // Handle the error, e.g., show an alert
        }
    }
}
struct ContactDetailView: View {
    @Environment(\.openURL) private var openUrl
    @State var showingSheet = false
    let contact : Contact
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            VStack(alignment: .center) {
                if let contactPhoto = contact.photo {
                    contactPhoto
                        .resizable()
                        .scaledToFit()
                        .clipShape(.circle)
                        .frame(maxWidth: 200)
                } else {
                    Image("placeholder")
                        .resizable()
                        .scaledToFit()
                        .clipShape(.circle)
                        .frame(maxWidth: 200)
                }
                HStack {
                    Text(contact.firstName)
                        .font(.largeTitle)
                    Text(contact.surName)
                        .font(.largeTitle)
                } .padding(.vertical, 20)
                ScrollView{
                    VStack(alignment: .leading, spacing: 10) {
                        
                        VStack(alignment:.leading ) {
                            Text("Numéro:")
                                .bold()
                                .font(.title)
                            Text(contact.phoneNumber)
                                .font(.title)
                        } .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                            .padding(20)
                            .background(.white)
                            .cornerRadius(20)
                        VStack(alignment: .leading) {
                            Text("Adresse Mail:")
                                .bold()
                                .font(.title)
                            Text(contact.emailAdress)
                                .font(.title)
                        } .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                            .padding(20)
                            .background(.white)
                            .cornerRadius(20)
                        VStack(alignment: .leading) {
                            Text("Adresse:")
                                .bold()
                                .font(.title)
                            Text(contact.adress)
                                .font(.title)
                            Text(contact.postalCode)
                                .font(.title)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                        .padding(20)
                        .background(.white)
                        .cornerRadius(20)
                        
                    }
                    .padding(.horizontal, 30)
                }
                HStack(alignment: .center ,spacing: 60) {
                    Button {
                        sendEmail(openUrl: openUrl)
                    } label: {
                        Image(systemName: "paperplane")
                            .padding(20)
                            .foregroundStyle(.white)
                            .background(.supportBlue)
                            .clipShape(.circle)
                    }
                    Button {
                        guard let number = URL(string: "tel://" + contact.phoneNumber) else { return }
                        UIApplication.shared.open(number)
                    } label: {
                        Image(systemName: "phone")
                            .padding(20)
                            .foregroundStyle(.white)
                            .background(.supportGreen)
                            .clipShape(.circle)
                    }
                    Button {
                        
                    } label: {
                        Image(systemName: "map")
                            .padding(20)
                            .foregroundStyle(.white)
                            .background(.supportRed)
                            .clipShape(.circle)
                    }
                }
            }.padding(.vertical, 20)
            
        }
    }
}
#Preview {
    ContactDetailView(contact: emergencyContacts[0])
}
