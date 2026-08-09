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

enum MedicineTakeTiming: String, Identifiable, CaseIterable {
    case getUp = "Lever"
    case bedTime = "Coucher"
    case beforeBreakfast = "Avant Petit Déj."
    case duringBreakfast = "Pendant Petit Déj."
    case afterBreakfast = "Après Petit Déj."
    case beforeLunch = "Avant Déjeuner"
    case duringLunch = "Pendant Déjeuner"
    case afterLunch = "Après Déjeuner"
    case beforeDiner = "Avant Dîner"
    case duringDiner = "Pendant Dîner."
    case afterDiner = "Après Dîner"

    var id: Self { self }
}

protocol Medicine: Identifiable {
    var id: UUID { get }
    var medicineName: MedicineName { get set }
    var takingMoments: [MedicineTakeTiming] { get set }
    var details: String { get set }
    var startDate: Date { get set }
    var endDate: Date { get set }
    var imageUrl: String { get }

    var posologyString: String { get }
}


struct CapsuleMedicineModel: Medicine, Identifiable {
    var id: UUID = UUID()
    var medicineName: MedicineName
    var takingMoments: [MedicineTakeTiming]
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
    var takingMoments: [MedicineTakeTiming]
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
    var takingMoments: [MedicineTakeTiming]
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
