//
//  ModifyEventSheetViewModel.swift
//  Memora
//
//  Created by Leskeu  on 05/08/2026.
//

import Foundation

@Observable
final class ModifyEventSheetViewModel {
    var eventForm: Event = Event(
        title: "",
        date: Date(),
        isAllDay: false,
        description: "",
        type: .other,
        participants: []
    )
    
    func resetEventForm(eventForm: Event) {
        eventForm.title = ""
        eventForm.description = ""
        eventForm.isAllDay = false
        eventForm.date = Date()
        eventForm.endTime = Date().addingTimeInterval(1500.0)
        eventForm.type = .other
        eventForm.location = ""
        eventForm.participants = []
    }
}
