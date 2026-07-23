//
//  EventModel.swift
//  Memora
//
//  Created by Leskeu  on 22/07/2026.
//

import Foundation

struct Event: Identifiable {
    var id = UUID()
    var title: String
    var date: Date
    var hour: Date
    var description: String
    var type: EventType
    var contact: Contact?
    var location: String?
}

enum EventType: String, Identifiable, CaseIterable {
    case crisis = "Crise"
    case birthday = "Anniversaire"
    case activity = "Activité"
    case other = "Autre"

    var id: Self {self}
}

