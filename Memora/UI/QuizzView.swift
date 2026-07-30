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
                    }
                    .padding(.horizontal, 12)
                    .padding(.bottom, 10)
                    .frame(maxWidth: .infinity, maxHeight: 180)
                    .background(.whiteBackground)
                    .cornerRadius(20)
                    Text("Quiz hebdomadaire")
                        .font(.title)
                        .bold()
                    VStack(alignment: .center, spacing: 20){
                        HStack(alignment: .center, spacing: 20){
                            QuizzCategoryCard(text: "Famille", backgroundCardColor: .supportRed, categoryPicture: "familyPicture")
                            QuizzCategoryCard(text: "Alimentation", backgroundCardColor: .supportYellow, categoryPicture: "mealPicture")
                        }
                        HStack(alignment: .center, spacing: 20){
                            QuizzCategoryCard(text: "Activitées", backgroundCardColor: .supportGreen, categoryPicture: "activityPicture")
                            QuizzCategoryCard(text: "Lieux visités", backgroundCardColor: .supportBlue, categoryPicture: "visitedPlacesPicture")
                        }
                    }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 20)
                    .frame(maxWidth: .infinity, maxHeight: 420)
                    .background(.whiteBackground)
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
