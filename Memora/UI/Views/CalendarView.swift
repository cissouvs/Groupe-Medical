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
    @Environment(NotificationViewModel.self) var notificationVM
    @Environment(EventViewModel.self) var eventVM
    @Environment(MedecineViewModel.self) var medicineVM
    @Environment(MedicalAppointmentViewModel.self) var appointmentVM
    
    
    var body: some View {
        VStack {
            DatePicker("", selection: $vm.date, displayedComponents: [.date])
                .datePickerStyle(.graphical)
                .environment(\.locale, Locale.init(identifier: "fr"))
                .tint(.accent)
            VStack {
                Picker("", selection: $selectedCalendarType) {
                    Text("Médicaments")
                        .foregroundStyle(.secondText)
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
                        let medicines = medicineVM.getFilteredMedicines(at: vm.date)
                        if medicines.isEmpty {
                            ContentUnavailableView {
                                Label("Ce médicament est introuvable", systemImage: "pills")
                            }
                        }else{
                            ForEach(
                                medicines.enumerated(),
                                id: \.offset
                            ) { _, medicine in
                                Button {
                                    notificationVM.mainPageNavigationPath.append(.medicine(medicine.id))
                                } label: {
                                    MedicineCardView(medicine: medicine)
                                }
                            }
                        }
                    case .appointment:
                        let appointment = appointmentVM.getFilteredAppointments(at: vm.date)
                        if appointment.isEmpty {
                            ContentUnavailableView {
                                Label("Ce rendez-vous est introuvable", systemImage: "calendar")
                            }
                        } else {
                            ForEach(appointment) { appointment in
                                Button {
                                    notificationVM.mainPageNavigationPath
                                        .append(.appointment(appointment.id))
                                } label: {
                                    AppointmentCardView(medicalAppointment: appointment)
                                }
                            }
                        }
                    case .events:
                        let events = eventVM.getSelectedDayEvents(at: vm.date)
                        if events.isEmpty {
                            ContentUnavailableView {
                                Label("Cet évenement est introuvable", systemImage: "heart.text.clipboard.fill")
                            }
                        } else {
                            ForEach(
                                events.enumerated(),
                                id: \.offset
                            ) { _, event in
                                NavigationLink {
                                    EventDetailView(eventID: event.id)
                                } label: {
                                    EventListElementView(event: event)
                                }
                            }
                        }
                    }
                }
                .scrollIndicators(.hidden)
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Calendrier")
                        .font(.custom("Lexend-Bold", size: 34))
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
            .padding(.horizontal, 12)
            .background(Color.background)
        }
    }
}
#Preview {
    CalendarView(selectedCalendarType: .medications)
        .environment(EventViewModel())
        .environment(MedecineViewModel())
        .environment(MedicalAppointmentViewModel())
        .environment(NotificationViewModel())
}
