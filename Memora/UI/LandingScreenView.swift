//
//  LandingScreenView.swift
//  Memora
//
//  Created by Apprenant76 on 29/07/2026.
//

import SwiftUI

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

struct LandingScreenView: View {

    @State private var vm = LandingScreenViewModel()
    @State private var path: [Screen] = []
    @State var eventVM = EventViewModel()
    @State var medicineVM = MedecineViewModel()
    @State var medicalAppointmentVM = MedicalAppointmentViewModel()
    @State private var quizzVM = QuizzViewModel()
    @State var dailyQuestionVM = DailyQuestionViewModel()


    var todayMedicines: [any Medicine] {
        medicineVM.getFilteredMedicines(at: Date())
    }

    var todayAppointments: [MedicalAppointmentModel] {
        medicalAppointmentVM.getFilteredAppointments(at: Date())
    }

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
                            ScrollView(.horizontal) {
                                HStack {
                                    ForEach(todayAppointments) { medicalAppointment in
                                        Button {
                                            path.append(.appointment(medicalAppointment.id))
                                        } label: {
                                            AppointmentCardView(medicalAppointment: medicalAppointment)
                                        }
                                    }
                                }
                            }
                            Text("Rappel")
                                .foregroundStyle(.secondText)
                            ScrollView(.horizontal) {
                                HStack {
                                    ForEach(
                                        todayMedicines.enumerated()
                                        , id: \.offset) { _, medicine in
                                            Button {
                                                path.append(.medicine(medicine.id))
                                            } label: {
                                                MedicineCardView(medicine: medicine)
                                            }
                                        }
                                }
                            }
                            Text("Vue d'ensemble")
                            HStack {
                                Button {
                                    path.append(.calendar(.medications))
                                } label: {
                                    LandingScreenCalendarButtonView(calendarViewType: .medications)
                                }
                                Spacer()
                                Button {
                                    path.append(.calendar(.appointment))
                                } label: {
                                    LandingScreenCalendarButtonView(calendarViewType:.appointment)
                                }
                                Spacer()
                                Button {
                                    path.append(.calendar(.events))
                                } label: {
                                    LandingScreenCalendarButtonView(calendarViewType: .events)
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
                case .appointment(let appointmentID):
                    MedicalAppointmentDetailView(appointmentID: appointmentID)
                case .medicine(let medicineId):
                    MedicineDetailView(path: $path, medicineId: medicineId)
                case .calendar(let selectedCalendarType):
                    CalendarView(selectedCalendarType: selectedCalendarType ,path: $path)
                case .quizz:
                    QuizzView(path: $path)
                case .detailQuizz(let index):
                    DetailQuizzView(quizzIndex: index)
                case .quizzFinished(let index):
                    CardFinishTaskView(quizzIndex: index)
                case .profile:
                    ProfileView(path: $path)
                case .emergencyContact:
                    ContactsListView()
                }
            }
            .ignoresSafeArea()
        }
        .environment(eventVM)
        .environment(medicineVM)
        .environment(medicalAppointmentVM)
        .environment(quizzVM)
        .environment(dailyQuestionVM)
    }
}

#Preview {
    LandingScreenView()
}
