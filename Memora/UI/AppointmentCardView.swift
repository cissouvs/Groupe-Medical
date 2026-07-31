//
//  AppointmentCardView.swift
//  Memora
//
//  Created by Apprenant76 on 30/07/2026.
//

import SwiftUI

struct AppointmentCardView: View {

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: "person.fill")
                .resizable()
                .padding(15)
                .background(Color.gray)
                .foregroundStyle(.black)
                .clipShape(.circle)
                .frame(width: 70, height: 70)
                .clipped()
            VStack(alignment: .leading, spacing: 10) {
                Text("Dr Martin")
                    .foregroundStyle(.black)
                Text("Médecin Généraliste")
                    .foregroundStyle(Color.secondText)
                    .font(.subheadline)
            }
            .padding(10)
            .frame(maxWidth: .infinity, alignment: .topLeading)
            VStack(alignment: .center, spacing: 10) {
                Text("11:00")
                    .font(.title)
                    .fontWeight(.semibold)
                HStack(alignment: .center, spacing: 15) {
                    Button {

                    } label: {
                        Image(systemName: "phone.circle.fill")
                            .font(.largeTitle)
                    }
                    Button {

                    } label: {
                        Image(systemName: "message.circle.fill")
                            .font(.largeTitle)
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
    AppointmentCardView()
}
