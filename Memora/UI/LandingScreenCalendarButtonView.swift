//
//  LandingScreenCalendarButtonView.swift
//  Memora
//
//  Created by Apprenant76 on 31/07/2026.
//

import SwiftUI

struct LandingScreenCalendarButtonView: View {

    var calendarViewType: CalendarType

    var logoName: String {
        switch calendarViewType {
        case .medications:
            "cross.vial"
        case .appointment:
            "stethoscope"
        case .events:
            "1.calendar"
        }
    }

    var title: String {
        switch calendarViewType {
        case .medications:
            "Médicaments"
        case .appointment:
            "Rendez-vous"
        case .events:
            "Evénements"
        }
    }

    var color: Color {
        switch calendarViewType {
        case .medications:
            Color.supportRed
        case .appointment:
            Color.supportOrange
        case .events:
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
                .font(.custom("Lexend-Regular", size: 12))
                
        }
        .padding(10)
        .background(.secondText)
        .cornerRadius(20)
        .tint(.mainText)
    }
}

#Preview {
    LandingScreenCalendarButtonView(calendarViewType: .medications)
}
