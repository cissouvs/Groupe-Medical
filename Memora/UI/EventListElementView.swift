//
//  EventListElementView.swift
//  Memora
//
//  Created by Apprenant76 on 23/07/2026.
//

import SwiftUI

struct EventListElementView: View {
    var event : Event
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(alignment: .top, spacing: 20) {
                Text(event.title)
                Spacer()
                Text(event.hour.formatted(.dateTime.hour().minute()))
            }
            .padding(.vertical, 10)
            .font(.title2)
            Text(event.description)
                .foregroundStyle(.secondText)
                .font(.title3)
        }
        .padding(10)
        .background(event.type == .crisis ? .tagRed : .white)
        .cornerRadius(20)
    }
}

#Preview {
    EventListElementView(event: events[0])
}
