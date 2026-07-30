//
//  ModifyEventSheetToolbarView.swift
//  Memora
//
//  Created by Apprenant76 on 28/07/2026.
//

import SwiftUI

struct ModifyEventSheetView: View {
    @Binding var isAddSheetPresented: Bool
    @Binding var event: Event
    @Binding var events: [Event]
    @State var eventForm: Event
    var body: some View {
        NavigationView {
            EventFormSheetView(isAddSheetPresented: $isAddSheetPresented, eventForm: $eventForm)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button {
                            isAddSheetPresented = false
                        } label: {
                            Image(systemName: "xmark")
                        }
                    }
                    ToolbarItem(placement: .principal) {
                        Text("Modifier")
                            .font(.title2)
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button {
                            event = eventForm
                            isAddSheetPresented = false
                        } label: {
                            Image(systemName: "checkmark")
                        }
                        .tint(.accent)
                        .buttonStyle(.glassProminent)
                        .disabled(event.title.isEmpty)
                    }
                }
        }
    }
}
