//
//  AddCalendarElementSheetView.swift
//  Memora
//
//  Created by Apprenant76 on 24/07/2026.
//

import SwiftUI


struct AddCalendarElementSheetView: View {
    @Binding var isAddSheetPresented: Bool
    @Binding var events: [Event]
    @State var eventTitle: String = ""
    @State var eventDescription: String = ""
    @State var eventType: EventType = .other
    @State var isEventAllDay: Bool = false
    @State var eventDate: Date = Date()
    @State var eventEndTime: Date = Date().addingTimeInterval(1500.0)
    @State var eventLocation: String = ""
    @State var newParticipant: String = ""
    @State var eventParticipants: [String] = []


    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Titre", text: $eventTitle)
                        .onSubmit {
                        }
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
                        .tint(.accent)
                    if isEventAllDay {
                        DatePicker("Jour", selection: $eventDate, displayedComponents: [.date])
                            .datePickerStyle(.automatic)
                    } else {
                        DatePicker("Début", selection: $eventDate)
                            .datePickerStyle(.automatic)
                        DatePicker("Fin", selection: $eventEndTime)
                            .datePickerStyle(.automatic)
                    }
                    TextField("Lieu", text: $eventLocation)
                    VStack(alignment: .leading) {
                        TextField("Participant", text: $newParticipant)
                    }
                    ScrollView(.horizontal) {
                        LazyHStack {
                            ForEach(
                                eventParticipants.enumerated(),
                                id: \.offset
                            ) { index, participant in
                                HStack {
                                    Text(participant)
                                    Button {
                                        eventParticipants.remove(at: index)
                                    } label: {
                                        Image(systemName: "xmark")
                                            .foregroundStyle(.mainText)
                                    }
                                }
                                .padding(10)
                                .background(Color.background)
                                .cornerRadius(20)
                            }
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        isAddSheetPresented = false
                        eventTitle = ""
                        eventDescription = ""
                        isEventAllDay = false
                        eventDate = Date()
                        eventEndTime = Date()
                        eventType = .other
                        eventLocation = ""
                        eventParticipants = []
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
                                Event(
                                    title: eventTitle,
                                    date: eventDate,
                                    isAllDay: isEventAllDay,
                                    endTime: isEventAllDay ? nil : eventEndTime,
                                    description: eventDescription,
                                    type: eventType,
                                    participants: []
                                )
                            )
                        isAddSheetPresented = false
                    } label: {
                        Image(systemName: "checkmark")
                    }
                    .tint(.accent)
                    .buttonStyle(.glassProminent)
                    .disabled(eventTitle.isEmpty)
                }
            }

        }
    }
}



#Preview {
    AddCalendarElementSheetView(isAddSheetPresented: .constant(true), events: .constant(events))
}
