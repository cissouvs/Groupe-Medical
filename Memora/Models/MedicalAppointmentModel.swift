//
//  MedicalAppointmentModel.swift
//  Memora
//
//  Created by Apprenant76 on 09/08/2026.
//

import Foundation
import SwiftUI

enum MedicalSpeciality: String, Identifiable, CaseIterable {
    case generalist = "Médecin généraliste"
    case neurologist = "Neurologiste"
    case geriatrician = "Gériatre"
    case psychiatrist = "Psychiatre"
    case neuropsychologist = "Neuropsychologue"
    case occupationalTherapist = "Ergothérapeute"
    case psychomotrician = "Psychomtricien"
    case nurse = "Infirmier"
    case other = "Autre"

    var id: Self { self }
}

struct MedicalAppointmentModel: Identifiable {
    var id: UUID = UUID()
    var name: String
    var profilePicture: Image?
    var specialty: MedicalSpeciality
    var date: Date
    var adress: String
    var phoneNumber: String
    var emailAdress: String

}
