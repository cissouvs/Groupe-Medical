//
//  EventDetailView.swift
//  Memora
//
//  Created by Apprenant76 on 25/07/2026.
//

import SwiftUI

struct EventDetailView: View {
    var event: Event

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
                VStack(alignment: .leading, spacing: 30) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text(event.title)
                            .font(.largeTitle)
                        Text("\(dateFormatter.string(from: event.date))")
                            .font(.title3)
                    }
                    if !event.description.isEmpty {
                        VStack(alignment: .leading)  {
                            Text("Description")
                                .font(.title2)
                            Text(event.description)
                        }
                    }
                    if let location = event.location {
                        VStack(alignment: .leading) {
                            Text("Où")
                                .font(.title2)
                            Text(location)
                        }
                    }
                    if !event.participants.isEmpty {
                        VStack(alignment: .leading) {
                            Text("Participants")
                                .font(.title2)
                            HStack {
                                ForEach(event.participants.enumerated(), id: \.offset) { _, participant in
                                    Text(participant)
                                        .padding(10)
                                        .background(.accent)
                                        .foregroundStyle(.white)
                                        .cornerRadius(20)
                                }
                            }
                        }
                    }
                }
                Button {

                } label: {
                    Text("Supprimer l'évènement")
                        .padding(20)
                        .background(.supportRed)
                        .foregroundStyle(.white)
                        .cornerRadius(20)

                }
            }
            .padding(20)
            .background(.white)
            .cornerRadius(20)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button {

                    } label: {
                        Image(systemName: "pencil.line")
                    }
                }
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    EventDetailView(event: crisis[0])
}
