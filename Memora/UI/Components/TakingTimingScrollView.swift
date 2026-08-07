//
//  TakingTimingScrollView.swift
//  Memora
//
//  Created by Apprenant76 on 07/08/2026.
//

import SwiftUI

struct TakingTimingScrollView: View {

    var takingMoments: [(timing: Timing, dayMoment: DayMoment)]

    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 10) {
                ForEach(takingMoments.enumerated(), id: \.offset) {
                    _,
                    takingMoment in
                    Text(
                        takingMoment.timing == .none ?
                        takingMoment.dayMoment.rawValue :
                            "\(takingMoment.timing.rawValue) \(takingMoment.dayMoment.rawValue)"
                    )
                    .padding(.vertical, 5)
                    .padding(.horizontal, 10)
                    .background(getTagColor(dayTime: takingMoment.dayMoment))
                    .cornerRadius(20)
                    .font(.callout)
                }
            }
        }
        .frame(minHeight: 30)
    }
}
