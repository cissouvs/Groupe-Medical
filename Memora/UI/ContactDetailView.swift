//
//  ContactDetailView.swift
//  Memora
//
//  Created by Leskeu  on 23/07/2026.
//

import SwiftUI
import UIKit
import MapKit

//func sendEmail(openUrl: OpenURLAction) {
//    let urlString = "https://mail.google.com/mail/u/2/#inbox"
//    guard let url = URL(string: urlString) else { return }
//    
//    openUrl(url) { accepted in
//        if !accepted {
//            // Handle the error, e.g., show an alert
//        }
//    }
//}
struct ContactDetailView: View {
    @Environment(\.openURL) private var openUrl
    @State var showingSheet = false
    let contact : Contact
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            RoundedRectangle(cornerRadius: 20)
                .frame(maxWidth: 350)
                .frame(maxHeight: 500)
                .foregroundStyle(.white)
            VStack(alignment: .center) {
                if let contactPhoto = contact.photo {
                    contactPhoto
                        .resizable()
                        .scaledToFit()
                        .clipShape(.circle)
                        .frame(maxWidth: 100)
                } else {
                    Image("placeholder")
                        .resizable()
                        .scaledToFit()
                        .clipShape(.circle)
                        .frame(maxWidth: 200)
                }
                HStack {
                    Text(contact.firstName)
                        .font(.title)
                    Text(contact.surName)
                        .font(.title)
                }
                VStack(alignment: .leading, spacing: 10) {
                    VStack(alignment:.leading ) {
                        Text("Numéro de téléphone:")
                            .bold()
                        Text(contact.phoneNumber)
                    }
                    VStack(alignment: .leading) {
                        Text("Adresse Mail:")
                            .bold()
                        Text(contact.emailAdress)
                    }
                    VStack(alignment: .leading) {
                        Text("Adresse:")
                            .bold()
                        Text(contact.adress)
                        Text(contact.postalCode)
                    }
                    HStack(alignment: .center ,spacing: 20) {
                        Button {
                            //                            sendEmail(openUrl: openUrl)
                        } label: {
                            Image(systemName: "paperplane")
                                .padding()
                                .foregroundStyle(.white)
                                .background(.supportYellow)
                                .cornerRadius(10)
                        }
                        Button {
                            guard let number = URL(string: "tel://" + contact.phoneNumber) else { return }
                            UIApplication.shared.open(number)
                        } label: {
                            Image(systemName: "phone")
                                .padding()
                                .foregroundStyle(.white)
                                .background(.supportGreen)
                                .cornerRadius(10)
                        }
                        Button {
                            
                        } label: {
                            Image(systemName: "mappin")
                                .padding()
                                .foregroundStyle(.white)
                                .background(.supportBlue)
                                .cornerRadius(10)
                        }
                        
                    }
                }.padding(.vertical, 10)
            }
        }
    }
    
}
#Preview {
    ContactDetailView(contact: emergencyContacts[0])
}
