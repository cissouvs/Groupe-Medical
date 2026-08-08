//
//  AnswerCard.swift
//  Memora
//
//  Created by apprenant92 on 30/07/2026.
//

import SwiftUI

struct DailyQuestionAnswerCard: View {
    
    @Environment(DailyQuestionViewModel.self) var dailyQuestionVM
    
    let guessIndex: Int
    
    var answerBackground: Color {
        if dailyQuestionVM.isDailyQuestionAnswered {
            if dailyQuestionVM.dailyQuestion.rightAnswerValues[guessIndex] {
                return Color.tagGreen
            } else if dailyQuestionVM.selectedAnswers[guessIndex] {
                return Color.tagRed
            }
        }
        return Color.background
    }
    
    var correctIndex = dailyQuestion.rightAnswerValues.firstIndex(of: true)
    
    var body: some View {
        Text(dailyQuestionVM.dailyQuestion.guesses[guessIndex])
            .frame(width: 170, height: 40)
            .padding(.vertical)
            .background(answerBackground)
            .cornerRadius(20)
            .foregroundStyle(Color.accent)
            .font(.system(size: 16))
            .fontWeight(dailyQuestionVM.selectedAnswers[guessIndex] ? .bold : .regular)
            .lineLimit(2)
    }
}

//#Preview {
//    AnswerCard(guessIndex: 0)
//        .environment(DailyQuizzViewModel())
//}

#Preview {
    QuizzView()
}

