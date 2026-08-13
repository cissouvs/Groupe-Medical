//
//  QuizzViewModel.swift
//  Memora
//
//  Created by Apprenant76 on 06/08/2026.
//

import Foundation



var dailyQuestion = Question(
    question: "Quand est l'anniversaire de Théo ?",
    guesses: [
        "Le 9 juin 1997",
        "Le 10 janvier 1997",
        "Le 28 juillet 1997",
        "Le 15 avril 1997"
    ],
    rightAnswerValues: [true, false, false, false],
    isAnswerCorrect: false
)

@Observable
final class DailyQuestionViewModel {
    
    var dailyQuestion: Question = Question(
        question: "Qu'as-tu mangé hier midi ?",
        guesses: [
            "Du poulet avec des légumes",
            "Une soupe",
            "Des crêpes",
            "Une pizza"
        ],
        rightAnswerValues: [false, false, false, true],
        isAnswerCorrect: false
    )
    
    var selectedAnswers: [Bool] = [false, false, false,false]
    
    var indexAnswer : Int = 0
    
    var isDailyQuestionAnswered = false
    
    var isSelectedAnswer : Int? = nil
    
    func toggleGuess(index: Int) {
        selectedAnswers[index].toggle()
    }
    
    func checkDailyQuestionAnswer() {
        if dailyQuestion.rightAnswerValues == selectedAnswers {
            dailyQuestion.isAnswerCorrect = true
        }
    }
}
