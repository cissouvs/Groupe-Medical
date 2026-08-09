//
//  CalendarView.swift
//  Memora
//
//  Created by Apprenant76 on 22/07/2026.
//

import SwiftUI

enum CalendarType: Identifiable, Hashable {
    case medications
    case appointment
    case events

    var id: Self  { self }
}

struct CalendarView: View {
    
    @State private var vm = CalendarViewModel()
    @State var isAddSheetPresented: Bool = false
    @State var selectedCalendarType: CalendarType
    @Binding var path: [Screen]
    @Environment(EventViewModel.self) var eventVM
    @Environment(MedecineViewModel.self) var medicineVM
    @Environment(MedicalAppointmentViewModel.self) var appointmentVM

    var body: some View {
        VStack {
            DatePicker("", selection: $vm.date, displayedComponents: [.date])
                .datePickerStyle(.graphical)
                .environment(\.locale, Locale.init(identifier: "fr"))
                .tint(.accent)
            VStack(spacing: 20) {
                Picker("", selection: $selectedCalendarType) {
                    Text("Médicaments")
                        .tag(CalendarType.medications)
                    Text("Rendez-vous")
                        .tag(CalendarType.appointment)
                    Text("Evènements")
                        .tag(CalendarType.events)
                }
                .pickerStyle(.segmented)
                ScrollView {
                    switch selectedCalendarType {
                    case .medications:
                        ForEach(
                            medicineVM.getFilteredMedicines(at: vm.date).enumerated(),
                            id: \.offset
                        ) { _, medicine in
                            Button {
                                path.append(.medicine(medicine.id))
                            } label: {
                                MedicineCardView(medicine: medicine)
                            }
                        }
                    case .appointment:
                        ForEach(appointmentVM.getFilteredAppointments(at: vm.date)) { appointment in
                            Button {
                                path.append(.appointment)
                            } label: {
                                AppointmentCardView(medicalAppointment: appointment)
                            }
                        }
                    case .events:
                        ForEach(
                            eventVM.getSelectedDayEvents(at: vm.date).enumerated(),
                            id: \.offset
                        ) { index, event in
                            NavigationLink {
                                EventDetailView(event: eventVM.events[index])
                            } label: {
                                EventListElementView(event: event)
                            }
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Calendrier")
                        .font(.largeTitle)
                        .bold()
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isAddSheetPresented = true
                    } label: {
                        Image(systemName: "plus")
                            .foregroundStyle(.black)
                    }
                }
            }
            .sheet(isPresented: $isAddSheetPresented) {
                AddSheetView(
                    isAddSheetPresented: $isAddSheetPresented
                )
            }
        }
        .padding(.horizontal, 12)
        .background(Color.background)
    }
}

#Preview {
    CalendarView(selectedCalendarType: .medications, path: .constant([]))
        .environment(EventViewModel())
        .environment(MedecineViewModel())
        .environment(MedicalAppointmentViewModel())
}
