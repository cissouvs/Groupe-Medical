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

enum FormType {
    case add
    case modify
}


struct EventFormSheetView: View {
    @Binding var isAddSheetPresented: Bool
    @State var newParticipant: String = ""
    @FocusState private var focusedField: FieldType?
    @Binding var eventForm: Event
    
    var body: some View {

        Form {
            Section {
                TextField(text: $eventForm.title){
                    Text("Titre")
                        .font(.custom("Lexend-Regular", size: 16))
                }
                    .focused($focusedField, equals: .title)
                TextField(text: $eventForm.description){
                    Text("Description")
                        .font(.custom("Lexend-Regular", size: 16))
                }
                    .focused($focusedField, equals: .description)
                Picker(selection: $eventForm.type) {
                    ForEach(EventType.allCases) { type in
                        Text(type.rawValue).tag(type)
                    }
                } label: {
                    Text("Titre")
                        .font(.custom("Lexend-Regular", size: 16))
                }
                .tint(.accent)
            }
            Section {
                Toggle(isOn: $eventForm.isAllDay){
                    Text("Journée entière")
                        .font(.custom("Lexend-Regular", size: 16))
                }
                    .tint(.accent)
                if eventForm.isAllDay {
                    DatePicker(selection: $eventForm.date, displayedComponents: [.date]){
                        Text("Jour")
                            .font(.custom("Lexend-Regular", size: 16))
                    }
                        .datePickerStyle(.automatic)
                } else {
                    DatePicker(selection: $eventForm.date){
                        Text("Début")
                            .font(.custom("Lexend-Regular", size: 16))
                    }
                        .datePickerStyle(.automatic)
                    if let eventEndTime  = Binding($eventForm.endTime) {
                        DatePicker(selection: eventEndTime){
                            Text("Fin")
                                .font(.custom("Lexend-Regular", size: 16))
                        }
                            .datePickerStyle(.automatic)
                    }
                }
                if let eventLocation = Binding($eventForm.location) {
                    TextField(text: eventLocation){
                        Text("Lieu")
                            .font(.custom("Lexend-Regular", size: 16))
                    }
                        .focused($focusedField, equals: .location)
                }
                VStack(alignment: .leading) {
                    TextField(text: $newParticipant){
                        Text("Participant")
                            .font(.custom("Lexend-Regular", size: 16))
                    }
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
                .scrollIndicators(.hidden)
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
    }
}



#Preview {
    EventFormSheetView(
        isAddSheetPresented: .constant(true),
        eventForm: .constant(
            mockEvents[0]
        )
    )

}
