//
//  MedicalAppointmentSheetFormView.swift
//  Memora
//
//  Created by Apprenant76 on 09/08/2026.
//

import SwiftUI
import PhotosUI

struct MedicalAppointmentSheetFormView: View {


    @Binding var appointmentForm: MedicalAppointmentModel
    @State private var pickerItem: PhotosPickerItem?
    @State private var pickerImage: Image?
    @FocusState private var focusedField: AppointmentField?

    var body: some View {
        ZStack {
            Color.background
            VStack {
                PhotosPicker(selection: $pickerItem) {
                    if let pickerImage {
                        pickerImage
                            .resizable()
                            .clipShape(.circle)
                            .scaledToFit()
                            .clipped()
                    } else {
                        Image(systemName: "photo.badge.plus")
                            .padding(35)
                            .font(.system(size: 70))
                            .foregroundStyle(.secondText)
                            .background(Color.whiteBackground)
                            .clipShape(.circle)
                            .clipped()
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                }
                .frame(height: 200)
                .onChange(of: pickerItem) {
                    Task {
                        if let loadedImage = try? await pickerItem?.loadTransferable(type: Image.self) {
                            pickerImage = loadedImage
                        }
                    }
                }
                Form {
                    Section {
                        TextField(text: $appointmentForm.name){
                            Text("Nom")
                                .font(.custom("Lexend-Regular", size: 16))
                                .focused($focusedField, equals: .name)
                        }

                        Picker(selection: $appointmentForm.specialty) {
                            ForEach(MedicalSpeciality.allCases) { specialty in
                                Text(specialty.rawValue)
                            }
                        } label: {
                            Text("Spécialités")
                                .font(.custom("Lexend-Regular", size: 16))

                        }
                        .tint(.accentColor)
                    }
                    Section {
                        DatePicker(
                            selection: $appointmentForm.date,
                            displayedComponents: [.date, .hourAndMinute]
                        ) {
                            Text("Date")
                                .font(.custom("Lexend-Regular", size: 16))
                        }
                        TextField(text: $appointmentForm.adress){
                            Text("Adresse")
                                .font(.custom("Lexend-Regular", size: 16))
                        }
                        .focused($focusedField, equals: .adress)
                        TextField(text: $appointmentForm.phoneNumber){
                            Text("N° de téléphone")
                                .font(.custom("Lexend-Regular", size: 16))
                        }
                        .focused($focusedField, equals: .phoneNumber)
                        .keyboardType(.phonePad)
                        TextField(text: $appointmentForm.emailAdress){
                            Text("Email")
                                .font(.custom("Lexend-Regular", size: 16))
                        }
                        .focused($focusedField, equals: .email)
                        .keyboardType(.emailAddress)
                    }
                }
                .onTapGesture {
                    focusedField = nil
                }
                .onAppear {
                    pickerImage = appointmentForm.profilePicture
                }
            }
            .padding(.top, 100)
        }
        .ignoresSafeArea()
    }

    enum AppointmentField: Hashable {
        case name
        case adress
        case phoneNumber
        case email
    }

}

#Preview {
    MedicalAppointmentSheetFormView(appointmentForm:
            .constant(
                mockAppointments[0]
            )
    )
}
