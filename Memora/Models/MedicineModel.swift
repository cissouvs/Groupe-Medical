//
//  MedicamentModel.swift
//  Memora
//
//  Created by Apprenant76 on 03/08/2026.
//

import Foundation


enum MedicineName: String , Identifiable, CaseIterable {
    case aricept = "Aricept"
    case donepezil = "Donépezil"
    case exelon = "Exelon"
    case galantamine = "Galantamine"
    case reminyl = "Reminyl"
    case rivastigmine = "Revastigmine"
    case ebixa = "Ebixa"
    case memantine = "Memantine"

    var id: Self { self }
}


enum DayMoment: String {
    case getUp = "Lever"
    case bedTime = "Coucher"
    case breakfast = "Petit déj."
    case lunch = "Déjeuner"
    case diner = "Dîner"
}

enum Timing: String {
    case before = "Avant"
    case during = "Pendant"
    case after = "Après"
    case none
}

protocol Medicine: Identifiable {
    var id: UUID { get }
    var medicineName: MedicineName { get set }
    var takingMoments: [(timing: Timing, dayMoment: DayMoment)] { get set }
    var details: String { get set }
    var startDate: Date { get set }
    var endDate: Date { get set }
    var imageUrl: String { get }

    var posologyString: String { get }
}


struct CapsuleMedicineModel: Medicine, Identifiable {
    var id: UUID = UUID()
    var medicineName: MedicineName
    var takingMoments: [(timing: Timing, dayMoment: DayMoment)]
    var details: String
    var startDate: Date
    var endDate: Date
    var imageUrl: String
    var weight: Int
    var capsuleNumber: Int
    var posologyString: String {
        "\(weight) mg, \(capsuleNumber) capsule"
    }
}

struct DrinkableMedicineModel: Medicine, Identifiable {
    var id: UUID = UUID()
    var medicineName: MedicineName
    var takingMoments: [(timing: Timing, dayMoment: DayMoment)]
    var details: String
    var startDate: Date
    var endDate: Date
    var imageUrl: String
    var volume: Int
    var posologyString: String {
        "\(volume) ml"
    }
}

struct PatchMedicineModel: Medicine, Identifiable {
    var id: UUID = UUID()
    var medicineName: MedicineName
    var takingMoments: [(timing: Timing, dayMoment: DayMoment)]
    var details: String
    var startDate: Date
    var endDate: Date
    var imageUrl: String
    var patchNumber: Int
    var duration: Int
    var posologyString: String {
        "\(patchNumber) patch pendant \(duration) h"
    }
}
