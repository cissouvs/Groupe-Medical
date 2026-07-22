//
//  EventModel.swift
//  Memora
//
//  Created by Leskeu  on 22/07/2026.
//

import Foundation

struct Event {
    var title: String
    var date: Date
    var hour: Date
    var description: String
    var type: EventType
    var contact: Contact?
    var location: String?
}

enum EventType: String {
    case crisis = "Crise"
    case birthday = "Anniversaire"
    case activity = "Activité"
    case other = "Autre"
}

