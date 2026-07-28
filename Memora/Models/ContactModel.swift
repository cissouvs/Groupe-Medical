//
//  EmergencyContactModel.swift
//  Memora
//
//  Created by Leskeu  on 22/07/2026.
//

import Foundation
import SwiftUI

struct Contact: Identifiable {
    var id = UUID()
    var emailAdress: String
    var firstName: String
    var surName: String
    var phoneNumber: String
    var adress: String
    var postalCode: String
    var photo: Image
}
