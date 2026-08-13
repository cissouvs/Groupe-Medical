//
//  QuizHeader.swift
//  Memora
//
//  Created by Leskeu  on 13/08/2026.
//
import SwiftUI

struct QuizHeader: View {
    var symbol: String
    var title: String
    var color: Color
    var body: some View {
        HStack {
            Image(systemName: symbol)
                .foregroundStyle(color)
                .font(.title)
            Text(title)
                .font(.custom("Lexend-Regular", size: 20))
        }
        .fontWeight(.semibold)
        .frame(width: 280, alignment: .leading)
    }
}


