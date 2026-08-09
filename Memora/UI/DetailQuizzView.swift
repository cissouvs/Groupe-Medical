//
//  DetailQuizzView.swift
//  Memora
//
//  Created by apprenant92 on 30/07/2026.
//

import SwiftUI

struct DetailQuizzView: View {
    
    @Environment(QuizzViewModel.self) var quizzVM
    
    @State private var currentQuestionIndex = 0
    
    @State var discovery: Double = 0
    
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
    
    var quizzIndex: Int
    
    var quizz: Quizz {
        quizzVM.getQuizz(quizzIndex: quizzIndex)
    }
    
    var currentQuestion: Question {
        if currentQuestionIndex < quizz.questions.count {
            return quizz.questions[currentQuestionIndex]
        } else {
            return quizz.questions[0]
        }
    }
    
    var body: some View {
        
        ZStack {
            Color.whiteBackground
                .ignoresSafeArea()
            VStack {
                if quizzVM.quizzes[quizzIndex].isCompleted
                {
                    CardFinishTaskView(quizzIndex: quizzIndex)
                        .environment(quizzVM)
                        .frame(height: 500)
                        .cornerRadius(20)
                        .padding()
                } else {
                    QuizzProgressBarView(currentQuestion: currentQuestionIndex + 1, color: mainColorCategory)
                    .padding(.horizontal, 40)
                    .padding(.bottom, 60)
                    VStack {
                        VStack(alignment: .leading, spacing: 10) {
                                Text(currentQuestion.question)
                                    .font(.title)
                                    .fontWeight(.semibold)
                                    .fixedSize(horizontal: false, vertical: true)
                                    .lineLimit(2)
                            .padding(.vertical, 10)
                            Text("Choisissez la bonne réponse")
                                .foregroundStyle(.secondText)
                                .padding(.bottom)
                            VStack {
                                ForEach(currentQuestion.guesses.enumerated(), id: \.offset) { index, _ in
                                    Button {
                                        quizzVM.toggleGuess(index: index)
                                    } label: {
                                        QuizzAnswerCard(guessIndex: index, quizzIndex: quizzIndex, questionIndex: currentQuestionIndex)
                                            .environment(quizzVM)
                                    }
                                    .disabled(quizzVM.isQuestionAnswered)
                                }
                            }
                            .frame(maxHeight: 300)
                        }
                        Button {
                            if !quizzVM.isQuestionAnswered {
                                discovery += 1
                                if quizzVM.selectedAnswers == currentQuestion.rightAnswerValues {
                                    quizzVM.quizzes[quizzIndex].correctAnswer += 1
                                }
                                quizzVM.isQuestionAnswered = true
                            } else {
                                if currentQuestionIndex < quizz.questions.count - 1 {
                                    currentQuestionIndex += 1
                                    quizzVM.isQuestionAnswered = false
                                    quizzVM.selectedAnswers = [false, false, false, false]
                                } else {
                                    quizzVM.quizzes[quizzIndex].isCompleted = true
                                    quizzVM.isQuestionAnswered = false
                                }
                            }
                        } label: {
                            HStack {
                                Image(systemName: quizzVM.isQuestionAnswered ?  "arrow.right" : "checkmark")
                                Text(quizzVM.isQuestionAnswered ? "Suivant" : "Validé")
                            }
                            .font(.title2)
                            .foregroundStyle(quizzVM.isQuestionAnswered ? .mainText : .whiteBackground)
                            .fontWeight(quizzVM.isQuestionAnswered ? .semibold : .regular)
                            .frame(maxWidth: 150)
                            .padding()
                            .background(mainColorCategory)
                            .cornerRadius(20)
                        }
                        .padding(.top)
                    }
                    .frame(width: 350)
                    .padding()
                }
                Spacer()
            }
        }
    }
}

#Preview {
    DetailQuizzView(quizzIndex: 0
    )
    .environment(QuizzViewModel())
}

//#Preview {
//    QuizzView()
//}
