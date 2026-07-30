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
    
    var body: some View {
        NavigationLink {
            DetailQuizzView()
        } label: {
            Text(text)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(backgroundCardColor)
                .cornerRadius(20)
                .foregroundStyle(Color.background)
        }
    }
}

#Preview {
    QuizzCategoryCard(text: "Lieux Visités", backgroundCardColor: .green)
}
