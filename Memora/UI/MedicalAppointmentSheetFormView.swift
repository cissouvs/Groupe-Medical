//
//  MedicalAppointmentSheetFormView.swift
//  Memora
//
//  Created by Apprenant76 on 09/08/2026.
//

import SwiftUI

struct MedicalAppointmentSheetFormView: View {
    @Binding var appointmentForm: MedicalAppointmentModel
    var body: some View {
        Form {
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
