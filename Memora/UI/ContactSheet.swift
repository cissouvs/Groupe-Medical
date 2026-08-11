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
                TextFieldUIKit(text: $vm.contactForm.surName, placeholder: "Nom")
                TextFieldUIKit(text: $vm.contactForm.firstName, placeholder: "Prénom")
                TextFieldUIKit(text: $vm.contactForm.emailAdress, placeholder: "Adresse Mail")
                TextFieldUIKit(text: $vm.contactForm.phoneNumber, placeholder: "Numéro de téléphone")
                TextFieldUIKit(text: $vm.contactForm.adress, placeholder: "Adresse")
            }
        }
    }
}

struct TextFieldUIKit: UIViewRepresentable {
    @Binding var text: String
    var placeholder: String
    
    func makeUIView(context: Context) -> UITextField {
        let textfield = UITextField()
        textfield.placeholder = placeholder
        textfield.delegate = context.coordinator
        return textfield
    }
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UITextFieldDelegate {
        var parent: TextFieldUIKit
        
        init(_ parent: TextFieldUIKit) {
            self.parent = parent
        }
        
        func textFieldDidChangeSelection(_ textField: UITextField) {
            parent.text = textField.text ?? ""
        }
    }
}

#Preview {
    ContactSheet().environment(ContactListViewModel())
}
