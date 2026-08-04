//
//  QuizzView.swift
//  Memora
//
//  Created by apprenant92 on 30/07/2026.
//

import SwiftUI

struct QuizzView: View {
    
    @State var question: Question
    
    @State var quizz: Quizz
    
    @State var selectedAnswers: [Bool] = [false, false, false,false]
    
    @State var dailyQuestion = false
    
    var body: some View {
        
        NavigationStack{
            ZStack(alignment: .leading) {
                Color.background
                    .ignoresSafeArea()
                VStack(alignment: .leading, spacing: 10) {
                    Text("Question du jour")
                        .font(.title)
                        .fontWeight(.regular)
                    if dailyQuestion == false {
                        VStack(spacing: 10) {
                            HStack {
                                Text(question.question)
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .fixedSize(horizontal: false, vertical: true)
                                    .lineLimit(2)
                                
                            }
                            .padding(.vertical, 10)
                            HStack {
                                Button(action: {
                                    selectedAnswers[0].toggle()
                                }) {
                                    AnswerCard(isAnswerSelected: $selectedAnswers[0], guess: question.guesses[0])
                                }
                                Button(action: {
                                    selectedAnswers[1].toggle()
                                }) {
                                    AnswerCard(isAnswerSelected: $selectedAnswers[1], guess: question.guesses[1])
                                }
                            }
                            HStack {
                                Button(action: {
                                    selectedAnswers[2].toggle()
                                }) {
                                    AnswerCard(isAnswerSelected: $selectedAnswers[2], guess: question.guesses[2])
                                }
                                Button(action: {
                                    selectedAnswers[3].toggle()
                                }) {
                                    AnswerCard(isAnswerSelected: $selectedAnswers[3], guess: question.guesses[3])
                                }
                            }
                            Button{
                                dailyQuestion.toggle()
                                if question.rightAnswerValues == selectedAnswers {
                                    question.IsAnswerCorrect = true
                                }
                            } label: {
                                HStack {
                                    Image(systemName: "arrow.right")
                                    Text(question.IsAnswerCorrect ? "Bien joué" : "Répondre")
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
                            QuizzCategoryCard(quizz: familyQuizz)
                            QuizzCategoryCard(quizz: mealQuizz)
                        }
                        HStack(alignment: .center, spacing: 10){
                            QuizzCategoryCard(quizz: activityQuizz)
                            QuizzCategoryCard(quizz: visitedPlacesQuizz)
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: 500)
                    .cornerRadius(20)
                }
                .padding(.horizontal, 12)
            }
        }
    }
}

#Preview {
    QuizzView(question: Question(
        question: "Quand est l'anniversaire de Théo ?",
        guesses: [
            "Le 9 juin 1997",
            "Le 10 janvier 1997",
            "Le 28 juillet 1997",
            "Le 15 avril 1997"
        ],
        rightAnswerValues: [true, false, false, false],
        IsAnswerCorrect: false
    ), quizz: familyQuizz
)
}

