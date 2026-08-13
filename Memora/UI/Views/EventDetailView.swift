//
//  EventDetailView.swift
//  Memora
//
//  Created by Apprenant76 on 25/07/2026.
//

import SwiftUI

struct EventDetailView: View {

    @State var isDeleteConfirmationPresented: Bool = false
    @State var isModifySheetPresented: Bool = false
    @Environment(\.dismiss) var dismiss
    @Environment(EventViewModel.self) var eventVM
    var eventID: UUID

    var event: Event? {
        eventVM.getEvent(from: eventID)
    }

    var headerBackgroundColor: Color {
        switch event?.type {
        case .activity:
            return .tagBlue
        case .birthday:
            return .tagGreen
        case .crisis:
            return .tagRed
        case .other:
            return .tagOrange
        case .none:
            return .tagPurple
        }
    }

    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "fr_FR")
        formatter.setLocalizedDateFormatFromTemplate("EEEE d MMMM à HH:mm")
        return formatter
    }

    var dateFormatterAllDay: DateFormatter {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "fr_FR")
        formatter.setLocalizedDateFormatFromTemplate("EEEE d MMMM")
        return formatter
    }

    var body: some View {
        ZStack {
            Color.background
            if let event {
                VStack(spacing: 40) {
                    VStack {
                        VStack(alignment: .leading, spacing: 30) {
                            VStack(alignment: .leading, spacing: 10) {
                                Text(event.title)
                                    .font(.custom("Lexend-Regular", size: 30))
                                VStack(alignment: .leading, spacing: 5) {
                                    if event.isAllDay {
                                        Text("\(dateFormatterAllDay.string(from: event.date).capitalized)")
                                            .font(.custom("Lexend-Light", size: 20))
                                    } else {
                                        Text("\(dateFormatter.string(from: event.date).capitalized)")
                                            .font(.custom("Lexend-Light", size: 20))
                                        if let endTime = event.endTime {
                                            Text("Jusqu'à \(endTime.formatted(.dateTime.hour().minute()))")
                                                .font(.custom("Lexend-Light", size: 20))
                                                .padding(.bottom, 8)
                                        }
                                    }
                                    if let location = event.location {
                                        Text(location)
                                            .font(.custom("Lexend-Light", size: 20))
                                            .multilineTextAlignment(.leading)
                                            .lineLimit(2)
                                            .fixedSize(horizontal: false, vertical: true)
                                    }
                                }
                                .font(.title3)
                            }
                            .padding(20)
                        }
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 10)
                        .background(headerBackgroundColor)
                    }
                    VStack(alignment: .leading, spacing: 30) {
                        if !event.description.isEmpty {
                            VStack(alignment: .leading)  {
                                Text("Description")
                                    .font(.custom("Lexend-Regular", size: 20))
                                Text(event.description)
                                    .font(.custom("Lexend-Light", size: 16))
                            }
                        }
                        if !event.participants.isEmpty {
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Participants")
                                    .font(.custom("Lexend-Regular", size: 20))
                                HStack {
                                    ForEach(event.participants.enumerated(), id: \.offset) { _, participant in
                                        Text(participant)
                                            .padding(10)
                                            .background(.tagPurple)
                                            .cornerRadius(20)
                                            .font(.custom("Lexend-Regular", size: 16))
                                    }
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    Button {
                        isDeleteConfirmationPresented = true
                    } label: {
                        Text("Supprimer l'évènement")
                            .font(.custom("Lexend-Regular", size: 16))
                            .padding(20)
                            .background(.supportRed)
                            .foregroundStyle(.white)
                            .cornerRadius(20)

                    }
                    .padding(.bottom, 20)
                }
                .background(.white)
                .cornerRadius(20)
                .shadow(radius: 1.0)
                .toolbar {
                    ToolbarItem(placement: .confirmationAction) {
                        Button {
                            isModifySheetPresented = true
                        } label: {
                            Image(systemName: "pencil.line")
                        }
                    }
                }
                .alert("Voulez-vous vraiment supprimer cet évènement ?", isPresented: $isDeleteConfirmationPresented) {
                    Button("Annuler", role: .cancel) {}
                    Button("Supprimer", role: .destructive) {
                        eventVM.deleteEvent(event: event)
                        dismiss()
                    }
                }
                .sheet(isPresented: $isModifySheetPresented) {
                    ModifyEventSheetView(
                        isAddSheetPresented: $isModifySheetPresented,
                        event: event
                    )
                }
                .padding(12)
            } else {
                ContentUnavailableView {

                }
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    EventDetailView(eventID: mockEvents[1].id)
        .environment(EventViewModel())
}
