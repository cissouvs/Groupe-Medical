//
//  MemoraApp.swift
//  Memora
//
//  Created by Leskeu  on 21/07/2026.
//

import SwiftUI

@main
struct MemoraApp: App {
    @UIApplicationDelegateAdaptor(NotificationViewModel.self) var notificationVM
    var body: some Scene {
        WindowGroup {
            TabBarView()
                .environment(notificationVM)
        }
    }
}
