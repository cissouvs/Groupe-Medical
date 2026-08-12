//
//  QuizzView.swift
//  Memora
//
//  Created by apprenant92 on 30/07/2026.
//

import SwiftUI

struct QuizzView: View {
    
    @Environment(DailyQuestionViewModel.self) var dailyQuestionVM
    @Environment(QuizzViewModel.self) var quizzVM
    @Environment(NotificationViewModel.self) var notificationVM
    
    var columns = [ GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        
        ZStack(alignment: .leading) {
            Color.background
                .ignoresSafeArea()
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        HStack {
                            Image(systemName: "sun.max.fill")
                                .foregroundStyle(.yellow)
                                .font(.title)
                            Text("Question du jour")
                                .font(.custom("Lexend-Regular", size: 20))

                        }
                        .fontWeight(.semibold)
                        .frame(width: 280, alignment: .leading)
                        Text("14 août 2026")
                            .font(.custom("Lexend-Regular", size: 14))

                    }
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
                    HStack {
                        Image(systemName: "questionmark.text.page.fill")
                            .font(.title2)
                            .foregroundStyle(.accent)
                        Text("Quiz hebdomadaire")
                            .font(.custom("Lexend-SemiBold", size: 20))
                    }
                    VStack(alignment: .center, spacing: 10){
                        LazyVGrid(columns: columns, spacing: 10) {
                            ForEach(quizzVM.quizzes.enumerated(), id: \.offset) { index, quizz  in
                                Button {
                                    notificationVM.mainPageNavigationPath
                                        .append(.detailQuizz(index))
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
            .scrollIndicators(.hidden)
        }
        .environment(quizzVM)
    }
}

#Preview {
    QuizzView()
        .environment(QuizzViewModel())
        .environment(DailyQuestionViewModel())
        .environment(NotificationViewModel())
}

