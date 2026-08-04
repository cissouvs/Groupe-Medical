//
//  LandingScreenView.swift
//  Memora
//
//  Created by Apprenant76 on 29/07/2026.
//

import SwiftUI
import UIKit

enum Screen: Hashable {
    case appointment
    case medicine
    case calendar
    case quizz
    case profile
    case emergencyContact
}

func addNotification() {
    let center = UNUserNotificationCenter.current()
    
    let addRequest = {
        let content = UNMutableNotificationContent()
        content.title = "Oublies pas d'ajouter les choses effectués la journée"
        content.sound = UNNotificationSound.default
        
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
struct LandingScreenView: View {
    
    @State private var path: [Screen] = []
    @State var events: [Event]
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                Color.background
                VStack(alignment: .leading, spacing: 10) {
                    ScrollView {
                        LandingScreenHeaderView(path: $path)
                        Divider()
                        VStack(alignment: .leading, spacing: 20) {
                            Text("Prochain Rendez-Vous")
                                .foregroundStyle(.secondText)
                            Button {
                                path.append(.appointment)
                            } label: {
                                AppointmentCardView()
                            }
                            Text("Rappel")
                                .foregroundStyle(.secondText)
                            Button {
                                path.append(.medicine)
                            } label: {
                                MedicineCardView()
                            }
                            Text("Vue d'ensemble")
                            HStack {
                                Button {
                                    path.append(.calendar)
                                } label: {
                                    LandingScreenCalendarButtonView(calendarViewType: .medecine)
                                }
                                Spacer()
                                Button {
                                    path.append(.calendar)
                                } label: {
                                    LandingScreenCalendarButtonView(calendarViewType:.appointment)
                                }
                                Spacer()
                                Button {
                                    path.append(.calendar)
                                } label: {
                                    LandingScreenCalendarButtonView(calendarViewType: .event)
                                }
                            }
                            .padding(10)
                            .background(.whiteBackground)
                            .cornerRadius(20)
                            Text("S'exercer")
                                .foregroundStyle(.secondText)
                            Button {
                                path.append(.quizz)
                            } label: {
                                LandingScreenQuizzButtonView()
                            }
                            
                        }
                        Button {
                            addNotification()
                        } label: {
                            Text("Cliquez ici")
                        }
                        Spacer(minLength: 100)
                    }
                }
                .padding(.horizontal, 12)
                .padding(.top, 60)
            }
            .navigationDestination(for: Screen.self) { screen in
                switch screen {
                case .appointment:
                    ContentView()
                case .medicine:
                    ContentView()
                case .calendar:
                    CalendarView(events: events)
                case .quizz:
                    ContentView()
                case .profile:
                    ProfileView(path: $path)
                case .emergencyContact:
                    ContactsListView(contacts: emergencyContacts)
                }
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    LandingScreenView(events: events)
}
