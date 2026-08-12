//
//  LandingScreenHeaderView.swift
//  Memora
//
//  Created by Apprenant76 on 31/07/2026.
//

import SwiftUI

struct LandingScreenHeaderView: View {


    @Environment(NotificationViewModel.self) var notificationVM
    @State var vm = NotificationViewModel()

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("Bonjour,")
                    .font(.custom("Lexend-Regular", size: 20))
                Text("Yann")
                    .fontWeight(.semibold)
                    .font(.custom("Lexend-Regular", size: 26))
            }
            Spacer()
            HStack(spacing: 20) {
                Button {
                    vm.addNotification()
                } label: {
                    Image(systemName: "bell")
                        .tint(.accent)
                        .font(.title)
                }
//                Button {
//                    notificationVM.mainPageNavigationPath.append(.profile)
//                } label: {
//                    Image(systemName: "person")
//                        .tint(.accent)
//                        .font(.title)
//                }
            }
        }
    }
}

#Preview {
    LandingScreenHeaderView()
        .environment(NotificationViewModel())
}
