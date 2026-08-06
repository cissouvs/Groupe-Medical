//
//  ContactSheetViewModel.swift
//  Memora
//
//  Created by Leskeu  on 06/08/2026.
//

import Foundation

@Observable
final class ContactSheetViewModel {
    var contactForm : Contact = Contact(
        emailAdress: "",
        firstName: "",
        surName: "",
        phoneNumber: "",
        adress: "",
        postalCode: "",
        photo: nil
    )
}
