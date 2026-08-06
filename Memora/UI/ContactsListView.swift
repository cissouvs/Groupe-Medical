//
//  ContactsListView.swift
//  Memora
//
//  Created by Leskeu  on 23/07/2026.
//

import SwiftUI

struct ContactsListView: View {

    @State private var vm = ContactListViewModel()
    @State var isSelected : Bool = false

    var body: some View {
        ZStack {
            Color.background
            VStack {
                List(vm.contacts) { contact in
                    NavigationLink {
                        ContactDetailView(contactID: contact.id)
                            .environment(vm)
                    } label: {
                        HStack {
                            if let contactPhoto = contact.photo {
                                contactPhoto
                                    .resizable()
                                    .scaledToFit()
                                    .clipShape(.circle)
                                    .frame(maxWidth: 50)
                            } else {
                                Image("placeholder")
                                    .resizable()
                                    .scaledToFit()
                                    .clipShape(.circle)
                                    .frame(maxWidth: 200)
                            }
                            Text(contact.firstName)
                            Text(contact.surName)
                        }
                    }
                }
            }
            .sheet(isPresented: $isSelected){
                ContactSheet()
                    .padding(.vertical)
                    .environment(vm)
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

#Preview {
    ContactsListView()
        .environment(ContactListViewModel())
}


