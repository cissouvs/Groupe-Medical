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
        HStack {
            Text(quizzVM.quizzes[quizzIndex].questions[questionIndex].guesses[guessIndex])
                .frame(width: 270, height: 40, alignment: .leading)
                .lineLimit(2)
            Image(systemName: "circle")
        }
        .foregroundStyle(quizzVM.selectedAnswers[guessIndex] ? .mainText : .secondText)
        .fontWeight(quizzVM.selectedAnswers[guessIndex] ? .semibold : .regular)
        .font(.system(size: 16))
        .frame(width: 350, height: 40)
        .padding(.vertical)
        .background {
            RoundedRectangle(cornerRadius: 15)
                .fill(answerBackground)
        }
        .overlay {
            RoundedRectangle(cornerRadius: 15)
                .stroke(quizzVM.selectedAnswers[guessIndex] ? .mainText : .secondText
                        , lineWidth: quizzVM.selectedAnswers[guessIndex] ? 1 : 0.5)
        }
    }
}

#Preview {
    QuizzAnswerCard(guessIndex: 0, quizzIndex: 0, questionIndex: 0)
        .environment(QuizzViewModel())
}

//#Preview {
//    QuizzView()
//}

