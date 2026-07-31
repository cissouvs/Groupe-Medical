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
            Image(systemName: "questionmark.square")
                .clipShape(.rect)
                .frame(width: 70, height: 75)
                .background(.supportBlue)
                .cornerRadius(20)
                .font(.title)
            Text("Accéder à vos quizz")
                .foregroundStyle(Color.background)
        }
        .padding(10)
        .frame(maxWidth: .infinity)
        .background(.secondText)
        .cornerRadius(20)
        .tint(.mainText)
    }
}

#Preview {
    LandingScreenQuizzButtonView()
}
