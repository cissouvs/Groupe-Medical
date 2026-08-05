//
//  AddEvenSheetViewModel.swift
//  Memora
//
//  Created by Leskeu  on 05/08/2026.
//

import Foundation

@Observable
final class AddEvenSheetViewModel {
    var eventForm: Event = Event(
        title: "",
        date: Date(),
        isAllDay: false,
        description: "",
        type: .other,
        participants: []
    )
}
