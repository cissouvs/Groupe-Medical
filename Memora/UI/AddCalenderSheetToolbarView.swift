//
//  AddCalenderSheetToolbarView.swift
//  Memora
//
//  Created by Apprenant76 on 25/07/2026.
//

import SwiftUI

struct AddCalenderSheetToolbarView: ToolbarContent {

    @Binding var events: [Event]
    @Binding var isAddSheetPresented: Bool
    @Binding var eventForm: Event

    var body: some ToolbarContent {
        ToolbarItem(placement: .cancellationAction) {
            Button {
                isAddSheetPresented = false
                eventForm.title = ""
                eventForm.description = ""
                eventForm.isAllDay = false
                eventForm.date = Date()
                eventForm.endTime = Date().addingTimeInterval(1500.0)
                eventForm.type = .other
                eventForm.location = ""
                eventForm.participants = []
            } label: {
                Image(systemName: "xmark")
            }
        }
        ToolbarItem(placement: .principal) {
            Text("Nouveau")
                .font(.title2)
        }
        ToolbarItem(placement: .confirmationAction) {
            Button {
                events
                    .append(
                        Event(from: eventForm)
                    )
                isAddSheetPresented = false
            } label: {
                Image(systemName: "checkmark")
            }
            .tint(.accent)
            .buttonStyle(.glassProminent)
            .disabled(eventForm.title.isEmpty)
        }
    }
}
