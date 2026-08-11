//
//  AppointmentCardView.swift
//  Memora
//
//  Created by Apprenant76 on 30/07/2026.
//

import SwiftUI

struct AppointmentCardView: View {

    @Environment(MedicalAppointmentViewModel.self) var appointmentVM
    @Environment(\.openURL) var openUrl
    var medicalAppointment: MedicalAppointmentModel

    var body: some View {
        HStack(spacing: 10) {
            if let profilePicture = medicalAppointment.profilePicture {
                profilePicture
                    .resizable()
                    .clipShape(.circle)
                    .frame(width: 70, height: 70)
                    .clipped()
            } else {
                Image(systemName: "stethoscope")
                    .font(.largeTitle)
                    .padding(15)
                    .foregroundStyle(.black)
                    .background(.tagOrange)
                    .clipShape(.circle)
                    .frame(width: 70, height: 70)
                    .clipped()
            }
            VStack(alignment: .leading, spacing: 10) {
                Text(medicalAppointment.name)
                    .foregroundStyle(.black)
                Text(medicalAppointment.specialty.rawValue)
                    .foregroundStyle(Color.secondText)
                    .font(.subheadline)
            }
            .padding(10)
            .frame(maxWidth: .infinity, alignment: .topLeading)
            VStack(alignment: .center, spacing: 10) {
                Text(medicalAppointment.date.formatted(.dateTime.hour().minute()))
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                HStack(alignment: .center, spacing: 15) {
                    if let phoneNumber = medicalAppointment.phoneNumber {
                        Button {
                            guard let number = URL(string: "tel://" + phoneNumber) else {
                                return
                            }
                            UIApplication.shared.open(number)
                        } label: {
                            Image(systemName: "phone.circle.fill")
                                .font(.largeTitle)
                        }
                    }
                    if let _ = medicalAppointment.emailAdress {
                        Button {
                            appointmentVM
                                .sendEmail(openUrl: openUrl, appointment: medicalAppointment)
                        } label: {
                            Image(systemName: "message.circle.fill")
                                .font(.largeTitle)
                        }
                    }
                }
            }
            .padding(.horizontal, 5)
        }
        .padding(10)
        .background(.whiteBackground)
        .cornerRadius(20)
    }
}

#Preview {
    AppointmentCardView(medicalAppointment: mockAppointments[0])
        .environment(MedicalAppointmentViewModel())
}
