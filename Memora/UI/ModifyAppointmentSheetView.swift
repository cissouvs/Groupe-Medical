//
//  ModifyAppointmentSheetView.swift
//  Memora
//
//  Created by Apprenant76 on 11/08/2026.
//

import SwiftUI

struct ModifyAppointmentSheetView: View {

    var appointmentID : UUID
    @Binding var isModifySheetPresented: Bool
    @Environment(MedicalAppointmentViewModel.self) var appointmentVM
    @Environment(MedicalAppointmentFormViewModel.self) var appointmentFormVM
    @State var appointmentForm = MedicalAppointmentModel(
        name: "",
        specialty: .neurologist,
        date: Date(),
        adress: "",
        phoneNumber: "",
        emailAdress: ""
    )

    var isConfirmationButtonDisabled: Bool {
        if !appointmentForm.phoneNumber.isEmpty &&
            !appointmentFormVM.validatePhoneNumber(phoneNumber: appointmentForm.phoneNumber) {
            return true
        }
        if !appointmentForm.emailAdress.isEmpty &&
            !appointmentFormVM.validateEmailAddress(emailAdress: appointmentForm.emailAdress) {
            return true
        }
        return appointmentForm.name.isEmpty
    }

    var body: some View {
        NavigationView {
            MedicalAppointmentSheetFormView(appointmentForm: $appointmentForm)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button {
                            isModifySheetPresented = false
                        } label: {
                            Image(systemName: "xmark")
                        }
                    }
                    ToolbarItem(placement: .principal) {
                        Text("Modifier")
                            .font(.title2)
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button {
                            appointmentVM
                                .updateAppointment(appointmentID: appointmentID, with: appointmentForm)
                            isModifySheetPresented = false
                        } label: {
                            Image(systemName: "checkmark")
                        }
                        .tint(.accent)
                        .buttonStyle(.glassProminent)
                        .disabled(isConfirmationButtonDisabled)
                    }
                }
                .onAppear {
                    if let appointment = appointmentVM.getAppointment(appointmentID: appointmentID) {
                        appointmentForm = appointment
                        print(appointment)
                        print(appointmentForm)
                    }
                }
        }
    }
}

#Preview {
    ModifyAppointmentSheetView(
        appointmentID: mockAppointments[1].id,
        isModifySheetPresented: .constant(true)
    )
    .environment(MedicalAppointmentViewModel())
    .environment(MedicalAppointmentFormViewModel())
}
