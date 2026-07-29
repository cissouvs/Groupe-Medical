//
//  QuizzModel.swift
//  Memora
//
//  Created by apprenant92 on 29/07/2026.
//

import Foundation

enum QuizzCategory: String {
    
    case family = "Famille"
    case activity = "Activité"
    case meal = "Repas"
    case placesVisited = "Lieux Visités"
    
}

struct Question {
    
    var question: String
    var guesses: [String]
    var rightAnswerIndex: Int
    var IsAnswerCorrect: Bool
}


struct Quizz {
    
    var title: String
    var category: QuizzCategory
    var question: Question
    var isCompleted: Bool
    
}
