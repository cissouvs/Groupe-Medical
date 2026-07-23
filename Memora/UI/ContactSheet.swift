//
//  ContactSheet.swift
//  Memora
//
//  Created by Leskeu  on 23/07/2026.
//

import SwiftUI

struct ContactSheet: View {
    @State var contactName : String = ""
    @State var contactPrenom : String = ""
    var body: some View {
        VStack {
            HStack(spacing: 30){
                Button {
                    
                } label: {
                    Image(systemName: "xmark")
                        .foregroundStyle(.mainText)
                        .padding()
                        .background(.ultraThinMaterial)
                        .clipShape(.circle)
                        
                }
                Text("Ajoutez un contact")
                    .font(.title)
                Button {
                    
                } label: {
                    Image(systemName: "checkmark")
                        .foregroundStyle(.white)
                        .padding()
                        .background(.accent)
                        .clipShape(.circle)
                }
            }
            Form {
                TextField("Nom", text: $contactName)
                TextField("Prenom")
            }
        }
    }
}
#Preview {
    ContactSheet()
}
