//
//  MedicalAppointmentViewModel.swift
//  Memora
//
//  Created by Apprenant76 on 09/08/2026.
//

import Foundation

let mockAppointments: [MedicalAppointmentModel] = [
        MedicalAppointmentModel(
            name: "Dr Martin",
            profilePicture: "drMartin",
            specialty: .generalist,
            date: Date(),
            adress: "8 Allée des Platanes, 46800 Montcuq-en-Quercy-Blanc",
            phoneNumber: "0606060606",
            emailAdress: "ledocteur@medecin.fr"
        ),
        MedicalAppointmentModel(
            name: "Dr Martin",
            profilePicture: "",
            specialty: .generalist,
            date: Date(),
            adress: "8 Allée des Platanes, 46800 Montcuq-en-Quercy-Blanc",
            phoneNumber: "0606060606",
            emailAdress: "ledocteur@medecin.fr"
        )
    ]

@Observable
final class MedicalAppointmentViewModel {
    var appointments: [MedicalAppointmentModel] = mockAppointments

    func getFilteredAppointments(at date: Date) -> [MedicalAppointmentModel] {
        let calendar = Calendar.current
        return appointments
            .filter({ calendar.compare($0.date, to: date, toGranularity: .day) == .orderedSame})
    }

    func addAppointment(appointmentForm: MedicalAppointmentModel) {
        appointments.append(appointmentForm)
    }
}
