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
    func validateEmailAdress(emailAdress: String) -> Bool {
        if let emailRegex = try?
            Regex("[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}") {
            return emailAdress.contains(emailRegex)
        }
        return false
    }
    
    func validatePhoneNumber(phoneNumber: String) -> Bool {
        let prefixes = ["01", "02", "03", "04", "05", "06", "07", "09"]
        if phoneNumber.count != 10 ||
            !phoneNumber.allSatisfy({ $0.isNumber }) ||
            !prefixes.contains(String(phoneNumber.prefix(2)))
        {
            return false
        }
        return true
    }
}

