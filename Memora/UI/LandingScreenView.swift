//
//  LandingScreenView.swift
//  Memora
//
//  Created by Apprenant76 on 29/07/2026.
//

import SwiftUI
import UIKit

struct LandingScreenView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color.background
                VStack(alignment: .leading, spacing: 10) {
                    ScrollView {
                        LandingScreenHeaderView()
                        Divider()
                        VStack(alignment: .leading, spacing: 20) {
                            Text("Prochain Rendez-Vous")
                                .foregroundStyle(.secondText)
                            AppointmentCardView()
                            Text("Rappel")
                                .foregroundStyle(.secondText)
                            MedicineCardView()
                            Text("Vue d'ensemble")
                            HStack {
                                LandingScreenCalendarButtonView(calendarViewType: .medecine)
                                Spacer()
                                LandingScreenCalendarButtonView(calendarViewType:.appointment)
                                Spacer()
                                LandingScreenCalendarButtonView(calendarViewType: .event)
                            }
                            .padding(10)
                            .background(.whiteBackground)
                            .cornerRadius(20)
                            Text("S'exercer")
                                .foregroundStyle(.secondText)
                            LandingScreenQuizzButtonView()

                        }
                    }
                }
                .padding(.horizontal, 12)
                .padding(.top, 60)
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    LandingScreenView()
}
