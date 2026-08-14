//
//  FinishCardView.swift
//  UrbanCanvas
//
//  Created by apprenant92 on 06/07/2026.
//

import SwiftUI

struct CardFinishTaskView: View {
    
    @State var isTouch = false
    
    let quizzIndex: Int
    
    @Environment(QuizzViewModel.self) var quizzVM
    
    var body: some View {
        VStack {
            let score = quizzVM.quizzes[quizzIndex].correctAnswer
            Image(systemName: score <= 2 ? "xmark.seal" :
                    score <= 4 ? "checkmark.circle" :
                    "checkmark.seal")
                .foregroundStyle(.white)
                .font(.system(size: 80))
                .padding(10)
                .background(
                    score <= 2 ? .red :
                    score <= 4 ? .orange :
                    .green
                )
                .cornerRadius(100)
                .padding()
            Text(score <= 2 ? "Dommage !" :
                    score <= 4 ? "Bien joué !" :
                    "Félicitations !")
                .font(.title)
                .multilineTextAlignment(.center)
                .foregroundStyle(.mainText)
                .bold()
                .padding(8)
            Text("Vous avez obtenu le score de")
                .font(.title3)
                .multilineTextAlignment(.leading)
            HStack {
                Text("\(quizzVM.quizzes[quizzIndex].correctAnswer)")
                    .font(.title2)
                    .bold()
                Text("bonnes réponses sur 6 questions.")
                    .font(.title3)
            }
        }
        .padding(.horizontal, 12)
        .padding(.bottom, 10)
        .frame(maxWidth: .infinity, maxHeight: 500)
        .background(.whiteBackground)
        .cornerRadius(20)
    }
}


#Preview {
    CardFinishTaskView(quizzIndex: 0)
        .environment(QuizzViewModel())
}
