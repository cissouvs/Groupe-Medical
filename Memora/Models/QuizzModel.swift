//
//  QuizzModel.swift
//  Memora
//
//  Created by apprenant92 on 29/07/2026.
//

import Foundation
import SwiftUI

enum QuizzCategory {
    
    case family
    case activity
    case meal
    case placesVisited
    
    var text: String {
        switch self {
        case .family: return "Famille"
        case .activity: return "Activité"
        case .meal: return "Repas"
        case .placesVisited: return "Lieux Visités"
        }
    }
    
    var mainColor: Color {
        switch self {
        case .family: return .supportRed
        case .activity: return .supportYellow
        case .meal: return .supportGreen
        case .placesVisited: return .supportBlue
        }
    }
    
    var secondaryColor: Color {
        switch self {
        case .family: return .tagRed
        case .activity: return .tagYellow
        case .meal: return .tagGreen
        case .placesVisited: return .tagBlue
        }
    }
    
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
