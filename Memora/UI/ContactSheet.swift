//
//  ContactSheet.swift
//  Memora
//
//  Created by Leskeu  on 23/07/2026.
//

import SwiftUI
import PhotosUI

struct ContactSheet: View {
    @Environment(\.dismiss) var dismiss
    @State var pickerItem : PhotosPickerItem?
    @State var pickerImage : Image?
    @State var vm = ContactSheetViewModel()
    @Environment(ContactListViewModel.self) var contactVM
    
    var body: some View {
        VStack {
            HStack(spacing: 30){
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .foregroundStyle(.mainText)
                        .padding()
                        .background(.ultraThinMaterial)
                        .clipShape(.circle)
                    
                }
                Text("Ajoutez un contact")
                    .font(.title)
                Button {
                    contactVM.addContact(newContact: vm.contactForm)
                    dismiss()
                } label: {
                    Image(systemName: "checkmark")
                        .foregroundStyle(.white)
                        .padding()
                        .background(.accent)
                        .clipShape(.circle)
                }
            }
            PhotosPicker(selection: $pickerItem, matching: .images) {
                if let contactPhoto = vm.contactForm.photo  {
                    contactPhoto
                        .resizable()
                        .scaledToFit()
                        .clipShape(.circle)
                        .frame(maxWidth: 400)
                } else {
                    Image("placeholder")
                        .resizable()
                        .scaledToFit()
                        .clipShape(.circle)
                        .frame(maxWidth: 200)
                }
            }
            .onChange(of: pickerItem) {
                Task {
                    guard let pickerItem else {
                        return
                    }
                    if let newImage = try? await pickerItem.loadTransferable(type: Image.self) {
                        vm.contactForm.photo = newImage
                    }
                }
            }
            Form {
                TextField("Nom", text: $vm.contactForm.surName)
                TextField("Prenom", text: $vm.contactForm.firstName)
                TextField("Adresse Mail", text: $vm.contactForm.emailAdress)
                TextField("Numéro de téléphone", text: $vm.contactForm.phoneNumber)
                TextField("Adresse", text: $vm.contactForm.adress)
            }
        }
    }
}

#Preview {
    ContactSheet().environment(ContactListViewModel())
}
