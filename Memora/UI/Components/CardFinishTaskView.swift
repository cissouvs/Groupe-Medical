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
                    .font(.system(size: 140))
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
                    
                    NavigationLink {
                        
                        MissionsView(currentTabIndex: 0)
                        
                    } label: {
                        
                        Text("Nouvelle mission")
                            .foregroundStyle(isTouch ? .white : .mainOrange)
                            .font(.title2)
                            .padding(10)
                            .background(isTouch ? .green : .white)
                            .cornerRadius(100)
                            .padding()
                    
                }
                
                Spacer()
            }
            .foregroundStyle(.mainText)
            .frame(width: 320, height: 480)
            .background(.backgroundGray)
            .cornerRadius(20)
            
            
        }
    }
}


#Preview {
    CardFinishTaskView()
}
