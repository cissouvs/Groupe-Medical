//
//  AnswerCard.swift
//  Memora
//
//  Created by apprenant92 on 30/07/2026.
//

import SwiftUI

struct AnswerCard: View {
    
    @Binding var isAnswerSelected: Bool
    
    var guess: String
    
    var answerBackground: Color = .background
        
    var body: some View {
            Text(guess)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.background)
                .cornerRadius(20)
                .foregroundStyle(Color.accent)
                .font(.system(size: 16))
                .fontWeight(isAnswerSelected ? .bold : .regular)
                .lineLimit(2)
                .padding(.horizontal)
    }
}

#Preview {
    AnswerCard(isAnswerSelected: .constant(false), guess: "Boire un café ensemble")
}
