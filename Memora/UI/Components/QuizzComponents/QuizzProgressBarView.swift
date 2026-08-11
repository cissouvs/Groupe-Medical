//
//  QuizzProgressBarView.swift
//  Memora
//
//  Created by apprenant92 on 08/08/2026.
//

import SwiftUI

struct QuizzProgressBarView: View {
    
    let currentQuestion: Int
    
    let totalQuestions: Int = 6
    
    var progress: Double {
        Double(currentQuestion) / Double(totalQuestions)
    }
    
    var color: Color
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Question \(currentQuestion) sur \(totalQuestions)")
                .font(.headline)
                .foregroundStyle(.primary)
            HStack(spacing: 18) {
                ForEach(1...totalQuestions, id: \.self) { question in
                    Circle()
                        .fill(
                            question <= currentQuestion
                            ? color
                            : Color.gray.opacity(0.2)
                        )
                        .frame(width: 10, height: 10)
                }
            }
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    Capsule()
                        .fill(Color.gray.opacity(0.2))
                    Capsule()
                        .fill(color)
                        .frame(
                            width: geometry.size.width * progress
                        )
                }
            }
            .frame(height: 6)
        }
    }
}

#Preview {
    QuizzProgressBarView(currentQuestion: 0, color: .supportRed)
}
