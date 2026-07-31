//
//  LandingScreenHeaderView.swift
//  Memora
//
//  Created by Apprenant76 on 31/07/2026.
//

import SwiftUI

struct LandingScreenHeaderView: View {

    @Binding var  path: [Screen]

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("Bonjour,")
                Text("Yann")
                    .fontWeight(.semibold)
                    .font(.title)
            }
            Spacer()
            HStack(spacing: 20) {
                Button {

                } label: {
                    Image(systemName: "bell")
                        .tint(.accent)
                        .font(.title)
                }
                Button {
                    path.append(.profile)
                } label: {
                    Image(systemName: "person")
                        .tint(.accent)
                        .font(.title)
                }
            }
        }
    }
}

#Preview {
    LandingScreenHeaderView(path: .constant([]))
}
