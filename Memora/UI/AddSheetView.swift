//
//  AddCalenderSheetToolbarView.swift
//  Memora
//
//  Created by Apprenant76 on 25/07/2026.
//

import SwiftUI

struct AddSheetView: View {
    @Binding var isAddSheetPresented: Bool
    @State private var selectedType: CalendarType = .events
    @State var addEventVM = AddEvenSheetViewModel()
    @State var medicineVM = MedicineSheetFormViewModel()
    @Environment(EventViewModel.self) var eventVM

    var isAddButtonDisabled: Bool {
        if selectedType == .events {
            return addEventVM.eventForm.title.isEmpty
        }
        switch medicineVM.medicineForm.medicineType {
        case .capsule:
            if  medicineVM.medicineForm.capsuleNumber == nil ||
                    medicineVM.medicineForm.weight == nil {
                return true
            }
        case .drinkable:
            if medicineVM.medicineForm.volume == nil {
                return true
            }
        case .patch:
            if medicineVM.medicineForm.patchNumber == nil ||
                medicineVM.medicineForm.duration == nil {
                return true
            }
        }
        return false
    }

    var body: some View {
        NavigationView {
            VStack {
                Picker("Type Picker", selection: $selectedType) {
                    Text("Evènements")
                        .tag(CalendarType.events)
                    Text("Médicaments")
                        .tag(CalendarType.medications)
                }
                .pickerStyle(.segmented)
                VStack {
                    switch selectedType {
                    case .medications:
                        MedicineSheetFormView(medicineForm: $medicineVM.medicineForm)
                    case .appointment:
                        VStack {}
                    case .events:
                        EventFormSheetView(
                            isAddSheetPresented: $isAddSheetPresented,
                            eventForm: $addEventVM.eventForm
                        )
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button {
                            isAddSheetPresented = false
                            addEventVM.resetEventForm()
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
                            eventVM.addEvent(eventForm: addEventVM.eventForm)
                            isAddSheetPresented = false
                        } label: {
                            Image(systemName: "checkmark")
                        }
                        .tint(.accent)
                        .buttonStyle(.glassProminent)
                        .disabled(isAddButtonDisabled)
                    }
                }
            }
            .background(Color.background)
        }
    }
}


#Preview {
    AddSheetView(
        isAddSheetPresented: .constant(true)
    )
    .environment(EventViewModel())
}
