//
//  CalendarView.swift
//  Memora
//
//  Created by Apprenant76 on 22/07/2026.
//

import SwiftUI

enum CalendarSelectedView: Hashable {
    case medications
    case events
}

struct CalendarView: View {
    
    @State private var vm = CalendarViewModel()
    @State var isAddSheetPresented: Bool = false
    @State private var selectedCalendarType: CalendarSelectedView = .medications
    @Environment(EventViewModel.self) var eventVM
    @Environment(MedecineViewModel.self) var medicineVM
   
    var body: some View {
        VStack {
            DatePicker("", selection: $vm.date, displayedComponents: [.date])
                .datePickerStyle(.graphical)
                .environment(\.locale, Locale.init(identifier: "fr"))
                .tint(.accent)
            VStack(spacing: 20) {
                Picker("", selection: $selectedCalendarType) {
                    Text("Médicaments")
                        .tag(CalendarSelectedView.medications)
                    Text("Evènements")
                        .tag(CalendarSelectedView.events)
                }
                .pickerStyle(.segmented)
                ScrollView {
                    switch selectedCalendarType {
                    case .medications:
                        ForEach(
                            medicineVM.getFilteredMedicines(at: vm.date).enumerated(),
                            id: \.offset
                        ) { _, medicine in
                            MedicineCardView(medicine: medicine)
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
                AddEventSheetView(
                    isAddSheetPresented: $isAddSheetPresented
                )
            }
        }
        .padding(.horizontal, 12)
        .background(Color.background)
    }
}

#Preview {
    CalendarView()
        .environment(EventViewModel())
        .environment(MedecineViewModel())
}
