//
//  QuizzCategoryCard.swift
//  Memora
//
//  Created by apprenant92 on 30/07/2026.
//

import SwiftUI

struct QuizzCategoryCard: View {
    
    var text: String
    
    var backgroundCardColor: Color
    
    var categoryPicture: String
    
    var body: some View {
        NavigationLink {
            DetailQuizzView()
        } label: {
            VStack(alignment: .center, spacing: 10) {
                HStack{
                    Image(categoryPicture)
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                HStack {
                    Text(text)
                        .font(.title)
                        .padding(.bottom, 10)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(backgroundCardColor)
            .cornerRadius(20)
            .foregroundStyle(Color.background)
        }
    }
}

#Preview {
    QuizzCategoryCard(text: "Lieux Visités", backgroundCardColor: .green, categoryPicture: "mealPicture")
}
