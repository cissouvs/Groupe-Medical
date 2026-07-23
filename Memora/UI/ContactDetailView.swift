//
//  ContactDetailView.swift
//  Memora
//
//  Created by Leskeu  on 23/07/2026.
//

import SwiftUI

struct ContactDetailView: View {
    let contact : Contact
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            RoundedRectangle(cornerRadius: 20)
                .frame(maxWidth: 350)
                .frame(maxHeight: 400)
                .foregroundStyle(.white)
            VStack(alignment: .center) {
                    Image(contact.photo)
                        .resizable()
                        .scaledToFit()
                        .clipShape(.circle)
                        .frame(maxWidth: 100)
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
                    

                } .padding(.vertical, 10)
                }
            }
        }
    }
#Preview {
    ContactDetailView(contact: emergencyContacts[0])
}
