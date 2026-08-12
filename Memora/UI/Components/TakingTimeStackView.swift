//
//  TakingTimeStackView.swift
//  Memora
//
//  Created by Apprenant76 on 12/08/2026.
//

import SwiftUI

struct TakingTimingStackView: View {

    var takingMoments: [MedicineTakeTiming]

    var body: some View {
        VStack(spacing: 10) {
            ForEach(takingMoments.enumerated(), id: \.offset) {
                _,
                takingMoment in
                Text(
                    takingMoment.rawValue
                )
                .font(.custom("Lexend-Regular", size: 12))
                .padding(.vertical, 5)
                .padding(.horizontal, 10)
                .frame(width: 125)
                .background(getTagColor(timing: takingMoment))
                .cornerRadius(20)
                .font(.callout)
            }
        }
        .frame(minHeight: 30)
    }
}

#Preview {
    TakingTimingStackView(takingMoments: MedicineTakeTiming.allCases)
}
