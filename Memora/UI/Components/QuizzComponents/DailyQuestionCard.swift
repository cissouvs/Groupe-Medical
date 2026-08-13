//
//  DailyQuestionCard.swift
//  Memora
//
//  Created by Leskeu  on 13/08/2026.
//

import SwiftUI

struct DailyQuestionCard: View {
    
    @Environment(DailyQuestionViewModel.self) var dailyQuestionVM
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(dailyQuestionVM.dailyQuestion.question)
                .font(.custom("Lexend-Regular", size: 20))
                .fixedSize(horizontal: false, vertical: true)
                .lineLimit(2)
                .padding(.top, 10)
            Text("Choisissez votre réponse.")
                .foregroundStyle(.secondText)
                .font(.custom("Lexend-Regular", size: 16))
            
                .padding(.bottom, 10)
            VStack(spacing: 10) {
                ForEach(dailyQuestionVM.dailyQuestion.guesses.indices, id: \.self) { guess in
                    Button {
                        dailyQuestionVM.toggleGuess(index: guess)
                    } label: {
                        DailyQuestionAnswerCard(guessIndex: guess)
                            .environment(dailyQuestionVM)
                    }
                    .disabled(dailyQuestionVM.isDailyQuestionAnswered)
                }
            }
            Button{
                dailyQuestionVM.isDailyQuestionAnswered.toggle()
            } label: {
                HStack {
                    Image(systemName: dailyQuestionVM.isDailyQuestionAnswered ? "" : "arrow.right.circle.fill")
                        .font(.title)
                    Text(dailyQuestionVM.isDailyQuestionAnswered ? "Reviens demain pour ta prochaine question" : "Répondre")
                    
                    Text("")
                }
                .font(.custom(dailyQuestionVM.isDailyQuestionAnswered ? "Lexend-SemiBold" : "Lexend-Regular", size: dailyQuestionVM.isDailyQuestionAnswered ? 14 : 20))
                .foregroundStyle(dailyQuestionVM.isDailyQuestionAnswered ? .mainText : .whiteBackground)
                .frame(maxWidth: .infinity, maxHeight: 40, alignment: .center)
                .background(dailyQuestionVM.isDailyQuestionAnswered ?.background : .accent)
                .cornerRadius(20)
            }
            .disabled(dailyQuestionVM.isDailyQuestionAnswered)
        }
        .padding(.horizontal, 12)
        .padding(.bottom, 10)
        .frame(maxWidth: .infinity)
        .frame(height: 420)
        .background {
            RoundedRectangle(cornerRadius: 15)
                .fill(.whiteBackground)
        }
        .overlay {
            RoundedRectangle(cornerRadius: 15)
                .stroke(.secondText.opacity(0.5), lineWidth: 0.5)
        }
        
    }
}
