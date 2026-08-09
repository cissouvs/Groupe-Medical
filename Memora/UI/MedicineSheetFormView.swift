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

    @State var takingTimings: [MedicineTakeTiming] = []

    var body: some View {
        Form {
            Section {
                Picker("Médicament", selection: $medicineForm.medicineName) {
                    ForEach(MedicineName.allCases) { medicineName in
                        Text(medicineName.rawValue).tag(medicineName)
                    }
                }
                .tint(.accent)
            }
            Section("Dates") {
                DatePicker(
                    "Début du traitement",
                    selection: $medicineForm.startDate,
                    displayedComponents: [.date]
                )
                DatePicker("Fin du traitement", selection: $medicineForm.endDate, displayedComponents: [.date])
            }
            Section("Posologie") {
                switch medicineForm.medicineType {
                case .capsule:
                    HStack {
                        TextField("Nombre de comprimé", value: $medicineForm.capsuleNumber, format: .number)
                        Text("comprimé(s)")
                    }
                    HStack {
                        TextField("Grammage", value: $medicineForm.weight, format: .number)
                        Text("mg")
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
                            if !takingTimings.contains(where: {$0 == currentTiming}) {
                                takingTimings.append(currentTiming)
                            }
//                            if !medicineForm.takingMoments.contains(where: {$0 == currentTiming}) {
//                                medicineForm.takingMoments.append(currentTiming)
//                            }
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
                    Text(currentTiming?.rawValue ?? "")
                    Text("\(medicineForm.takingMoments)")
                    TakingTimingScrollView(takingMoments: takingTimings)
//                    TakingTimingScrollView(takingMoments: medicineForm.takingMoments)
                }
            }
        }
    }
}

#Preview {
    MedicineSheetFormView(medicineForm: .constant(MedicineFormModel()))
}
