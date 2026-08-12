//
//  AppointmentCardView.swift
//  Memora
//
//  Created by Apprenant76 on 30/07/2026.
//

import SwiftUI

struct AppointmentCardView: View {

    var medicalAppointment: MedicalAppointmentModel

    var body: some View {
        HStack(spacing: 10) {
            if medicalAppointment.profilePicture.isEmpty {
                Image(systemName: "stethoscope")
                    .font(.largeTitle)
                    .padding(15)
                    .foregroundStyle(.black)
                    .background(.tagOrange)
                    .clipShape(.circle)
                    .frame(width: 70, height: 70)
                    .clipped()
            } else {
                Image(medicalAppointment.profilePicture)
                    .resizable()
                    .clipShape(.circle)
                    .frame(width: 70, height: 70)
                    .clipped()
            }
            VStack(alignment: .leading, spacing: 10) {
                Text(medicalAppointment.name)
                    .foregroundStyle(.black)
                    .font(.custom("Lexend-Regular", size: 20))
                Text(medicalAppointment.specialty.rawValue)
                    .foregroundStyle(Color.secondText)
                    .font(.custom("Lexend-Regular", size: 16))
            }
            .padding(10)
            .frame(maxWidth: .infinity, alignment: .topLeading)
            VStack(alignment: .center, spacing: 10) {
                Text(medicalAppointment.date.formatted(.dateTime.hour().minute()))
                    .font(.custom("Lexend-SemiBold", size: 26))
                HStack(alignment: .center, spacing: 15) {
                    if let phoneNumber = medicalAppointment.phoneNumber {
                        Button {

                        } label: {
                            Image(systemName: "phone.circle.fill")
                                .font(.largeTitle)
                        }
                    }
                    if let emailAdress = medicalAppointment.emailAdress {
                        Button {

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

}
