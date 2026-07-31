//
//  LandingScreenHeaderView.swift
//  Memora
//
//  Created by Apprenant76 on 31/07/2026.
//

import SwiftUI

struct LandingScreenHeaderView: View {


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

                } label: {
                    Image(systemName: "gearshape")
                        .tint(.secondText)
                        .font(.title)
                }
            }
        }
    }
}

#Preview {
    LandingScreenHeaderView()
}
