//
//  QuizzView.swift
//  Memora
//
//  Created by apprenant92 on 30/07/2026.
//

import SwiftUI

struct QuizzView: View {
    
    @State private var dailyQuestionVM = DailyQuestionViewModel()
    
    @State private var quizzVM = QuizzViewModel()
    
    var columns = [ GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        
        NavigationStack{
            ZStack(alignment: .leading) {
                Color.background
                    .ignoresSafeArea()
                VStack(alignment: .leading, spacing: 10) {
                    Text("Question du jour")
                        .font(.title)
                        .fontWeight(.regular)
                        VStack(spacing: 10) {
                            HStack {
                                Text(dailyQuestionVM.dailyQuestion.question)
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .fixedSize(horizontal: false, vertical: true)
                                    .lineLimit(2)
                            }
                            .padding(.vertical, 10)
                            LazyVGrid(columns: columns, spacing: 10) {
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
                                    Image(systemName: "arrow.right")
                                    Text(dailyQuestionVM.dailyQuestion.IsAnswerCorrect ? "Bien joué" : "Répondre")
                                }
                                .font(.title2)
                                .foregroundStyle(dailyQuestionVM.isDailyQuestionAnswered ?.secondText : .whiteBackground)
                                .frame(maxWidth: .infinity, maxHeight: 40)
                                .background(dailyQuestionVM.isDailyQuestionAnswered ?.background : .accent)
                                .cornerRadius(20)
                                
                            }
                            .disabled(dailyQuestionVM.isDailyQuestionAnswered)
                        }
                        .padding(.horizontal, 12)
                        .padding(.bottom, 10)
                        .frame(maxWidth: .infinity, maxHeight: 260)
                        .background(.whiteBackground)
                        .cornerRadius(20)
                    Text("Quiz hebdomadaire")
                        .font(.title)
                        .fontWeight(.regular)
                    VStack(alignment: .center, spacing: 10){
                        LazyVGrid(columns: columns, spacing: 10) {
                            ForEach(quizzVM.quizzes.enumerated(), id: \.offset) { index, quizz  in
                                NavigationLink {
                                    DetailQuizzView(quizzIndex: index)
                                        .environment(quizzVM)
                                } label: {
                                    QuizzCategoryCard(quizz: quizz)
                                }
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: 500)
                    .cornerRadius(20)
                }
                .padding(.horizontal, 12)
            }
        }
        .environment(quizzVM)
    }
}

#Preview {
    QuizzView()
}

