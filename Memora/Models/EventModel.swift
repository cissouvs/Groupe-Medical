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
    var isAllDay: Bool
    var endTime : Date?
    var description: String
    var type: EventType
    var participants: [String]
    var location: String?

    init(
        id: UUID = UUID(),
        title: String,
        date: Date,
        isAllDay: Bool,
        endTime: Date? = nil,
        description: String,
        type: EventType,
        participants: [String],
        location: String? = nil
    ) {
        self.id = id
        self.title = title
        self.date = date
        self.isAllDay = isAllDay
        self.endTime = endTime
        self.description = description
        self.type = type
        self.participants = participants
        self.location = location
    }

    init(from event: Event) {
        self.title = event.title
        self.date = event.date
        self.isAllDay = event.isAllDay
        self.endTime = event.endTime
        self.description = event.description
        self.type = event.type
        self.participants = event.participants
        self.location = event.location
    }
}

enum EventType: String, Identifiable, CaseIterable {
    case crisis = "Crise"
    case birthday = "Anniversaire"
    case activity = "Activité"
    case other = "Autre"

    var id: Self {self}
}

