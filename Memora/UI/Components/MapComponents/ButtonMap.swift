//
//  ButtonMap.swift
//  Memora
//
//  Created by apprenant92 on 12/08/2026.
//

import SwiftUI

struct ButtonMap: View {
    
    var symbole: String
    var color: Color
    
    var body: some View {
        Image(systemName: symbole)
            .font(.system(size: 25))
            .foregroundStyle(.white)
            .padding(10)
            .frame(width: 50, height: 50)
            .background(color)
            .clipShape(.circle)
    }
}

#Preview {
    ButtonMap(symbole: "paperplane.fill", color: .supportOrange)
}
