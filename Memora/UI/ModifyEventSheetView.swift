//
//  ModifyEventSheetToolbarView.swift
//  Memora
//
//  Created by Apprenant76 on 28/07/2026.
//

import SwiftUI

struct ModifyEventSheetView: View {
    @Binding var isAddSheetPresented: Bool
    var event: Event
    @State private var vm = ModifyEventSheetViewModel()
    @Environment(EventViewModel.self) var eventVM
    
    var body: some View {
        NavigationView {
            EventFormSheetView(isAddSheetPresented: $isAddSheetPresented, eventForm: $vm.eventForm)
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
                            eventVM.updateEvent(event: event)
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
        .environment(vm)
    }
}
