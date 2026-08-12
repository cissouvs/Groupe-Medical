//
//  LandingScreenView.swift
//  Memora
//
//  Created by Apprenant76 on 29/07/2026.
//

import SwiftUI

struct LandingScreenView: View {

    @State var eventVM = EventViewModel()
    @State var medicineVM = MedecineViewModel()
    @State var medicalAppointmentVM = MedicalAppointmentViewModel()
    @State var medicalAppointmentFormVM = MedicalAppointmentFormViewModel()
    @State private var quizzVM = QuizzViewModel()
    @State var dailyQuestionVM = DailyQuestionViewModel()
    @Environment(NotificationViewModel.self) var notificationVM


    var todayMedicines: [any Medicine] {
        medicineVM.getFilteredMedicines(at: Date())
    }

    var todayAppointments: [MedicalAppointmentModel] {
        medicalAppointmentVM.getFilteredAppointments(at: Date())
    }

    var body: some View {
        @Bindable var notificationVM = notificationVM
        
        NavigationStack(path: $notificationVM.mainPageNavigationPath) {
            ZStack {
                Color.background
                VStack(alignment: .leading, spacing: 10) {
                    ScrollView {
                        LandingScreenHeaderView()
                        Divider()
                        VStack(alignment: .leading, spacing: 20) {
                            Text("Prochain Rendez-Vous")
                                .foregroundStyle(.secondText)
                                .font(.custom("Legend-Regular", size: 20))
                            ScrollView(.horizontal) {
                                HStack {
                                    ForEach(todayAppointments) { medicalAppointment in
                                        Button {
                                            notificationVM.mainPageNavigationPath.append(.appointment)
                                        } label: {
                                            AppointmentCardView(medicalAppointment: medicalAppointment)
                                        }
                                    }
                                }
                            }
                            Text("Rappel")
                                .font(.custom("Lexend-Regular", size: 20))
                                .foregroundStyle(.secondText)
                            ScrollView(.horizontal) {
                                HStack {
                                    ForEach(
                                        todayMedicines.enumerated()
                                        , id: \.offset) { _, medicine in
                                            Button {
                                                notificationVM.mainPageNavigationPath.append(.medicine(medicine.id))
                                            } label: {
                                                MedicineCardView(medicine: medicine)
                                            }
                                        }
                                }
                            }
                            Text("Vue d'ensemble")
                                .font(.custom("Lexend-Regular", size: 20))
                                .foregroundStyle(.secondText)
                            HStack {
                                Button {
                                    notificationVM.mainPageNavigationPath.append(.calendar(.medications))
                                } label: {
                                    LandingScreenCalendarButtonView(calendarViewType: .medications)
                                }
                                Spacer()
                                Button {
                                    notificationVM.mainPageNavigationPath.append(.calendar(.appointment))
                                } label: {
                                    LandingScreenCalendarButtonView(calendarViewType:.appointment)
                                }
                                Spacer()
                                Button {
                                    notificationVM.mainPageNavigationPath.append(.calendar(.events))
                                } label: {
                                    LandingScreenCalendarButtonView(calendarViewType: .events)
                                }
                            }
                            .padding(10)
                            .background(.whiteBackground)
                            .cornerRadius(20)
                            Text("S'exercer")
                                .font(.custom("Lexend-Regular", size: 20))
                                .foregroundStyle(.secondText)
                            Button {
                                notificationVM.mainPageNavigationPath.append(.quizz)
                            } label: {
                                LandingScreenQuizzButtonView()
                            }

                        }
                        Spacer(minLength: 100)
                    }
                }
                .padding(.horizontal, 12)
                .padding(.top, 60)
            }
            .navigationDestination(for: Screen.self) { screen in
                switch screen {
                case .appointment(let appointmentID):
                    MedicalAppointmentDetailView(appointmentID: appointmentID, path: $path)
                case .medicine(let medicineId):
                    MedicineDetailView(medicineId: medicineId)
                case .calendar(let selectedCalendarType):
                    CalendarView(selectedCalendarType: selectedCalendarType)
                case .quizz:
                    QuizzView()
                case .detailQuizz(let index):
                    DetailQuizzView(quizzIndex: index)
                case .quizzFinished(let index):
                    CardFinishTaskView(quizzIndex: index)
                case .profile:
                    ProfileView()
                case .emergencyContact:
                    ContactsListView()
                }
            }
            .ignoresSafeArea()
        }
        .environment(eventVM)
        .environment(medicineVM)
        .environment(medicalAppointmentVM)
        .environment(medicalAppointmentFormVM)
        .environment(quizzVM)
        .environment(dailyQuestionVM)
    }
}

#Preview {
    LandingScreenView()
}
