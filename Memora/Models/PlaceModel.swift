//
//  FavoritePlaceModel.swift
//  Memora
//
//  Created by Leskeu  on 06/08/2026.
//

import Foundation

struct Place: Identifiable  {
    var id = UUID()
    var image: String
    var name: String
    var adresse: String
    var detail: String
}
