//
//  FavoritePlaceModel.swift
//  Memora
//
//  Created by Leskeu  on 06/08/2026.
//

import Foundation
import MapKit

struct Place: Identifiable  {
    var id = UUID()
    var image: String
    var name: String
    var adresse: String
    var detail: String
    var coordinate: CLLocationCoordinate2D
    var places: DifferentPlaces 
}

enum DifferentPlaces : String, Identifiable, CaseIterable {
    var id: RawValue { rawValue}
    
    case tous = "Tous"
    case emergency = "Lieux de prise en charge "
    case favorite = "Lieux Favoris"
    case contact = "Contacts"
}
