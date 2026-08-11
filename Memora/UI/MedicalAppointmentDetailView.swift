//
//  MedicalAppointmentDetailView.swift
//  Memora
//
//  Created by Apprenant76 on 11/08/2026.
//

import SwiftUI
import MapKit

struct MedicalAppointmentDetailView: View {
    var appointmentID: UUID
    @Environment(MedicalAppointmentViewModel.self) var appointmentVM
    @Environment(\.openURL) private var openUrl
    @Binding var path: [Screen]
    @State private var isModifySheetPresented: Bool = false
    @State private var isDeletionConfirmationPresented: Bool = false

    var appointment: MedicalAppointmentModel? {
        appointmentVM.getAppointment(appointmentID: appointmentID)
    }

    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "fr_FR")
        formatter.setLocalizedDateFormatFromTemplate("EEEE d MMMM à HH:mm")
        return formatter
    }

    @State var adress: CLLocationCoordinate2D?
    @State var position: MapCameraPosition?

    var body: some View {
        if let appointment {
            VStack(spacing: 50) {
                VStack {
                    if let profilePicture = appointment.profilePicture {
                        profilePicture
                            .resizable()
                            .shadow(radius: 5)
                            .clipped()
                    } else {
                        Image(systemName: "stethoscope")
                            .resizable()
                            .foregroundStyle(.accent)
                            .clipped()
                    }
                }
                .frame(width: 150, height: 150)
                .padding(.top, 100)
                VStack(alignment: .leading, spacing: 25) {
                    VStack(alignment: .leading) {
                        Text("Rendez-vous le")
                        Text("\(dateFormatter.string(from: appointment.date))".capitalized)
                    }
                    .font(.largeTitle)
                    .bold()
                    HStack {
                        VStack(alignment: .leading, spacing:10) {
                            Text(appointment.name)
                                .font(.title)
                                .bold()
                            Text(appointment.specialty.rawValue)
                                .foregroundStyle(.secondText)
                                .font(.title3)
                        }
                        Spacer()
                        HStack(spacing: 20) {
                            Button {
                                guard let number = URL(string: "tel://" + appointment.phoneNumber) else {
                                    return
                                }
                                UIApplication.shared.open(number)
                            } label: {
                                Image(systemName: "phone.circle.fill")
                                    .font(.system(size: 50))
                            }
                            .disabled(appointment.phoneNumber.isEmpty)
                            Button {
                                appointmentVM.sendEmail(openUrl: openUrl, appointment: appointment)
                            } label: {
                                Image(systemName: "message.circle.fill")
                                    .font(.system(size: 50))
                            }
                            .disabled(appointment.emailAdress.isEmpty)
                        }
                    }
                    if let mapPosition = position,
                       let mapAdress = adress {
                        VStack(alignment: .leading) {
                            Text("Adresse")
                            Map(initialPosition: mapPosition) {
                                Marker("Adresse rendez-vous", coordinate: mapAdress)
                                    .annotationTitles(.hidden)
                            }
                            .mapStyle(.standard(pointsOfInterest: .excludingAll))
                            .colorScheme(.dark)
                            .cornerRadius(20)
                            .padding(10)
                            .frame(height: 200)
                        }
                    }
                    Spacer()
                }
                .padding(12)
                .background(Color.background)
                .cornerRadius(30)
                .shadow(radius: 3)

            }
            .onAppear {
                Task {
                    if let request = MKGeocodingRequest(addressString: appointment.adress) {
                        let mapItems = try await request.mapItems
                        if let mapItem = mapItems.first {
                            adress = mapItem.location.coordinate
                            position = MapCameraPosition.region(
                                MKCoordinateRegion(
                                    center: mapItem.location.coordinate,
                                    span: MKCoordinateSpan(
                                        latitudeDelta: 0.005,
                                        longitudeDelta: 0.005
                                    )
                                )
                            )

                        }
                    }

                }
            }
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Modifier", systemImage: "pencil.line") {
                        isModifySheetPresented = true
                    }
                    .buttonStyle(.glass)
                }
                ToolbarItem(placement: .destructiveAction) {
                    Button("Supprimer", systemImage: "trash") {
                        isDeletionConfirmationPresented = true
                    }
                    .buttonStyle(.glass)
                }
            }
            .alert("Voulez-vous vraiment supprimer ce médicament?", isPresented: $isDeletionConfirmationPresented) {
                Button("Annuler", role: .cancel) {}
                Button("Supprimer", role: .destructive) {
                    appointmentVM.deleteAppointment(appointmentID: appointment.id)
                    path.removeLast()
                }
            }
            .sheet(isPresented: $isModifySheetPresented) {
                ModifyAppointmentSheetView(
                    appointmentID: appointment.id,
                    isModifySheetPresented: $isModifySheetPresented,
                )
            }
            .ignoresSafeArea()
        } else {
            ContentUnavailableView {
                Label("Ce rendez-vous est introuvable", systemImage: "stethoscope")
            }
        }
    }
}

#Preview {
    MedicalAppointmentDetailView(appointmentID: mockAppointments[0].id, path: .constant([]))
        .environment(MedicalAppointmentViewModel())
}
