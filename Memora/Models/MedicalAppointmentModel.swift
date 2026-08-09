//
//  MedicalAppointmentModel.swift
//  Memora
//
//  Created by Apprenant76 on 09/08/2026.
//

import Foundation

enum MedicalSpeciality: String, CaseIterable {
    case generalist = "Médecin généraliste"
    case neurologist = "Neurologist"
    case geriatrician = "Gériatre"
    case psychiatrist = "Psychiatre"
    case neuropsychologist = "Neuropsychologue"
    case occupationalTherapist = "Ergothérapeute"
    case psychomotrician = "Psychomtricien"
    case nurse = "Infirmier"
}

struct MedicalAppointmentModel: Identifiable {
    var id: UUID = UUID()
    var name: String
    var profilePicture: String
    var specialty: MedicalSpeciality
    var date: Date
    var adress: String
    var phoneNumber: String?
    var emailAdress: String?
}
