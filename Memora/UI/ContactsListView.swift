//
//  ContactsListView.swift
//  Memora
//
//  Created by Leskeu  on 23/07/2026.
//

import SwiftUI

struct ContactsListView: View {
    let contacts : [Contact]
    var body: some View {
        ZStack {
            Color.background
            NavigationStack {
                VStack {
                    List {
                            ForEach(contacts) { contact in
                                NavigationLink {
                                    ContactDetailView(contact: contact)
                                } label: {
                                    HStack {
                                        Image(contact.photo)
                                            .resizable()
                                            .scaledToFit()
                                            .clipShape(.circle)
                                            .frame(maxWidth: 50)
                                        Text(contact.firstName)
                                        Text(contact.surName)
                                    }
                                }
                            }
                    }.font(.title3)
                        .toolbar {
                            ToolbarItem(placement: .principal){
                                Text("Contacts d'urgence")
                                    .font(.title)
                                    .bold()
                            }
                            ToolbarItem(placement: .topBarTrailing) {
                                Button {
                                    
                                } label: {
                                    Image(systemName: "plus")
                                }
                            }
                        }
                }
            }
        }
    }
}
#Preview {
    ContactsListView(contacts: emergencyContacts)
}
