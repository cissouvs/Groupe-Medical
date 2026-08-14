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
        takingMoments: [MedicineTakeTiming.bedTime],
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
            .duringBreakfast,
            .afterLunch,
            .duringDiner
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

    private let medicineDetails: [MedicineName: String] = [
        .aricept: "L'effet positif de ce médicament dans la maladie d'Alzheimer repose sur l'hypothèse d'un déficit cérébral en acétylcholine chez certains malades atteints de cette maladie, et sur des travaux scientifiques qui montrent que le donépézil améliore certaines fonctions cérébrales chez les malades.",
        .donepezil: "",
        .ebixa: "",
        .exelon: "",
        .galantamine: "",
        .memantine: "",
        .reminyl: "L'effet positif de ce médicament dans la maladie d'Alzheimer repose sur l'hypothèse d'un déficit cérébral en acétylcholine chez certains malades atteints de cette maladie, et sur des travaux scientifiques qui montrent que la galantamine améliore certaines fonctions cérébrales chez les malades.",
        .rivastigmine: "La rivastigmine est susceptible d'avoir un effet favorable sur les déficits cognitifs dépendants de ces voies cholinergiques au cours de la maladie d'Alzheimer et d'une démence associée à la maladie de Parkinson."
    ]

    private let medicinePhotoUrl: [MedicineName: String] = [
        .aricept:"https://cdn.pim.mesoigner.fr/mesoigner/8cc2bb4cda8b3bc00d4c81930eefbc91/mesoigner-thumbnail-1000-1000-inset/737/076/aricept-5-mg-comprime-pellicule.webp",
        .donepezil: "https://cdn.pim.mesoigner.fr/mesoigner/8415ca5265dac29b5a1e6690db12c77d/mesoigner-thumbnail-1000-1000-inset/125/263/donepezil-mylan-10-mg-comprime-pellicule.webp",
        .ebixa: "https://cdn.pim.mesoigner.fr/mesoigner/c5dab719d6c2582c0ac21bb0ddb4ccfa/mesoigner-thumbnail-1000-1000-inset/888/685/ebixa-20-mg-comprime-pellicule.webp",
        .exelon: "https://cdn.pim.mesoigner.fr/mesoigner/3cc1399b2bec6f89ba323e4f034f91a8/mesoigner-thumbnail-1000-1000-inset/033/904/exelon-9-5-mg-24-h-disp-transderm-30sach-pet-pe-alu-pa.webp",
        .galantamine: "https://cdn.pim.mesoigner.fr/mesoigner/ceda723a97fe9f314a85e1d54a857c96/mesoigner-thumbnail-1000-1000-inset/782/103/galantamine-biogaran-lp-16-mg-gelule-a-liberation-prolongee.webp",
        .memantine: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsp0i_EQDO5cOvxKKzYWwy5WQKzU766mswoEoKzrIEGg&s=10",
        .reminyl:"https://cdn.pim.mesoigner.fr/mesoigner/c23c149d2b855a005ef4b7f04034fb8d/mesoigner-thumbnail-1000-1000-inset/573/585/reminyl-4-mg-ml-solution-buvable.webp",
        .rivastigmine: "https://cdn.pim.mesoigner.fr/mesoigner/6dc1c928cbb2afff29b4c64148816534/mesoigner-thumbnail-1000-1000-inset/684/026/rivastigmine-arrow-9-5-mg-24-heures-dispositif-transdermique.webp"
    ]


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

    func getMedicineFromForm(from medicineForm: MedicineFormModel) -> any Medicine {
        switch medicineForm.medicineType {
        case .capsule:
            return CapsuleMedicineModel(
                id: medicineForm.id,
                medicineName: medicineForm.medicineName,
                takingMoments: medicineForm.takingMoments,
                details: medicineDetails[medicineForm.medicineName] ?? "",
                startDate: medicineForm.startDate,
                endDate: medicineForm.endDate,
                imageUrl: medicinePhotoUrl[medicineForm.medicineName] ?? "",
                weight: medicineForm.weight!,
                capsuleNumber: medicineForm.capsuleNumber!
            )
        case .drinkable:
            return DrinkableMedicineModel(
                id: medicineForm.id,
                medicineName: medicineForm.medicineName,
                takingMoments: medicineForm.takingMoments,
                details: medicineDetails[medicineForm.medicineName] ?? "",
                startDate: medicineForm.startDate,
                endDate: medicineForm.endDate,
                imageUrl: medicinePhotoUrl[medicineForm.medicineName] ?? "",
                volume: medicineForm.volume!
            )
        case .patch:
            return PatchMedicineModel(
                id: medicineForm.id,
                medicineName: medicineForm.medicineName,
                takingMoments: medicineForm.takingMoments,
                details: medicineDetails[medicineForm.medicineName] ?? "",
                startDate: medicineForm.startDate,
                endDate: medicineForm.endDate,
                imageUrl: medicinePhotoUrl[medicineForm.medicineName] ?? "",
                patchNumber: medicineForm.patchNumber!,
                duration: medicineForm.duration!
            )
        }
    }


    func addMedicine(medicineForm: MedicineFormModel) {
        medicines.append(getMedicineFromForm(from: medicineForm))
    }

    func deleteMedicine(medicineID: UUID) {
        if let medicineIndex = medicines.firstIndex(where: { $0.id == medicineID}) {
            medicines.remove(at: medicineIndex)
        }
    }

    func updateMedicine(from medicine: any Medicine, to medicineForm: MedicineFormModel) {
        if let index = medicines.firstIndex(where: {$0.id == medicine.id}) {
            medicines[index] = getMedicineFromForm(from: medicineForm)
        }
    }
}
