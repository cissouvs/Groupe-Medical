//
//  ContactsListView.swift
//  Memora
//
//  Created by Leskeu  on 23/07/2026.
//

import SwiftUI

struct ContactsListView: View {
    @State var contacts : [Contact]
    @State var selectedContact : Contact?
    @State var isSelected : Bool = false
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
                                    contact.photo
                                        .resizable()
                                        .scaledToFit()
                                        .clipShape(.circle)
                                        .frame(maxWidth: 50)
                                    Text(contact.firstName)
                                    Text(contact.surName)
                                }
                            }
                        }
                    }
                    .sheet(isPresented: $isSelected){
                        ContactSheet(contacts: $contacts)
                            .padding(.vertical)
                }
                .font(.title3)
                .toolbar {
                    ToolbarItem(placement: .principal){
                        Text("Contacts d'urgence")
                            .font(.title)
                            .bold()
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            isSelected = true
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
