//
//  AddCalendarElementSheetView.swift
//  Memora
//
//  Created by Apprenant76 on 24/07/2026.
//

import SwiftUI

enum FieldType {
    case title
    case description
    case location
    case partipants
}


struct AddCalendarElementSheetView: View {
    @Binding var isAddSheetPresented: Bool
    @Binding var events: [Event]
    @State var newParticipant: String = ""
    @State var eventForm: Event = Event(
        title: "",
        date: Date(),
        isAllDay: false,
        endTime: Date().addingTimeInterval(1500.0),
        description: "",
        type: .other,
        participants: [],
        location: ""
    )

    @FocusState private var focusedField: FieldType?


    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Titre", text: $eventForm.title)
                        .focused($focusedField, equals: .title)
                    TextField("Description", text: $eventForm.description)
                        .focused($focusedField, equals: .description)
                    Picker("Type", selection: $eventForm.type) {
                        ForEach(EventType.allCases) { type in
                            Text(type.rawValue).tag(type)
                        }
                    }
                    .tint(.accent)
                }
                Section {
                    Toggle("Journée Entière", isOn: $eventForm.isAllDay)
                        .tint(.accent)
                    if eventForm.isAllDay {
                        DatePicker("Jour", selection: $eventForm.date, displayedComponents: [.date])
                            .datePickerStyle(.automatic)
                    } else {
                        DatePicker("Début", selection: $eventForm.date)
                            .datePickerStyle(.automatic)
                        if let eventEndTime  = Binding($eventForm.endTime) {
                            DatePicker("Fin", selection: eventEndTime)
                                .datePickerStyle(.automatic)
                        }
                    }
                    if let eventLocation = Binding($eventForm.location) {
                        TextField("Lieu", text: eventLocation)
                            .focused($focusedField, equals: .location)
                    }
                    VStack(alignment: .leading) {
                        TextField("Participant", text: $newParticipant)
                            .focused($focusedField, equals: .partipants)
                    }
                    ScrollView(.horizontal) {
                        LazyHStack {
                            ForEach(
                                eventForm.participants.enumerated(),
                                id: \.offset
                            ) { index, participant in
                                HStack {
                                    Text(participant)
                                    Button {
                                        eventForm.participants.remove(at: index)
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
            .onSubmit {
                switch focusedField {
                case .title:
                    focusedField = .description
                case .description:
                    focusedField = nil
                case .location:
                    focusedField = .partipants
                case .partipants:
                    eventForm.participants.append(newParticipant)
                    newParticipant = ""
                    focusedField = .partipants
                case nil:
                    ()
                }
            }
            .toolbar{
                AddCalenderSheetToolbarView(
                    events: $events,
                    isAddSheetPresented: $isAddSheetPresented,
                    eventForm: $eventForm
                )
            }
        }
    }
}



#Preview {
    AddCalendarElementSheetView(isAddSheetPresented: .constant(true), events: .constant(events))
}
