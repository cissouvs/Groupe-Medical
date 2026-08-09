//
//  ModifyMedicineSheetViemModel.swift
//  Memora
//
//  Created by Apprenant76 on 09/08/2026.
//

import Foundation

@Observable
final class ModifyMedicineSheetViewModel {

    func getFormFromMedicine(from medicine: any Medicine) -> MedicineFormModel {
        switch medicine {
        case is CapsuleMedicineModel:
            let medicine = medicine as! CapsuleMedicineModel
            return MedicineFormModel(
                medicineName: medicine.medicineName,
                takingMoments: medicine.takingMoments,
                startDate: medicine.startDate,
                endDate: medicine.endDate,
                weight: medicine.weight,
                capsuleNumber: medicine.capsuleNumber
            )
        case is DrinkableMedicineModel:
            let medicine = medicine as! DrinkableMedicineModel
            return MedicineFormModel(
                medicineName: medicine.medicineName,
                takingMoments: medicine.takingMoments,
                startDate: medicine.startDate,
                endDate: medicine.endDate,
                volume: medicine.volume
            )
        case is PatchMedicineModel:
            let medicine = medicine as! PatchMedicineModel
            return MedicineFormModel(
                medicineName: medicine.medicineName,
                takingMoments: medicine.takingMoments,
                startDate: medicine.startDate,
                endDate: medicine.endDate,
                patchNumber: medicine.patchNumber,
                duration: medicine.duration
            )
        default:
            return MedicineFormModel()
        }
    }
}
