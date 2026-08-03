//
//  MedicamentModel.swift
//  Memora
//
//  Created by Apprenant76 on 03/08/2026.
//

import Foundation


enum MedicineType {
    case aricept
    case donepezil
    case exelon
    case galantamine
    case reminyl
    case rivastigmine
    case ebixa
    case memantine
}

enum DayMoment {
    case getUp
    case bedTime
    case breakfast
    case lunch
    case diner
}

enum Timing {
    case before
    case during
    case after
    case none
}

protocol Medicine {
    var medicineType: MedicineType { get set }
    var takingMoment: [(timing: Timing, dayMoment: DayMoment)] { get set }
    var details: String { get set  }
    var startDate: Date { get set }
    var endDate: Date { get set }
    var imageUrl: String { get set }
}


struct CapsuleMedicineModel: Medicine {
    var medicineType: MedicineType
    var takingMoment: [(timing: Timing, dayMoment: DayMoment)]
    var details: String
    var startDate: Date
    var endDate: Date
    var imageUrl: String
    var weight: Int
    var capsuleNumber: Int
}

struct DrinkableMedicineModel: Medicine {
    var medicineType: MedicineType
    var takingMoment: [(timing: Timing, dayMoment: DayMoment)]
    var details: String
    var startDate: Date
    var endDate: Date
    var imageUrl: String
    var volume: Int
}

struct PatchMedicineModel: Medicine {
    var medicineType: MedicineType
    var takingMoment: [(timing: Timing, dayMoment: DayMoment)]
    var details: String
    var startDate: Date
    var endDate: Date
    var imageUrl: String
    var patchNumber: Int
    var duration: Int
}
