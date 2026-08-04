//
//  FinishCardView.swift
//  UrbanCanvas
//
//  Created by apprenant92 on 06/07/2026.
//

import SwiftUI

struct CardFinishTaskView: View {
    
    @State var isTouch = false
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                
                Image(systemName: "checkmark.seal")
                    .foregroundStyle(.white)
                    .font(.system(size: 80))
                    .padding(10)
                    .background(.green)
                    .cornerRadius(100)
                    .padding()
                
                Text("Félicitation !")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.mainText)
                    .bold()
                    .padding(8)
                
                Text("Vous avez réussi")
                    .font(.callout)
                    .multilineTextAlignment(.leading)
                    
                Spacer()
            }
            .padding(.horizontal, 12)
            .padding(.bottom, 10)
            .frame(maxWidth: .infinity, maxHeight: 250)
            .background(.whiteBackground)
            .cornerRadius(20)
            
            
        }
    }
}


#Preview {
    CardFinishTaskView()
}
