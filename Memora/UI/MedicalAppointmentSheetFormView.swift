//
//  MedicalAppointmentSheetFormView.swift
//  Memora
//
//  Created by Apprenant76 on 09/08/2026.
//

import SwiftUI
import PhotosUI

struct MedicalAppointmentSheetFormView: View {
    @Binding var appointmentForm: MedicalAppointmentModel
    @State private var pickerItem: PhotosPickerItem?
    @State private var pickerImage: Image?
    @State private var phoneNumber: String = ""
    @State private var emailAdress: String = ""

    var body: some View {
        Form {
            PhotosPicker(selection: $pickerItem) {
                if let pickerImage {
                    pickerImage
                        .resizable()
                        .clipShape(.circle)
                        .clipped()
                } else {
                    Image(systemName: "photo.badge.plus")
                        .padding(35)
                        .font(.system(size: 70))
                        .foregroundStyle(.secondText)
                        .background(Color.background)
                        .clipShape(.circle)
                        .clipped()
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            }
            .frame(width: .infinity, height: 150)
            .onChange(of: pickerItem) {
                Task {
                    if let loadedImage = try? await pickerItem?.loadTransferable(type: Image.self) {
                        pickerImage = loadedImage
                    }
                }
            }
            Section {
                TextField(text: $appointmentForm.name){
                    Text("Nom")
                        .font(.custom("Lexend-Regular", size: 16))
                }
                
                Picker(selection: $appointmentForm.specialty) {
                    ForEach(MedicalSpeciality.allCases) { specialty in
                        Text(specialty.rawValue)
                    }
                } label: {
                    Text("Spécialités")
                        .font(.custom("Lexend-Regular", size: 16))
                         
                }
                .tint(.accentColor)
            }
            Section {
                DatePicker(
                    selection: $appointmentForm.date,
                    displayedComponents: [.date, .hourAndMinute]
                ) {
                    Text("Date")
                        .font(.custom("Lexend-Regular", size: 16))
                }
                TextField(text: $appointmentForm.adress){
                    Text("Adresse")
                        .font(.custom("Lexend-Regular", size: 16))
                }
                TextField(text: $phoneNumber){
                    Text("N° de téléphone")
                        .font(.custom("Lexend-Regular", size: 16))
                }
                    .onChange(of: phoneNumber) {
                        if phoneNumber.isEmpty {
                            appointmentForm.phoneNumber = nil
                        } else {
                            appointmentForm.phoneNumber = phoneNumber
                        }
                    }
                TextField(text: $emailAdress){
                    Text("Email")
                        .font(.custom("Lexend-Regular", size: 16))
                }
                    .onChange(of: emailAdress) {
                        if emailAdress.isEmpty {
                            appointmentForm.emailAdress = nil
                        } else {
                            appointmentForm.emailAdress = emailAdress
                        }
                    }
            }
        }
    }
}

#Preview {
    MedicalAppointmentSheetFormView(
        appointmentForm:
                .constant(MedicalAppointmentModel(
                    name: "",
                    profilePicture: "",
                    specialty: .other,
                    date: Date(),
                    adress: ""
                )
                )
    )
}
