//
//  MockEvent.swift
//  Memora
//
//  Created by Leskeu  on 22/07/2026.
//

import Foundation

let calendar = Calendar.current

var events = [
    Event(
        title: "Anniversaire de Chantal",
        date: calendar.date(from: DateComponents(year: 2026, month: 7, day: 29))!,
        hour: calendar.date(from: DateComponents(hour: 20, minute: 00))!,
        description: "Soirée d'anniversaire au Buffalo Grill avec les copines",
        type: .birthday ,
        contact: Contact(emailAdress: "colette@caramail.fr", firstName: "Colette", surName: "Levrelle", phoneNumber: "0304040404", adress: "21 impasse de la Charette,",postalCode: " 46800 Montcuq", photo: "colette"),
        location: "24 rue des archers, 34000 Montpellier"
    )
]
