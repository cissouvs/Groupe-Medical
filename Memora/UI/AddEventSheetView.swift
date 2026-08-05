//
//  AddCalenderSheetToolbarView.swift
//  Memora
//
//  Created by Apprenant76 on 25/07/2026.
//

import SwiftUI

struct AddEventSheetView: View {
    @Binding var isAddSheetPresented: Bool
    @State var vm = AddEvenSheetViewModel()
    @Environment(EventViewModel.self) var eventVM

    var body: some View {
        NavigationView {
            EventFormSheetView(
                isAddSheetPresented: $isAddSheetPresented,
                eventForm: $vm.eventForm
            )
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        isAddSheetPresented = false
                        eventVM.resetEventForm()
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
                        eventVM.addEvent()
                        isAddSheetPresented = false
                    } label: {
                        Image(systemName: "checkmark")
                    }
                    .tint(.accent)
                    .buttonStyle(.glassProminent)
                    .disabled(vm.eventForm.title.isEmpty)
                }
            }
        }
    }
}


#Preview {
    AddEventSheetView(
        isAddSheetPresented: .constant(true)
    )
    .environment(EventViewModel())
}
