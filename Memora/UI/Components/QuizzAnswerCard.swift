//
//  QuizzAnswerCard.swift
//  Memora
//
//  Created by apprenant92 on 07/08/2026.
//


import SwiftUI

struct QuizzAnswerCard: View {
    
    @Environment(QuizzViewModel.self) var quizzVM
    
    let guessIndex: Int
    
    let quizzIndex: Int
    
    let questionIndex: Int
    
    var answerBackground: Color {
        if quizzVM.isQuestionAnswered {
            if quizzVM.quizzes[quizzIndex].questions[questionIndex].rightAnswerValues[guessIndex] {
                return Color.tagGreen
            } else if quizzVM.selectedAnswers[guessIndex] {
                return Color.tagRed
            }
        }
        return Color.background
    }

    var body: some View {
        Text(quizzVM.quizzes[quizzIndex].questions[questionIndex].guesses[guessIndex])
            .frame(width: 300, height: 40)
            .padding(.vertical)
            .background(answerBackground)
            .cornerRadius(20)
            .foregroundStyle(quizzVM.selectedAnswers[guessIndex] ? .mainText : .secondText)
            .font(.system(size: 16))
            .fontWeight(quizzVM.selectedAnswers[guessIndex] ? .bold : .regular)
            .lineLimit(2)
    }
}

#Preview {
    QuizzAnswerCard(guessIndex: 0, quizzIndex: 0, questionIndex: 0)
        .environment(QuizzViewModel())
}

//#Preview {
//    QuizzView()
//}

