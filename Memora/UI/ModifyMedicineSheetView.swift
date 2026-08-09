//
//  ModifyMedicineSheeView.swift
//  Memora
//
//  Created by Apprenant76 on 09/08/2026.
//

import SwiftUI

struct ModifyMedicineSheeView: View {
    @Binding var isModifySheetPresented: Bool
    var medicine: any Medicine
    @State private var vm = ModifyMedicineSheetViewModel()
    @Environment(MedecineViewModel.self) var medicineVM
    @State var medicineForm: MedicineFormModel = MedicineFormModel()

    var isConfirmationButtonDisabled: Bool {
        switch medicineForm.medicineType {
        case .capsule:
            if  medicineForm.capsuleNumber == nil ||
                    medicineForm.weight == nil {
                return true
            }
        case .drinkable:
            if medicineForm.volume == nil {
                return true
            }
        case .patch:
            if medicineForm.patchNumber == nil ||
                medicineForm.duration == nil {
                return true
            }
        }
        return false
    }

    var body: some View {
        MedicineSheetFormView(medicineForm: $medicineForm)
            .environment(vm)
            .onAppear {
                setMedicineForm()
            }
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        isModifySheetPresented = false
                    } label: {
                        Image(systemName: "xmark")
                    }
                }
                ToolbarItem(placement: .principal) {
                    Text("Modifier")
                        .font(.title2)
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        medicineVM.updateEvent(from: medicine, to: medicineForm)
                        isModifySheetPresented = false
                    } label: {
                        Image(systemName: "checkmark")
                    }
                    .tint(.accent)
                    .buttonStyle(.glassProminent)
                    .disabled(isConfirmationButtonDisabled)
                }
            }
    }


    func setMedicineForm() {
        switch medicine {
        case is CapsuleMedicineModel:
            let medicine = medicine as! CapsuleMedicineModel
            medicineForm = MedicineFormModel(
                medicineName: medicine.medicineName,
                takingMoments: medicine.takingMoments,
                startDate: medicine.startDate,
                endDate: medicine.endDate,
                weight: medicine.weight,
                capsuleNumber: medicine.capsuleNumber
            )
        case is DrinkableMedicineModel:
            let medicine = medicine as! DrinkableMedicineModel
            medicineForm =  MedicineFormModel(
                medicineName: medicine.medicineName,
                takingMoments: medicine.takingMoments,
                startDate: medicine.startDate,
                endDate: medicine.endDate,
                volume: medicine.volume
            )
        case is PatchMedicineModel:
            let medicine = medicine as! PatchMedicineModel
            medicineForm = MedicineFormModel(
                medicineName: medicine.medicineName,
                takingMoments: medicine.takingMoments,
                startDate: medicine.startDate,
                endDate: medicine.endDate,
                patchNumber: medicine.patchNumber,
                duration: medicine.duration
            )
        default:
            break
        }
    }
}

#Preview {
    ModifyMedicineSheeView(isModifySheetPresented: .constant(true), medicine: mockMedicines[0])
        .environment(MedecineViewModel())
}
