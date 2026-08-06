//
//  ContactListViewModel.swift
//  Memora
//
//  Created by Apprenant76 on 06/08/2026.
//

import Foundation
import SwiftUI

var emergencyContacts = [
    Contact(
        emailAdress: "colettelevrelle@gmail.com",
        firstName: "Colette",
        surName: "Levrelle",
        phoneNumber: "0765259315",
        adress: "11 Rue du Tour de la Vielle ville",
        postalCode: "46800 Montcuq-en-Quercy-Blanc",
        photo: Image("colette")),
    Contact(
        emailAdress: "renelatop@caramail.fr",
        firstName: "Rene",
        surName: "Latop",
        phoneNumber: "0303030303",
        adress: "52 impasse de la Charette,",
        postalCode: " 69000 Lyon",
        photo: Image("rene")),
    Contact(
        emailAdress: "jacques@caramail.fr",
        firstName: "Jacques",
        surName: "Uzi",
        phoneNumber: "0305050505",
        adress: "33 impasse de la Charette,",
        postalCode: "62000 Lievin",
        photo: Image("jacques")),
    Contact(
        emailAdress: "robert@caramail.fr",
        firstName: "Robert",
        surName: "Villiers",
        phoneNumber: "0306060606",
        adress: "45 impasse de la Charette,",
        postalCode: "46800 Montcuq",
        photo: Image("robert")
    ),
]


@Observable
final class ContactListViewModel {
    var contacts : [Contact] = emergencyContacts

    func getContact(id: UUID) -> Contact {
        let contactIndex = contacts.firstIndex(where: { $0.id == id })!
        return contacts[contactIndex]
    }
}
