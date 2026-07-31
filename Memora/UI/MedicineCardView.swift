//
//  MedicamentCardView.swift
//  Memora
//
//  Created by Apprenant76 on 30/07/2026.
//

import SwiftUI

struct MedicineCardView: View {

    var body: some View {
        HStack(spacing: 20) {
            Image("")
                .resizable()
                .background(.tagBlue)
                .clipShape(.circle)
                .frame(width: 70, height: 70)
                .clipped()
            VStack(alignment: .leading, spacing: 10) {
                Text("Donépezil")
                Text("150 mg, 1 capsule")
                HStack(spacing: 10) {
                    Text("Après Petit Déj")
                        .padding(.vertical, 5)
                        .padding(.horizontal, 10)
                        .background(.tagGreen)
                        .cornerRadius(20)
                        .font(.callout)
                    Text("Coucher")
                        .padding(.vertical, 5)
                        .padding(.horizontal, 10)
                        .background(.tagBlue)
                        .cornerRadius(20)
                        .font(.callout)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(10)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
        .foregroundStyle(.black)
        .background(.whiteBackground)
        .cornerRadius(20)
    }
}

#Preview {
    MedicineCardView()
}
