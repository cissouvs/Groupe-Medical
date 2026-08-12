//
//  TakingTimingScrollView.swift
//  Memora
//
//  Created by Apprenant76 on 07/08/2026.
//

import SwiftUI

struct TakingTimingScrollView: View {

    var takingMoments: [MedicineTakeTiming]

    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 10) {
                ForEach(takingMoments.enumerated(), id: \.offset) {
                    _,
                    takingMoment in
                    Text(
                        takingMoment.rawValue
                    )
                    .font(.custom("Lexend-Regular", size: 16))
                    .padding(.vertical, 5)
                    .padding(.horizontal, 10)
                    .frame(width: 160)
                    .background(getTagColor(timing: takingMoment))
                    .cornerRadius(20)
                    .font(.callout)
                }
            }
        }
        .scrollIndicators(.hidden)
        .frame(minHeight: 30)
    }
}

#Preview {
    TakingTimingScrollView(takingMoments: MedicineTakeTiming.allCases)
}
