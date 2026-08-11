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
                TextField("Nom", text: $appointmentForm.name)
                Picker("Spécialité", selection: $appointmentForm.specialty) {
                    ForEach(MedicalSpeciality.allCases) { specialty in
                        Text(specialty.rawValue)
                    }
                }
                .tint(.accentColor)
            }
            Section {
                DatePicker(
                    "Date",
                    selection: $appointmentForm.date,
                    displayedComponents: [.date, .hourAndMinute]
                )
                TextField("Adresse", text: $appointmentForm.adress)
                TextField("N° Téléphone", text: $appointmentForm.phoneNumber)
                TextField("Email", text: $appointmentForm.emailAdress)
            }
        }
    }
}

#Preview {
    MedicalAppointmentSheetFormView(appointmentForm:
            .constant(
                MedicalAppointmentModel(
                    name: "",
                    specialty: .other,
                    date: Date(),
                    adress: "",
                    phoneNumber: "",
                    emailAdress: ""
                )
            )
    )
}
