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
                    HStack(alignment: .top){
                        
                    }
                    .frame(maxWidth: .infinity, maxHeight: 150)
                    .background(.whiteBackground)
                    .cornerRadius(20)
                    Text("Quiz hebdomadaire")
                        .font(.title)
                        .bold()
                    VStack(alignment: .center, spacing: 20){
                        HStack(alignment: .center, spacing: 20){
                            QuizzCategoryCard(text: "Famille", backgroundCardColor: .supportRed)
                            QuizzCategoryCard(text: "Alimentation", backgroundCardColor: .supportYellow)
                        }
                        HStack(alignment: .center, spacing: 20){
                            QuizzCategoryCard(text: "Activitées", backgroundCardColor: .supportGreen)
                            QuizzCategoryCard(text: "Lieux visités", backgroundCardColor: .supportBlue)
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: 300)
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
