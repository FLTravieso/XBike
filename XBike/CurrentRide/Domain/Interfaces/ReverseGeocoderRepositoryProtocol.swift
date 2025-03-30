//
//  ReverseGeocoderRepositoryProtocol.swift
//  XBike
//
//  Created by Frank Travieso on 30/03/2025.
//

import CoreLocation

protocol ReverseGeocoderRepositoryProtocol {
    func getAddress(for coordinates: CLLocationCoordinate2D) async -> Result<String, RideDomainError>
}
