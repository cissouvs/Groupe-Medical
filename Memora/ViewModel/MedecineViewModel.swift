//
//  MedecineViewModel.swift
//  Memora
//
//  Created by Leskeu  on 05/08/2026.
//

import Foundation

let mockMedicines: [any Medicine] = [
    CapsuleMedicineModel(
        medicineName: .aricept,
        takingMoments: [(timing: Timing.none, dayMoment: DayMoment.bedTime)],
        details: "L'effet positif de ce médicament dans la maladie d'Alzheimer repose sur l'hypothèse d'un déficit cérébral en acétylcholine chez certains malades atteints de cette maladie, et sur des travaux scientifiques qui montrent que le donépézil améliore certaines fonctions cérébrales chez les malades.",
        startDate: Date(),
        endDate: .now.addingTimeInterval(2592000),
        imageUrl: "https://cdn.pim.mesoigner.fr/mesoigner/8cc2bb4cda8b3bc00d4c81930eefbc91/mesoigner-thumbnail-1000-1000-inset/737/076/aricept-5-mg-comprime-pellicule.webp",
        weight: 5,
        capsuleNumber: 2,
    ),
    DrinkableMedicineModel(
        medicineName: .reminyl,
        takingMoments: [
            (timing: .during, dayMoment: .breakfast),
            (timing: .during, dayMoment: .diner)
        ],
        details: "L'effet positif de ce médicament dans la maladie d'Alzheimer repose sur l'hypothèse d'un déficit cérébral en acétylcholine chez certains malades atteints de cette maladie, et sur des travaux scientifiques qui montrent que la galantamine améliore certaines fonctions cérébrales chez les malades.",
        startDate: Date(),
        endDate: .now.addingTimeInterval(597800),
        imageUrl:
            "https://cdn.pim.mesoigner.fr/mesoigner/c23c149d2b855a005ef4b7f04034fb8d/mesoigner-thumbnail-1000-1000-inset/573/585/reminyl-4-mg-ml-solution-buvable.webp",
        volume: 100
    ),
    PatchMedicineModel(
        medicineName: .rivastigmine,
        takingMoments: [],
        details: "La rivastigmine est susceptible d'avoir un effet favorable sur les déficits cognitifs dépendants de ces voies cholinergiques au cours de la maladie d'Alzheimer et d'une démence associée à la maladie de Parkinson.",
        startDate: Date(),
        endDate: .now.addingTimeInterval(597800),
        imageUrl: "https://cdn.pim.mesoigner.fr/mesoigner/6dc1c928cbb2afff29b4c64148816534/mesoigner-thumbnail-1000-1000-inset/684/026/rivastigmine-arrow-9-5-mg-24-heures-dispositif-transdermique.webp",
        patchNumber: 1,
        duration: 24
    )
]


@Observable
final class MedecineViewModel {

    var medicines: [any Medicine] = mockMedicines

    func getFilteredMedicines(at date: Date) -> [any Medicine] {
        medicines.filter( {
            calendar.compare($0.startDate, to: date, toGranularity: .day) == .orderedAscending &&
            calendar.compare($0.endDate, to: date, toGranularity: .day) == .orderedDescending ||
            calendar.compare($0.startDate, to: date, toGranularity: .day) == .orderedSame ||
            calendar.compare($0.endDate, to: date, toGranularity: .day) == .orderedSame
        })
    }

    func getMedicine(medicineID: UUID) -> (any Medicine)? {
        if let index = medicines.firstIndex(where: { $0.id == medicineID }) {
            return medicines[index]
        }
        return nil
    }

    func deleteMedicine(medicineID: UUID) {
        if let medicineIndex = medicines.firstIndex(where: { $0.id == medicineID}) {
            medicines.remove(at: medicineIndex)
        }
    }
}
