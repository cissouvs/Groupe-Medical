//
//  QuizzView.swift
//  Memora
//
//  Created by apprenant92 on 30/07/2026.
//

import SwiftUI

struct QuizzView: View {
    
    @State private var vm = QuizzViewModel()

    @State var isDailyQuestionAnswered = false
    
    var body: some View {
        
        NavigationStack{
            ZStack(alignment: .leading) {
                Color.background
                    .ignoresSafeArea()
                VStack(alignment: .leading, spacing: 10) {
                    Text("Question du jour")
                        .font(.title)
                        .fontWeight(.regular)
                    if isDailyQuestionAnswered == false {
                        VStack(spacing: 10) {
                            HStack {
                                Text(vm.dailyQuestion.question)
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .fixedSize(horizontal: false, vertical: true)
                                    .lineLimit(2)
                                
                            }
                            .padding(.vertical, 10)
                            HStack {
                                AnswerCard(
                                    guessIndex: 0
                                )
                                AnswerCard(
                                    guessIndex: 1
                                )
                            }
                            HStack {
                                AnswerCard(
                                    guessIndex: 2
                                )
                                AnswerCard(
                                    guessIndex: 3
                                )
                            }
                            Button{
                                isDailyQuestionAnswered.toggle()
                                vm.checkDailyQuestionAnswer()
                            } label: {
                                HStack {
                                    Image(systemName: "arrow.right")
                                    Text(vm.dailyQuestion.IsAnswerCorrect ? "Bien joué" : "Répondre")
                                }
                                .font(.title2)
                                .foregroundStyle(.whiteBackground)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .background(.accent)
                                .cornerRadius(20)
                            }
                        }
                        .padding(.horizontal, 12)
                        .padding(.bottom, 10)
                        .frame(maxWidth: .infinity, maxHeight: 250)
                        .background(.whiteBackground)
                        .cornerRadius(20)
                    } else {
                        CardFinishTaskView()
                    }
                    Text("Quiz hebdomadaire")
                        .font(.title)
                        .fontWeight(.regular)
                    VStack(alignment: .center, spacing: 10){
                        HStack(alignment: .center, spacing: 10){
                            QuizzCategoryCard(quizz: vm.quizzes[0])
                            QuizzCategoryCard(quizz: vm.quizzes[1])
                        }
                        HStack(alignment: .center, spacing: 10){
                            QuizzCategoryCard(quizz: vm.quizzes[2])
                            QuizzCategoryCard(quizz: vm.quizzes[3])
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: 500)
                    .cornerRadius(20)
                }
                .padding(.horizontal, 12)
            }
        }
        .environment(vm)
    }
}

#Preview {
    QuizzView()
}

