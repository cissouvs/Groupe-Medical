//
//  LandingScreenQuizzButtonView.swift
//  Memora
//
//  Created by Apprenant76 on 31/07/2026.
//

import SwiftUI

struct LandingScreenQuizzButtonView: View {

    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: "questionmark.square.fill")
                .font(.system(size: 50))
                .clipShape(.rect)
                .frame(width: 70, height: 75)
                .background(.supportBlue)
                .cornerRadius(20)
                .font(.title)
            VStack(alignment: .leading) {
                Text("Accéder à vos quizz")
                    .font(.custom("Lexend-Regular", size: 20))
                Text("Testez vos connaisances et progressez chaque jour")
                    .font(.custom("Lexend-Regular", size: 12))
            }
            .foregroundStyle(.mainText)
            .padding(.horizontal, 20)
            Image(systemName: "chevron.right")
                .padding(8)
                .frame(width: 30, height: 30)
                .background(.supportBlue)
                .cornerRadius(100)
        }
        .foregroundStyle(.whiteBackground)
        .padding(10)
        .frame(maxWidth: .infinity)
        .background(.tagBlue.opacity(0.5))
        .cornerRadius(20)
        .tint(.mainText)
    }
}

#Preview {
    LandingScreenQuizzButtonView()
}
