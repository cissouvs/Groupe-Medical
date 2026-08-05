//
//  LandingScreenView.swift
//  Memora
//
//  Created by Apprenant76 on 29/07/2026.
//

import SwiftUI

enum Screen: Hashable {
    case appointment
    case medicine
    case calendar
    case quizz
    case profile
    case emergencyContact
}

struct LandingScreenView: View {
    
    @State private var vm = LandingScreenViewModel()
    @State private var path: [Screen] = []
    @State var eventVM = EventViewModel()
    @State var medicineVM = MedecineViewModel()
    
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
                                MedicineCardView(medicine: mockMedicines[0])
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
                            vm.addNotification()
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
                    CalendarView()
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
        .environment(eventVM)
        .environment(medicineVM)
    }
}

#Preview {
    LandingScreenView()
}
