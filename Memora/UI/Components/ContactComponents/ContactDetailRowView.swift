//
//  ContactDetailRowView.swift
//  Memora
//
//  Created by Leskeu  on 13/08/2026.
//

import SwiftUI

struct ContactDetailRowView: View {
    var title: String
    var content: String
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .bold()
                .font(.title)
            Text(content)
                .font(.title)
        } .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .padding(20)
            .background(.white)
            .cornerRadius(20)
    }
}

