//
//  CalendarViewModel.swift
//  Memora
//
//  Created by Apprenant76 on 03/08/2026.
//

import Foundation


@Observable class CalendarViewModel {
    var medicines: [any Medicine] = mockMedicines
    var calendar = Calendar.current

    func getFilteredMedicines(at date: Date) -> [any Medicine] {
        medicines.filter( {
            calendar.compare($0.startDate, to: date, toGranularity: .day) == .orderedAscending &&
            calendar.compare($0.endDate, to: date, toGranularity: .day) == .orderedDescending ||
            calendar.compare($0.startDate, to: date, toGranularity: .day) == .orderedSame ||
            calendar.compare($0.endDate, to: date, toGranularity: .day) == .orderedSame
        })
    }
}
