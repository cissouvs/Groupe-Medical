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
        HStack {
            Text(dailyQuestionVM.dailyQuestion.guesses[guessIndex])
                .lineLimit(2)
                .padding(.horizontal)
                .frame(width: 270, height: 40, alignment: .leading)
            Image(systemName: dailyQuestionVM.selectedAnswers[guessIndex] ? "checkmark.circle.fill" : "circle")
        }
        .foregroundStyle(dailyQuestionVM.selectedAnswers[guessIndex] ? .accent : .mainText)
        .fontWeight(dailyQuestionVM.selectedAnswers[guessIndex] ? .bold : .regular)
        .font(.custom("Lexend-Regular", size: 16))
        .frame(width: 350, height: 40)
        .padding(.vertical, 8)
        .background {
            RoundedRectangle(cornerRadius: 15)
                .fill(answerBackground)
        }
        .overlay {
            RoundedRectangle(cornerRadius: 15)
                .stroke(dailyQuestionVM.selectedAnswers[guessIndex] ? .accent : .secondText
                        , lineWidth: dailyQuestionVM.selectedAnswers[guessIndex] ? 1 : 0.5)
        }
    }
}

