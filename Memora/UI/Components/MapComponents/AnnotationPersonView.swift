//
//  AnnotationPersonView.swift
//  Memora
//
//  Created by apprenant92 on 11/08/2026.
//

import SwiftUI

struct AnnotationPersonView: View {
    
    var color: Color
    
    var body: some View {
        ZStack {
            Triangle()
                .fill(color)
                .frame(width: 25, height: 20)
                .offset(x: 0, y: 20)
            Image(systemName: "person")
                .scaledToFill()
                .frame(width: 30, height: 30)
                .clipShape(Circle())
                .overlay {
                    Circle()
                        .stroke(color, lineWidth: 3)
                }
        }
//                                        .foregroundStyle(.white)
//                                        .padding()
//                                        .background(.supportBlue)
//                                        .frame(width: 30, height: 30)
//                                        .clipShape(.circle)
    }
}


#Preview {
    AnnotationPersonView(color: .supportBlue)
}
