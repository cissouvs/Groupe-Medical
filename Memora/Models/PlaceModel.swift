//
//  FavoritePlaceModel.swift
//  Memora
//
//  Created by Leskeu  on 06/08/2026.
//

import Foundation
import MapKit

struct Place: Identifiable, Hashable {
    var id = UUID()
    var picture: String
    var name: String
    var adresse: String
    var detail: String
    var coordinate: CLLocationCoordinate2D
    var places: DifferentPlaces

    static func == (lhs: Place, rhs: Place) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}


enum DifferentPlaces : String, Identifiable, CaseIterable {
    var id: RawValue { rawValue}
    
    case tous = "Tous"
    case emergency = "Lieux de prise en charge "
    case favorite = "Lieux Favoris"
    case contact = "Contacts"
}

let pharmaciePosition = CLLocationCoordinate2D(
    latitude: 44.3394,
    longitude: 1.2096
)

let maisonSantePosition = CLLocationCoordinate2D(
    latitude: 44.3388,
    longitude: 1.2117
)

let pompiersPosition = CLLocationCoordinate2D(
    latitude: 44.3379,
    longitude: 1.2135
)

let gendarmeriePosition = CLLocationCoordinate2D(
    latitude: 44.3399,
    longitude: 1.2088
)

let hopitalCahorsPosition = CLLocationCoordinate2D(
    latitude: 44.4486,
    longitude: 1.4385
)

let mediathequePosition = CLLocationCoordinate2D(
    latitude: 44.3391,
    longitude: 1.2089
)

let planEauPosition = CLLocationCoordinate2D(
    latitude: 44.3328,
    longitude: 1.2129
)

let cafeFrancePosition = CLLocationCoordinate2D(
    latitude: 44.3389,
    longitude: 1.2093
)

let salleAinesPosition = CLLocationCoordinate2D(
    latitude: 44.33985491724095,
    longitude: 1.2052881717896686
)

let tourMontcuqPosition = CLLocationCoordinate2D(
    latitude: 44.3394,
    longitude: 1.2086
)

let mediathequeFavoritePosition = CLLocationCoordinate2D(
    latitude: 44.3391,
    longitude: 1.2089
)

let quercyBlancPosition = CLLocationCoordinate2D(
    latitude: 44.3400,
    longitude: 1.2100
)

let cafePainPosition = CLLocationCoordinate2D(
    latitude: 44.3387,
    longitude: 1.2095
)

let aquazonePosition = CLLocationCoordinate2D(
    latitude: 44.3327,
    longitude: 1.2128
)

let centreHistoriquePosition = CLLocationCoordinate2D(
    latitude: 44.3392,
    longitude: 1.2088
)
