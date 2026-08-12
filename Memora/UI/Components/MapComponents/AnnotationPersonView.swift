//
//  AnnotationPersonView.swift
//  Memora
//
//  Created by apprenant92 on 11/08/2026.
//

import SwiftUI

struct AnnotationPersonView: View {
    
    var color: Color
    var picture: String = "yann"
    
    var body: some View {
        ZStack {
            Triangle()
                .fill(color)
                .frame(width: 50, height: 40)
                .offset(x: 0, y: 20)
            Image(picture)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .overlay {
                    Circle()
                        .stroke(color, lineWidth: 3)
                }
        }
    }
}


#Preview {
    AnnotationPersonView(color: .supportBlue)
}
