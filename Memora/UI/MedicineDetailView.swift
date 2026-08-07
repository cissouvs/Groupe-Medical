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
    formatter.setLocalizedDateFormatFromTemplate("d MMMM")
    return formatter
}

struct MedicineDetailView: View {

    @State private var vm = MedicineDetailViewModel()
    @Environment(MedecineViewModel.self) var medicineVM

    let medicineId: UUID

    var medicine: any Medicine {
        medicineVM.getMedicine(medicineID: medicineId)
    }

    var body: some View {
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
            VStack(alignment: .leading) {
                Text(medicine.medicineType.rawValue)
                    .font(.title)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(medicine.details)
                    .frame(maxWidth: .infinity, alignment: .leading)
                InfoCardSectionView(medicine: medicine)
                Spacer()
            }
            .padding(12)
            .frame(maxHeight: .infinity)
            .background(Color.secondText)
            .foregroundStyle(.white)
            .cornerRadius(30)
        }
        .ignoresSafeArea()
        .navigationTitle("Infos Médicament")
    }
}

struct InfoCardSectionView: View {

    let medicine: any Medicine

    var body: some View {
        HStack {
            InfoCardView(medicine: medicine, cardType: .date)
        }
    }
}

enum InfoCardType {
    case date
    case amount
    case capsuleWeight
    case volume
    case patchDuration
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

    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Image(systemName: "calendar")
                    .font(.title)
                Text("Date de prise")
                    .bold()
            }
            Text(
                "Du \(dateFormatter.string(from: medicine.startDate).capitalized) au \(dateFormatter.string(from: medicine.endDate).capitalized)"
            )
            .font(.title3)
        }
        .padding(10)
        .background(Color.background)
        .foregroundStyle(.accent)
        .cornerRadius(12)
    }
}

#Preview {
    let vm = MedecineViewModel()
    MedicineDetailView(medicineId: vm.medicines[1].id)
        .environment(vm)
}
