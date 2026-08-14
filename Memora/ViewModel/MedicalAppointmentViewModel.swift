//
//  MedicalAppointmentViewModel.swift
//  Memora
//
//  Created by Apprenant76 on 09/08/2026.
//

import Foundation
import SwiftUI

let mockAppointments: [MedicalAppointmentModel] = [
        MedicalAppointmentModel(
            name: "Dr Martin",
            profilePicture: Image("drMartin"),
            specialty: .generalist,
            date: Date(),
            adress: "8 Allée des Platanes, 46800 Montcuq-en-Quercy-Blanc",
            phoneNumber: "0706060606",
            emailAdress: "leteur@medecin.fr"
        ),
        MedicalAppointmentModel(
            name: "Dr Duparc",
            specialty: .neurologist,
            date: Date().addingTimeInterval(86400),
            adress: "12 place de la République, 46000 Cahors",
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

    func getAppointment(appointmentID: UUID) -> MedicalAppointmentModel? {
        if let appointmentIndex = appointments.firstIndex(where: { $0.id == appointmentID }) {
            return appointments[appointmentIndex]
        }
        return nil
    }

    func addAppointment(appointmentForm: MedicalAppointmentModel) {
        appointments.append(appointmentForm)
    }

    func deleteAppointment(appointmentID: UUID) {
        if let appointmentIndex = appointments.firstIndex(where: { $0.id == appointmentID }) {
            appointments.remove(at: appointmentIndex)
        }
    }

    func updateAppointment(appointmentID: UUID, with appointmentForm: MedicalAppointmentModel) {
        if let appointmentIndex = appointments.firstIndex(where: { $0.id == appointmentID }) {
            appointments[appointmentIndex] = appointmentForm
        }
    }

    func sendEmail(openUrl: OpenURLAction, appointment: MedicalAppointmentModel) {
        let urlString = "mailto:\(appointment.emailAdress)"
        guard let url = URL(string: urlString) else { return }
        openUrl(url)
    }
}
