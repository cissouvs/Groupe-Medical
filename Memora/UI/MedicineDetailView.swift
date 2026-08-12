//
//  MedicineDetailView.swift
//  Memora
//
//  Created by Apprenant76 on 06/08/2026.
//

import SwiftUI

var dateFormatter: DateFormatter {
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "fr_FR")
    formatter.setLocalizedDateFormatFromTemplate("dd/MM")
    return formatter
}

struct MedicineDetailView: View {

    @State private var isDeleteConfirmationPresented = false
    @State private var isModifySheetPresented = false
    @Environment(NotificationViewModel.self) var notificationVM
    @Environment(MedecineViewModel.self) var medicineVM
    @Environment(\.dismiss) private var dismiss

    let medicineId: UUID

    var medicine: (any Medicine)? {
        medicineVM.getMedicine(medicineID: medicineId)
    }

    var body: some View {
        VStack {
            if let medicine {
                VStack(spacing: 50) {
                    AsyncImage(url: URL(string: medicine.imageUrl)) { image in
                        image
                            .resizable()
                    } placeholder: {
                        Image(systemName: "pills.fill")
                            .resizable()
                            .foregroundStyle(.accent)
                    }
                    .shadow(radius: 5)
                    .frame(width: 250, height: 250)
                    .clipped()
                    .padding(.top, 100)
                    MedicineDetailContenView(medicine: medicine)
                }
                .alert("Voulez-vous vraiment supprimer ce médicament?", isPresented: $isDeleteConfirmationPresented) {
                    Button("Annuler", role: .cancel) {}
                    Button("Supprimer", role: .destructive) {
                        medicineVM.deleteMedicine(medicineID: medicine.id)
                        notificationVM.mainPageNavigationPath.removeLast()
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
                            isDeleteConfirmationPresented = true
                        }
                        .buttonStyle(.glass)
                    }

                }
                .sheet(isPresented: $isModifySheetPresented) {
                    ModifyMedicineSheetView(
                        isModifySheetPresented: $isModifySheetPresented,
                        medicine: medicine,
                    )
                    .environment(medicineVM)
                }
            }
            else {
                ContentUnavailableView {
                    Label("Ce médicament est introuvable", systemImage: "pills")
                }
            }
        }
        .navigationTitle("Infos Médicament")
        .ignoresSafeArea()
    }
}

struct MedicineDetailContenView: View {
    var medicine: any Medicine

    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            VStack(alignment: .leading, spacing: 20) {
                Text(medicine.medicineName.rawValue)
                    .font(.custom("Lexend-Regular", size: 26))
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                ScrollView {
                    Text(medicine.details)
                        .font(.custom("Lexend-Light", size: 16))
                }
                .frame(height: 100)
                TakingTimingScrollView(takingMoments: medicine.takingMoments)
                InfoCardSectionView(medicine: medicine)
            }
            Spacer()
        }
        .padding(12)
        .background(Color.background)
        .cornerRadius(30)
        .shadow(radius: 3)
    }
}

struct InfoCardSectionView: View {

    let medicine: any Medicine

    var body: some View {
        VStack(alignment: .center) {
            Grid {
                switch medicine {
                case is DrinkableMedicineModel:
                    GridRow {
                        InfoCardView(medicine: medicine, cardType: .date)
                        InfoCardView(medicine: medicine, cardType: .volume)
                    }
                case is CapsuleMedicineModel:
                    GridRow {
                        InfoCardView(medicine: medicine, cardType: .date)
                        InfoCardView(medicine: medicine, cardType: .amount)
                    }
                    GridRow {
                        InfoCardView(medicine: medicine, cardType: .capsuleWeight)
                    }
                case is PatchMedicineModel:
                    GridRow {
                        InfoCardView(medicine: medicine, cardType: .date)
                        InfoCardView(medicine: medicine, cardType: .patchDuration)
                    }
                default: VStack{}
                }
            }
        }
    }
}

enum InfoCardType: String {
    case date = "Date de prise"
    case amount = "Quantité"
    case capsuleWeight = "Grammage"
    case volume = "Volume"
    case patchDuration = "Durée du patch"
}

struct InfoCardView: View {

    let medicine: any Medicine
    let cardType: InfoCardType

    var logoName: String {
        switch cardType {
        case .date:
            return "calendar"
        case .amount:
            return "clipboard"
        case .capsuleWeight:
            return "pill"
        case .volume:
            return "waterbottle"
        case .patchDuration:
            return "clock"
        }
    }

    var color: Color {
        switch cardType {
        case .date:
                .accent
        case .amount, .volume, .patchDuration:
                .supportGreen
        case .capsuleWeight:
                .supportOrange
        }
    }

    var text: String {
        switch cardType {
        case .date:
            return "\(dateFormatter.string(from: medicine.startDate).capitalized) au \(dateFormatter.string(from: medicine.endDate).capitalized)"
        case .amount:
            let capsuleMedicine = medicine as! CapsuleMedicineModel
            return "\(capsuleMedicine.capsuleNumber) pillule(s)/jours"
        case .capsuleWeight:
            let capsuleMedicine = medicine as! CapsuleMedicineModel
            return "\(capsuleMedicine.weight) mg"
        case .volume:
            return medicine.posologyString
        case .patchDuration:
            let patchMedicine = medicine as! PatchMedicineModel
            return "\(patchMedicine.duration) h"
        }
    }

    var body: some View {
        HStack {
            Image(systemName: logoName)
                .font(.largeTitle)
            VStack {
                Text(cardType.rawValue)
                    .font(.custom("Lexend-Regular", size: 16))
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(text)
                    .font(.custom("Lexend-Regular", size: 16))
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(height: 80)
        }
        .padding(5)
        .background(Color.white)
        .foregroundStyle(color)
        .cornerRadius(12)
    }
}

#Preview {
    let vm = MedecineViewModel()
    MedicineDetailView(medicineId: vm.medicines[0].id)
        .environment(vm)
        .environment(NotificationViewModel())
}
