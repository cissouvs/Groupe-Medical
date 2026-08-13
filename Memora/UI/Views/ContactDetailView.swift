//
//  ContactDetailView.swift
//  Memora
//
//  Created by Leskeu  on 23/07/2026.
//

import SwiftUI
import UIKit
import MapKit

struct ContactDetailView: View {
    @State var showingSheet = false
    @Environment(\.openURL) private var openUrl
    @Environment(ContactListViewModel.self) var contactVM
    var contactID: UUID

    var contact : Contact {
        contactVM.getContact(id: contactID)
    }

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
                HStack(alignment: .center ,spacing: 60) {
                    Button {
                        sendEmail(openUrl: openUrl)
                    } label: {
                        ContactButtonView(backgroundColor: .supportBlue, sfSymbol: "envelope")
                    }
                    Button {
                        guard let number = URL(string: "tel://" + contact.phoneNumber) else { return }
                        UIApplication.shared.open(number)
                    } label: {
                        ContactButtonView(backgroundColor: .supportGreen, sfSymbol: "phone")
                    }
                } .padding(.bottom, 20)
                ScrollView{
                    VStack(alignment: .leading, spacing: 10) {
                        
                        ContactDetailRowView(title: "Numéro:", content: contact.phoneNumber)
                        ContactDetailRowView(title: "E-mail:", content: contact.emailAdress)
                        ContactDetailRowView(
                            title: "Adresse:",
                            content: "\(contact.adress)\n\(contact.postalCode)"
                        )
                    }
                    .padding(.horizontal, 30)
                }
                .scrollIndicators(.hidden)
            }
            
        }
    }

    func sendEmail(openUrl: OpenURLAction) {
        let urlString = "mailto:\(contact.emailAdress)"
        guard let url = URL(string: urlString) else { return }
        openUrl(url)
    }
}
#Preview {
    let vm = ContactListViewModel()
    ContactDetailView(contactID: vm.contacts[0].id)
        .environment(vm)
}
