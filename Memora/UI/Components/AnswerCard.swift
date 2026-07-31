//
//  AnswerCard.swift
//  Memora
//
//  Created by apprenant92 on 30/07/2026.
//

import SwiftUI

struct AnswerCard: View {
    
    @State var isSelected = false
    
    var text: String
    
    var backgroundCardColor: Color
    
    var body: some View {
        Button(action: {
            isSelected.toggle()
        }) {
            Text(text)
                .font(.title2)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(backgroundCardColor)
                .cornerRadius(20)
                .foregroundStyle(Color.mainText)
        }
    }
}
#Preview {
    AnswerCard(text: "Text", backgroundCardColor: .secondText)
}
