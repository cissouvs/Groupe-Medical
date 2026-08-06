//
//  DetailQuizzView.swift
//  Memora
//
//  Created by apprenant92 on 30/07/2026.
//

import SwiftUI

struct DetailQuizzView: View {
    
    @State var quizz: Quizz
    
    var mainColorCategory: Color {
        switch quizz.category {
        case .family: return .supportRed
        case .activity: return .supportGreen
        case .meal: return .supportOrange
        case .visitedPlaces: return .supportBlue
        }
    }
    
    var secondaryColorCategory: Color {
        switch quizz.category {
        case .family: return .tagRed
        case .activity: return .tagGreen
        case .meal: return .tagOrange
        case .visitedPlaces: return .tagBlue
        }
    }
    
    @State var selectedAnswers: [Bool] = [false, false, false,false]
    
    @State var isValid = false
    
    @State private var currentQuestionIndex = 0
    
    var currentQuestion: Question {
        quizz.questions[currentQuestionIndex]
    }
    
    @State private var isAnswerCorrect = false
    
    @State private var quizFinished = false
    
    var body: some View {
        
        ZStack {
            mainColorCategory
                .ignoresSafeArea()
            VStack {
                if quizFinished {
                    CardFinishTaskView()
                        .frame(height: 400)
                        .cornerRadius(20)
                        .padding()
                } else {
                    VStack(spacing: 10) {
                        HStack {
                            Text(currentQuestion.question)
                                .font(.title2)
                                .fontWeight(.semibold)
                                .fixedSize(horizontal: false, vertical: true)
                                .lineLimit(2)
                        }
                        .padding(.vertical, 10)
                        VStack {
//                            Button(action: {
//                                selectedAnswers[0].toggle()
//                            }) {
//                                AnswerCard(isAnswerSelected: $selectedAnswers[0], guess: currentQuestion.guesses[0])
//                            }
//                            Button(action: {
//                                selectedAnswers[1].toggle()
//                            }) {
//                                AnswerCard(isAnswerSelected: $selectedAnswers[1], guess: currentQuestion.guesses[1])
//                            }
//                            
//                            
//                            Button(action: {
//                                selectedAnswers[2].toggle()
//                            }) {
//                                AnswerCard(isAnswerSelected: $selectedAnswers[2], guess: currentQuestion.guesses[2])
//                            }
//                            Button(action: {
//                                selectedAnswers[3].toggle()
//                            }) {
//                                AnswerCard(isAnswerSelected: $selectedAnswers[3], guess: currentQuestion.guesses[3])
//                            }
                            AnswerCard(guessIndex: 0)
                            AnswerCard(guessIndex: 1)
                            AnswerCard(guessIndex: 2)
                            AnswerCard(guessIndex: 3)
                        }
                        .frame(maxHeight: 300)
                    }
                    .padding(.horizontal, 12)
                    .padding(.bottom, 10)
                    .cornerRadius(20)
                    Button {
                        if currentQuestionIndex < quizz.questions.count - 1 {
                            currentQuestionIndex += 1
                            isAnswerCorrect = false
                            selectedAnswers = [false, false, false, false]
                        } else {
                            quizFinished = true
                        }
                    } label: {
                        HStack {
                            Image(systemName: "arrow.right")
                            Text(currentQuestion.IsAnswerCorrect ? "Suivant" : "Validé")
                        }
                        .font(.title2)
                        .foregroundStyle(.whiteBackground)
                        .frame(maxWidth: 150)
                        .padding()
                        .background(.accent)
                        .cornerRadius(20)
                    }
                }
            }
        }
    }
}

#Preview {
    DetailQuizzView(quizz: familyQuizz
    )
    .environment(QuizzViewModel())

}
