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
    
    var description: String {
        switch calendarViewType {
        case .medications:
            "Gérez vos traitements"
        case .appointment:
            "Consultez vos RDV"
        case .events:
            "Voir vos événements"
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
    
    var backgroundColor: Color {
        switch calendarViewType {
        case .medications:
            Color.tagRed
        case .appointment:
            Color.tagOrange
        case .events:
            Color.tagGreen
        }
    }
    
    
    var body: some View {
        VStack {
            Image(systemName: logoName)
                .font(.system(size: 50))
                .clipShape(.rect)
                .frame(width: 75, height: 70)
                .cornerRadius(20)
                .font(.title)
                .foregroundStyle(color)
            Text(title)
                .foregroundStyle(.mainText)
                .font(.custom("Lexend-Medium", size: 13))
            Text(description)
                .font(.custom("Lexend-Regular", size: 11))
                .foregroundStyle(.secondText)
        }
        .frame(width: 93, height: 130)
        .padding(10)
        .background(backgroundColor.opacity(0.5))
        .cornerRadius(20)
        .tint(.mainText)
    }
}

#Preview {
    LandingScreenCalendarButtonView(calendarViewType: .medications)
}
