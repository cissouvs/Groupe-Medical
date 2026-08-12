//
//  MedicamentationFormView.swift
//  Memora
//
//  Created by Apprenant76 on 08/08/2026.
//

import SwiftUI

enum MedicineType {
    case capsule
    case drinkable
    case patch
}

struct MedicineSheetFormView: View {
    @State private var currentTiming: MedicineTakeTiming?
    @Binding var medicineForm: MedicineFormModel


    var body: some View {
        Form {
            Section {
                Picker(selection: $medicineForm.medicineName) {
                    ForEach(MedicineName.allCases) { medicineName in
                        Text(medicineName.rawValue)
                            .font(.custom("Lexend-Regular", size: 16))
                            .tag(medicineName)
                    }
                } label: {
                    Text("Médicament")
                    .font(.custom("Lexend-Regular", size: 16))
                }
                .tint(.accent)
            }
            Section("Dates") {
                DatePicker(
                    selection: $medicineForm.startDate,
                    displayedComponents: [.date]
                ) {
                    Text("Début du traitement")
                        .font(.custom("Lexend-Regular", size: 16))
                }
                DatePicker(selection: $medicineForm.endDate, displayedComponents: [.date]) {
                    Text("Début du traitement")
                        .font(.custom("Lexend-Regular", size: 16))
                }
            }
            Section("Posologie") {
                switch medicineForm.medicineType {
                case .capsule:
                    HStack {
                        TextField("Nombre de comprimé", value: $medicineForm.capsuleNumber, format: .number)
                            .font(.custom("Lexend-Regular", size: 16))
                        Text("comprimé(s)")
                            .font(.custom("Lexend-Regular", size: 16))
                    }
                    HStack {
                        TextField("Grammage", value: $medicineForm.weight, format: .number)
                            .font(.custom("Lexend-Regular", size: 16))
                        Text("mg")
                            .font(.custom("Lexend-Regular", size: 16))
                    }
                case .drinkable:
                    HStack {
                        TextField("Volume", value: $medicineForm.volume, format: .number)
                        Text("ml")
                    }
                case .patch:
                    HStack {
                        TextField("Nombre de patch", value: $medicineForm.patchNumber, format: .number)
                        Text("patch(s)")
                    }
                    HStack {
                        TextField("Durée", value: $medicineForm.duration, format: .number)
                        Text("h")
                    }
                }
            }
            if medicineForm.medicineType != .patch {
                Section("Timing de prise"){
                    HStack {
                        Button("+") {
                            guard let currentTiming else {
                                return
                            }
                            if !medicineForm.takingMoments.contains(where: {$0 == currentTiming}) {
                                medicineForm.takingMoments.append(currentTiming)
                            }
                        }
                        .buttonStyle(.glass)
                        .tint(.accentColor)
                        Button("-") {
                            guard let currentTiming else {
                                return
                            }
                            if let index = medicineForm.takingMoments.firstIndex(
                                where: {$0 == currentTiming
                                }) {
                                medicineForm.takingMoments.remove(at: index)
                            }
                        }
                        .buttonStyle(.glass)
                        .tint(.supportRed)
                        Picker("Moment de la journée", selection: $currentTiming) {
                            ForEach(MedicineTakeTiming.allCases) {
                                takingTime in
                                Text(
                                    takingTime.rawValue,
                                )
                                .tag(takingTime)
                            }
                        }
                        .labelsHidden()
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .frame(alignment: .trailing)
                    TakingTimingScrollView(takingMoments: medicineForm.takingMoments)
                }
            }
        }
    }
}

#Preview {
    MedicineSheetFormView(medicineForm: .constant(MedicineFormModel()))
}
