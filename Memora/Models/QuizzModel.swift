//
//  QuizzModel.swift
//  Memora
//
//  Created by apprenant92 on 29/07/2026.
//

import Foundation
import SwiftUI

enum QuizzCategory: String {
    
    case family = "Famille"
    case activity = "Activité"
    case meal = "Repas"
    case placesVisited = "Lieux Visités"
    
}

struct Question {
    
    var question: String
    var guesses: [String]
    var rightAnswerIndex: [Int]
    var IsAnswerCorrect: Bool
}


struct Quizz {
    
    var title: String
    var category: QuizzCategory
    var questions: [Question]
    var isCompleted: Bool
    
    var mainColor: Color {
        switch category {
        case .family: return .supportRed
        case .activity: return .supportYellow
        case .meal: return .supportGreen
        case .placesVisited: return .supportBlue
        }
    }

    var secondaryColor: Color {
        switch category {
        case .family: return .tagRed
        case .activity: return .tagYellow
        case .meal: return .tagGreen
        case .placesVisited: return .tagBlue
        }
    }
    
}
