//
//  ContactButton.swift
//  Memora
//
//  Created by Leskeu  on 13/08/2026.
//
import SwiftUI

struct ContactButtonView: View {
    var backgroundColor: Color
    var sfSymbol: String
    var body: some View {
        Image(systemName: sfSymbol)
            .padding(20)
            .foregroundStyle(.white)
            .background(backgroundColor)
            .clipShape(.circle)
        
    }
}

