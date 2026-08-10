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
    @State var medicineFormVM = MedicineSheetFormViewModel()
    @State var appointmentFormVM = MedicalAppointmentFormViewModel()
    @Environment(EventViewModel.self) var eventVM
    @Environment(MedecineViewModel.self) var medicineVM
    @Environment(MedicalAppointmentViewModel.self) var appointmentVM

    var isAddButtonDisabled: Bool {
        switch selectedType {
        case .medications:
            switch medicineFormVM.medicineForm.medicineType {
            case .capsule:
                if  medicineFormVM.medicineForm.capsuleNumber == nil ||
                        medicineFormVM.medicineForm.weight == nil {
                    return true
                }
            case .drinkable:
                if medicineFormVM.medicineForm.volume == nil {
                    return true
                }
            case .patch:
                if medicineFormVM.medicineForm.patchNumber == nil ||
                    medicineFormVM.medicineForm.duration == nil {
                    return true
                }
            }
        case .appointment:
            return appointmentFormVM.appointmentForm.name.isEmpty
        case .events:
            return addEventVM.eventForm.title.isEmpty
        }
        return false
    }

    var body: some View {
        NavigationView {
            VStack {
                Picker("Type Picker", selection: $selectedType) {
                    Text("Evènements")
                        .tag(CalendarType.events)
                    Text("Rendez-vous")
                        .tag(CalendarType.appointment)
                    Text("Médicaments")
                        .tag(CalendarType.medications)
                }
                .pickerStyle(.segmented)
                VStack {
                    switch selectedType {
                    case .medications:
                        MedicineSheetFormView(medicineForm: $medicineFormVM.medicineForm)
                    case .appointment:
                        MedicalAppointmentSheetFormView(
                            appointmentForm: $appointmentFormVM.appointmentForm
                        )
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
                            switch selectedType {
                            case .medications:
                                medicineVM.addMedicine(medicineForm: medicineFormVM.medicineForm)
                            case .appointment:
                                appointmentVM
                                    .addAppointment(
                                        appointmentForm: appointmentFormVM.appointmentForm
                                    )
                            case .events:
                                eventVM.addEvent(eventForm: addEventVM.eventForm)
                            }
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
    .environment(MedecineViewModel())
    .environment(MedicalAppointmentViewModel())
}
