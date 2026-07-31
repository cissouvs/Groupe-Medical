//
//  LandingScreenCalendarButtonView.swift
//  Memora
//
//  Created by Apprenant76 on 31/07/2026.
//

import SwiftUI

enum CalendarType: CaseIterable, Identifiable {
    case medecine
    case appointment
    case event

    var id: Self { self }
}

struct LandingScreenCalendarButtonView: View {

    var calendarViewType: CalendarType

    var logoName: String {
        switch calendarViewType {
        case .medecine:
            "cross.vial"
        case .appointment:
            "stethoscope"
        case .event:
            "1.calendar"
        }
    }

    var title: String {
        switch calendarViewType {
        case .medecine:
            "Médicaments"
        case .appointment:
            "Rendez-vous"
        case .event:
            "Evénements"
        }
    }

    var color: Color {
        switch calendarViewType {
        case .medecine:
            Color.supportRed
        case .appointment:
            Color.supportOrange
        case .event:
            Color.supportGreen
        }
    }


    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: logoName)
                .clipShape(.rect)
                .frame(width: 70, height: 75)
                .background(color)
                .cornerRadius(20)
                .font(.title)
            Text(title)
                .foregroundStyle(Color.background)
                .font(.caption)
        }
        .padding(10)
        .background(.secondText)
        .cornerRadius(20)
        .tint(.mainText)
    }
}

#Preview {
    LandingScreenCalendarButtonView(calendarViewType: .medecine)
}
