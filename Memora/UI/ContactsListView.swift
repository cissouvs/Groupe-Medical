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
                                    .clipShape(.circle)
                                    .frame(width: 70, height: 70)
                                    .clipped()
                            } else {
                                Image(systemName: "photo.artframe")
                                    .resizable()
                                    .foregroundStyle(.mainText)
                                    .clipShape(.circle)
                                    .frame(width: 70, height: 70)

                                    .clipped()
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
                        .font(.custom("Lexend-SemiBold", size: 20)
                        .bold()
                )}
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


