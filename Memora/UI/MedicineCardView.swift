//
//  MedicamentCardView.swift
//  Memora
//
//  Created by Apprenant76 on 30/07/2026.
//

import SwiftUI

func getTagColor(dayTime: DayMoment) -> Color {
    switch dayTime {
    case .getUp:
        Color.tagOrange
    case .bedTime:
        Color.tagBlue
    case .breakfast:
        Color.tagGreen
    case .lunch:
        Color.tagPurple
    case .diner:
        Color.tagBlue
    }
}

struct MedicineCardView: View {
    var medicine: any Medicine

    var body: some View {
        HStack(spacing: 20) {
            ZStack {
                AsyncImage(url: URL(string: medicine.imageUrl)) { image in
                    image
                        .resizable()
                        .padding(10)
                } placeholder: {
                    Image(systemName: "pilss.fill")
                        .resizable()
                        .padding(15)
                }
            }
            .background(.tagBlue)
            .clipShape(.circle)
            .frame(width: 70, height: 70)
            .clipped()
            VStack(alignment: .leading, spacing: 10) {
                Text(medicine.medicineType.rawValue)
                Text(medicine.posologyString)
                    .foregroundStyle(.secondText)
                TakingTimingScrollView(medicine: medicine)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(10)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
        .frame(minWidth: 300)
        .background(.whiteBackground)
        .foregroundStyle(.black)
        .cornerRadius(20)
    }
}


struct TakingTimingScrollView: View {

    var medicine: any Medicine

    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 10) {
                ForEach(medicine.takingMoments.enumerated(), id: \.offset) {
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

#Preview {
    MedicineCardView(medicine: mockMedicines[1])
}
