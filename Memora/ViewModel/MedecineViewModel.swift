//
//  MedecineViewModel.swift
//  Memora
//
//  Created by Leskeu  on 05/08/2026.
//

import Foundation

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
}
