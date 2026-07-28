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
        date: calendar.date(from: DateComponents(year: 2026, month: 7, day: 29, hour: 22, minute: 00))!,
        isAllDay: false,
        endTime: Optional(calendar.date(from: DateComponents(year: 2026, month: 7, day: 29, hour: 22, minute: 00))!),
        description: "Soirée d'anniversaire au Buffalo Grill avec les copines",
        type: .birthday ,
        participants: ["Colette Levrelle"],
        location: "24 rue des archers, 34000 Montpellier"
    )
]

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
