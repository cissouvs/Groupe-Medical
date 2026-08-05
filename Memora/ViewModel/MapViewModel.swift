//
//  MapViewModel.swift
//  Memora
//
//  Created by Leskeu  on 05/08/2026.
//

import Foundation
import MapKit

@Observable
final class MapViewModel {
  
    
    var userPosition = CLLocationCoordinate2D(
        latitude: 44.340861,
        longitude: 1.2024031597201768)
    
    var careGiversPosition = CLLocationCoordinate2D(
        latitude: 44.33878193104696,
        longitude: 1.2116824676429137)
}
