//
//  WeeklyQuizz.swift
//  Memora
//
//  Created by Leskeu  on 13/08/2026.
//

import SwiftUI

struct WeeklyQuizz: View {
    
    @Environment(QuizzViewModel.self) var quizzVM
    @Environment(NotificationViewModel.self) var notificationVM
    
    var columns = [ GridItem(.flexible()), GridItem(.flexible())]
    
    
    
    var body: some View {
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
}

