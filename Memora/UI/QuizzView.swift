//
//  QuizzView.swift
//  Memora
//
//  Created by apprenant92 on 30/07/2026.
//

import SwiftUI

struct QuizzView: View {
    
    var body: some View {
        NavigationStack{
            ZStack(alignment: .leading) {
                Color.background
                    .ignoresSafeArea()
                VStack(alignment: .leading, spacing: 20) {
                    Text("Question du jour")
                        .font(.title)
                        .bold()
                    VStack(spacing: 10) {
                        HStack {
                            Text("Quel endroit as-tu particulièrement aimé visiter ?")
                                .font(.title2)
                        }
                        .padding(.vertical, 10)
                        HStack {
                            AnswerCard(text: "La mer", backgroundCardColor: .tagPurple)
                            AnswerCard(text: "La montagne", backgroundCardColor: .tagPurple)
                        }
                        HStack {
                            AnswerCard(text: "La campagne", backgroundCardColor: .tagPurple)
                            AnswerCard(text: "La ville", backgroundCardColor: .tagPurple)
                        }
                        Button{
                            
                        } label: {
                            HStack {
                                Image(systemName: "arrow.right")
                                Text("Répondre")
                            }
                            .font(.title2)
                            .foregroundStyle(.mainText)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(.tagPurple)
                            .cornerRadius(20)
                        }
                    }
                    .padding(.horizontal, 12)
                    .padding(.bottom, 10)
                    .frame(maxWidth: .infinity, maxHeight: 220)
                    .background(.whiteBackground)
                    .cornerRadius(20)
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
    QuizzView()
}
