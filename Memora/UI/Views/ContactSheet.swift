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
    
    
    
    var isConfirmationButtonDisabled: Bool {
        if !vm.contactForm.emailAdress.isEmpty && !vm
            .validateEmailAdress(emailAdress: vm.contactForm.emailAdress) {
            return true
        }
        if !vm.contactForm.phoneNumber.isEmpty && !vm
            .validatePhoneNumber(phoneNumber: vm.contactForm.phoneNumber) {
            return true
        }
        return vm.contactForm.surName.isEmpty
    }
    
    
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
                        .foregroundStyle(isConfirmationButtonDisabled ? .mainText : .white)
                        .padding()
                        .background(isConfirmationButtonDisabled ? .background : .accent)
                        .clipShape(.circle)
                }
                .disabled(isConfirmationButtonDisabled)
                
                
            } /*.padding(.horizontal, 4)*/
            PhotosPicker(selection: $pickerItem, matching: .images) {
                if let contactPhoto = vm.contactForm.photo  {
                    contactPhoto
                        .resizable()
                        .scaledToFit()
                        .clipShape(.circle)
                        .frame(maxWidth: 200)
                } else {
                    Image(systemName: "photo.artframe")
                        .resizable()
                        .scaledToFit()
                        .clipShape(.circle)
                        .frame(maxWidth: 200)
                        .foregroundStyle(Color.background)
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
                TextFieldUIKit(text: $vm.contactForm.surName, placeholder: "Nom")
                TextFieldUIKit(text: $vm.contactForm.firstName, placeholder: "Prénom")
                TextFieldUIKit(text: $vm.contactForm.emailAdress, placeholder: "Adresse Mail")
                TextFieldUIKit(text: $vm.contactForm.phoneNumber, placeholder: "Numéro de téléphone")
                TextFieldUIKit(text: $vm.contactForm.adress, placeholder: "Adresse")
            }
        }
    }
}

#Preview {
    ContactSheet().environment(ContactListViewModel())
}
