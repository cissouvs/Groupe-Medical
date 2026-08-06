//
//  AnswerCard.swift
//  Memora
//
//  Created by apprenant92 on 30/07/2026.
//

import SwiftUI

struct AnswerCard: View {

    @Environment(QuizzViewModel.self) var quizzVM

//    @Binding var isAnswerSelected: Bool

//    var guess: String
    let guessIndex: Int

    var answerBackground: Color = .background

    var body: some View {
        Button {
            quizzVM.toggleDailyQuestionGuess(index: guessIndex)
        } label: {
            Text(quizzVM.dailyQuestion.guesses[guessIndex])
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.background)
                .cornerRadius(20)
                .foregroundStyle(Color.accent)
                .font(.system(size: 16))
                .fontWeight(quizzVM.selectedAnswers[guessIndex] ? .bold : .regular)
                .lineLimit(2)
                .padding(.horizontal)
        }
    }
}

#Preview {
    AnswerCard(guessIndex: 0)
        .environment(QuizzViewModel())
}
