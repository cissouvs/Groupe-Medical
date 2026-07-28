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
    @State var contactForm : Contact = Contact(
        emailAdress: "",
        firstName: "",
        surName: "",
        phoneNumber: "",
        adress: "",
        postalCode: "",
        photo: Image("")
    )
    @Binding var contacts : [Contact]
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
                    contacts
                        .append(
                            Contact.init(
                                emailAdress: contactForm.emailAdress,
                                firstName: contactForm.firstName,
                                surName: contactForm.surName,
                                phoneNumber: contactForm.phoneNumber,
                                adress: contactForm.adress,
                                postalCode: contactForm.postalCode,
                                photo: contactForm.photo
                            )
                        )
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
                if pickerImage == nil {
                    Image("placeholder")
                        .resizable()
                        .scaledToFit()
                        .clipShape(.circle)
                        .frame(maxWidth: 200)
                } else {
                    Image("colette")
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
                        pickerImage = newImage
                    }
                }
            }
            Form {
                TextField("Nom", text: $contactForm.surName)
                TextField("Prenom", text: $contactForm.firstName)
                TextField("Adresse Mail", text: $contactForm.emailAdress)
                TextField("Numéro de téléphone", text: $contactForm.phoneNumber)
                TextField("Adresse", text: $contactForm.adress)
            }
        }
    }
}

#Preview {
    ContactSheet(contacts: .constant(emergencyContacts))
}
