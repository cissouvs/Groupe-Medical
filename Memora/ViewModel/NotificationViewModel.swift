//
//  LandingScreenViewModel.swift
//  Memora
//
//  Created by Leskeu  on 05/08/2026.
//

import Foundation
import UIKit

enum Screen: Hashable {
    case appointment(UUID)
    case medicine(UUID)
    case calendar(CalendarType)
    case quizz
    case detailQuizz(Int)
    case quizzFinished(Int)
    case profile
    case emergencyContact
}

@Observable
final class NotificationViewModel: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    var mainPageNavigationPath: [Screen] = []
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        UNUserNotificationCenter.current().delegate = self
        return true
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent response: UNNotification) async -> UNNotificationPresentationOptions {
        return[.sound, .banner]
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse) async {
        
        if let pageLink = response.notification.request.content.userInfo["pageLink"] as? String? {
            if let screen = pageLink?.toScreen() {
                if mainPageNavigationPath.last != screen {
                    mainPageNavigationPath = []
                    mainPageNavigationPath.append(screen)
                }
            }
        }
    }
    
    func addNotification() {
        let center = UNUserNotificationCenter.current()
        
        let addRequest = {
            let content = UNMutableNotificationContent()
            content.title = "C'est l'heure!"
            content.subtitle = "Les évènements t'attendent!"
            content.sound = UNNotificationSound.default
            content.userInfo = ["pageLink": "calendar.events"]
 
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            
            let request = UNNotificationRequest(
                identifier: UUID().uuidString, content: content, trigger: trigger)
            center.add(request)
        }
        center.getNotificationSettings { settings in
            if settings.authorizationStatus == .authorized {
                addRequest()
            } else {
                center.requestAuthorization(options: [.alert, .badge, .sound]) { succes, error in
                    if succes {
                        addRequest()
                    } else if let error {
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }
    
}

extension String {
    func toScreen() -> Screen? {
        if self == "calendar.events" {
            return .calendar(.events)
        }
        return nil
    }
}
