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
    
    var body: some View {
        
        ZStack(alignment: .leading) {
            Color.background
                .ignoresSafeArea()
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        QuizHeader(
                            symbol: "sun.max.fill",
                            title: "Question du jour",
                            color: .yellow
                        )
                        Text("14 août 2026")
                            .font(.custom("Lexend-Regular", size: 14))
                    }
                    DailyQuestionCard()
                    QuizHeader(
                        symbol: "questionmark.text.page.fill",
                        title: "Quiz Hebdomadaire",
                        color: .accent
                    )
                    WeeklyQuizz()
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

