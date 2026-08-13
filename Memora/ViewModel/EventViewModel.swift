//
//  EventViewModel.swift
//  Memora
//
//  Created by Leskeu  on 05/08/2026.
//

import Foundation

let calendar = Calendar.current
var mockEvents = [
    Event(
        title: "Crise d'anxiété",
        date: calendar.date(from: DateComponents(year: 2026, month: 8, day: 14, hour: 14, minute: 00))!,
        isAllDay: false,
        endTime: calendar.date(from: DateComponents(year: 2026, month: 8, day: 14, hour: 45, minute: 00))!,
        description: "Crise d'anxiété durant une promenade",
        type: .crisis,
        participants : []),
    Event(
        title: "Anniversaire de Chantal",
        date: calendar
            .date(
                from: DateComponents(
                    year: 2026,
                    month: 08,
                    day: 14,
                )
            )!,
        isAllDay: true,
        description: "",
        type: .birthday,
        participants: [],
    ),
    Event(
        title: "Diner avec les enfants",
        date: calendar.date(from: DateComponents(year: 2026, month: 8, day: 13, hour: 19))!,
        isAllDay: false,
        endTime: calendar.date(from: DateComponents(year: 2026, month: 8, day: 13, hour: 22))!,
        description: "Diner avec Marc et Virginie avant qu'il parte en vacances",
        type: .activity,
        participants: ["Marc", "Virginie"],
        location: "14 boulevard Jean Jaurès, 46000 Cahors"
    ),
    Event(
        title: "Livraison du nouveau lave-linge",
        date: calendar.date(from: DateComponents(year: 2026, month: 8, day: 15, hour: 10, minute: 30))!,
        isAllDay: false,
        endTime: calendar.date(from: DateComponents(year: 2026, month: 8, day: 15, hour: 12, minute: 30))!,
        description: "",
        type: .other,
        participants: ["Marc"],
        location: "11 Rue du Tour de la Vielle Ville, 46800 Montcuq-en-Quercy-Blanc"
    )
]

@Observable
final class EventViewModel {
    

    var events: [Event] = mockEvents


    func getSelectedDayEvents(at date: Date) -> [Event] {
        events.filter({
            calendar.compare($0.date, to: date, toGranularity: .day) == .orderedSame
        })
    }

    func getEvent(from id: UUID) -> Event? {
        if let eventIndex = events.firstIndex(where: { $0.id == id }) {
            return events[eventIndex]
        }
        return nil
    }

    func updateEvent(event: Event, eventForm: Event) {
        if let eventIndex = events.firstIndex(of: event) {
            events[eventIndex] = eventForm
        }
    }

    func deleteEvent(event : Event) {
        if let eventIndex = events.firstIndex(of: event) {
            events.remove(at: eventIndex)
        }
    }

    func addEvent(eventForm: Event) {
        events.append(Event(from: eventForm))
    }
}

