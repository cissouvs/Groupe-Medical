//
//  EventDetailView.swift
//  Memora
//
//  Created by Apprenant76 on 25/07/2026.
//

import SwiftUI

struct EventDetailView: View {
    var event: Event
    @Binding var events: [Event]
    @State var isDeleteConfirmationPresented: Bool = false
        @Environment(\.dismiss) var dismiss

    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "fr_FR")
        formatter.setLocalizedDateFormatFromTemplate("EEEE d MMMM à HH:mm")
        return formatter
    }

    var body: some View {
        ZStack {
            Color.background
            VStack(spacing: 40) {
                VStack {
                    VStack(alignment: .leading, spacing: 30) {
                        VStack(alignment: .leading, spacing: 10) {
                            Text(event.title)
                                .font(.largeTitle)
                            VStack(alignment: .leading, spacing: 5) {
                                Text("\(dateFormatter.string(from: event.date).capitalized)")
                                if let location = event.location {
                                    Text(location)
                                }
                            }
                            .font(.title3)
                        }
                        .padding(20)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 10)
                    .background(.tagRed)
                }
                VStack(alignment: .leading, spacing: 30) {
                    if !event.description.isEmpty {
                        VStack(alignment: .leading)  {
                            Text("Description")
                                .font(.title2)
                            Text(event.description)
                        }
                    }
                    if !event.participants.isEmpty {
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Participants")
                                .font(.title2)
                            HStack {
                                ForEach(event.participants.enumerated(), id: \.offset) { _, participant in
                                    Text(participant)
                                        .padding(10)
                                        .background(.tagPurple)
                                        .cornerRadius(20)
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
                    } label: {
                        Image(systemName: "pencil.line")
                    }
                }
            }

            .alert("Voulez-vous vraiment supprimer cet évènement ?", isPresented: $isDeleteConfirmationPresented) {
                Button("Annuler", role: .cancel) {}
                Button("Supprimer", role: .destructive) {
                    if let eventIndex = events.firstIndex(of: event) {
                        events.remove(at: eventIndex)
                    }
                    dismiss()
                }
            }
            .padding(12)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    EventDetailView(event: crisis[0], events: .constant(events))
}
