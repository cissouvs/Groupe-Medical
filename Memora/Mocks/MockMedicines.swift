//
//  MockMedicines.swift
//  Memora
//
//  Created by Apprenant76 on 03/08/2026.
//

import Foundation

let medicines: [Medicine] = [
    CapsuleMedicineModel(
        medicineType: .aricept,
        takingMoment: [(timing: Timing.none, dayMoment: DayMoment.bedTime)],
        details: "",
        startDate: Date(),
        endDate: .now.addingTimeInterval(2592000),
        imageUrl: "https://cdn.pim.mesoigner.fr/mesoigner/8cc2bb4cda8b3bc00d4c81930eefbc91/mesoigner-thumbnail-1000-1000-inset/737/076/aricept-5-mg-comprime-pellicule.webp",
        weight: 5,
        capsuleNumber: 2,
    ),
    DrinkableMedicineModel(
        medicineType: .reminyl,
        takingMoment: [
            (timing: .during, dayMoment: .breakfast),
            (timing: .during, dayMoment: .diner)
        ],
        details: "",
        startDate: Date(),
        endDate: .now.addingTimeInterval(597800),
        imageUrl:
            "https://cdn.pim.mesoigner.fr/mesoigner/c23c149d2b855a005ef4b7f04034fb8d/mesoigner-thumbnail-1000-1000-inset/573/585/reminyl-4-mg-ml-solution-buvable.webp",
        volume: 1
    ),
    PatchMedicineModel(
        medicineType: .rivastigmine,
        takingMoment: [],
        details: "",
        startDate: Date(),
        endDate: .now.addingTimeInterval(597800),
        imageUrl: "https://cdn.pim.mesoigner.fr/mesoigner/6dc1c928cbb2afff29b4c64148816534/mesoigner-thumbnail-1000-1000-inset/684/026/rivastigmine-arrow-9-5-mg-24-heures-dispositif-transdermique.webp",
        patchNumber: 1,
        duration: 24
    )
]
