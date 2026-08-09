//
//  EventViewModel.swift
//  Memora
//
//  Created by Leskeu  on 05/08/2026.
//

import Foundation

let calendar = Calendar.current
var crisis = [
    Event(
        title: "Crise d'anxiété",
        date: calendar.date(from: DateComponents(year: 2026, month: 7, day: 29, hour: 20, minute: 00))!,
        isAllDay: false,
        endTime: Optional(calendar.date(from: DateComponents(year: 2026, month: 7, day: 29, hour: 22, minute: 00))!),
        description: "Crise d'anxiété durant une promenade",
        type: .crisis,
        participants : []),
    Event(
        title: "Crise d'anxiété",
        date: calendar.date(from: DateComponents(year: 2026, month: 7, day: 23, hour: 20, minute: 00))!,
        isAllDay: false,
        endTime: Optional(calendar.date(from: DateComponents(year: 2026, month: 7, day: 29, hour: 22, minute: 00))!),
        description: "Crise d'anxiété durant une promenade",
        type: .crisis,
        participants : []),
    Event(
        title: "Crise d'anxiété",
        date: calendar.date(from: DateComponents(year: 2026, month: 7, day: 29, hour: 20, minute: 00))!,
        isAllDay: false,
        endTime: Optional(calendar.date(from: DateComponents(year: 2026, month: 7, day: 29, hour: 22, minute: 00))!),
        description: "Crise d'anxiété durant une promenade",
        type: .crisis,
        participants : []),
    Event(
        title: "Crise d'anxiété",
        date: calendar.date(from: DateComponents(year: 2026, month: 7, day: 29, hour: 20, minute: 00))!,
        isAllDay: false,
        endTime: Optional(calendar.date(from: DateComponents(year: 2026, month: 7, day: 29, hour: 22, minute: 00))!),
        description: "Crise d'anxiété durant une promenade",
        type: .crisis,
        participants : [])
]

@Observable
final class EventViewModel {
    
    var events: [Event] = crisis

    
    func getSelectedDayEvents(at date: Date) -> [Event] {
        events.filter({
            calendar.compare($0.date, to: date, toGranularity: .day) == .orderedSame
        })
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

