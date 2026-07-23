//
//  CalendarView.swift
//  Memora
//
//  Created by Apprenant76 on 22/07/2026.
//

import SwiftUI

struct CalendarView: View {
    @State var date = Date()
    @State var isAddSheetPresented: Bool = true
    @State var eventTitle: String = ""
    @State var eventDescription: String = ""
    @State var eventType: EventType = .other
    @State var isEventAllDay: Bool = false
    @State var eventDate: Date = Date()

    var calendar = Calendar.current

    var events: [Event]
    var selectedDayEvents: [Event] {
        events.filter({
            calendar.compare($0.date, to: date, toGranularity: .day) == .orderedSame
        })
    }
    var body: some View {
        NavigationStack {
            ScrollView {
                DatePicker("", selection: $date, displayedComponents: [.date])
                    .datePickerStyle(.graphical)
                    .environment(\.locale, Locale.init(identifier: "fr"))
                    .tint(.accent)
                ForEach(selectedDayEvents) { event in
                    EventListElementView(event: event)
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
                Form {
                    Section {
                        TextField("Titre", text: $eventTitle)
                        TextField("Description", text: $eventDescription)
                        Picker("Type", selection: $eventType) {
                            ForEach(EventType.allCases) { type in
                                Text(type.rawValue).tag(type)
                            }
                        }
                        .tint(.accent)
                    }

                    Section {
                        Toggle("Journée Entière", isOn: $isEventAllDay)
                        DatePicker("Début", selection: $eventDate)
                            .datePickerStyle(.automatic)
                        DatePicker("Fin", selection: $eventDate)
                            .datePickerStyle(.automatic)
                    }
                }
            }
            .padding(.horizontal, 12)
            .background(Color.background)
        }
    }
}

#Preview {
    CalendarView(events: crisis)
}
