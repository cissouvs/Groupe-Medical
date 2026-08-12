//
//  MedicalAppointmentFormViewModel.swift
//  Memora
//
//  Created by Apprenant76 on 09/08/2026.
//

import Foundation

@Observable
final class MedicalAppointmentFormViewModel {

    var appointmentForm = MedicalAppointmentModel(
        name: "",
        specialty: .generalist,
        date: Date(),
        adress: "",
        phoneNumber: "",
        emailAdress: ""
    )

    func validatePhoneNumber(phoneNumber: String) -> Bool {
        let prefixes = ["01", "02", "03", "04", "05", "06", "07", "09"]
        if phoneNumber.count != 10 ||
            !phoneNumber.allSatisfy({ $0.isNumber }) ||
            !prefixes.contains(String(phoneNumber.prefix(2)))
        {
            return false
        }
        return true
    }

    func validateEmailAddress(emailAdress: String) -> Bool {
        if let emailRegex = try? Regex("[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}") {
            return emailAdress.contains(emailRegex)
        }
        return false
    }
}
