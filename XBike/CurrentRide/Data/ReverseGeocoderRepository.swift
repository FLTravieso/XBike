//
//  ReverseGeocoderRepository.swift
//  XBike
//
//  Created by Frank Travieso on 30/03/2025.
//
import Foundation
import CoreLocation

class ReverseGeocodeRepository: ReverseGeocoderRepositoryProtocol {    
    private let geocoder = CLGeocoder()

    func getAddress(for coordinates: CLLocationCoordinate2D) async -> Result<String, RideDomainError> {
        let location = CLLocation(latitude: coordinates.latitude, longitude: coordinates.longitude)
    
        do {
            let address = try await geocoder.reverseGeocodeLocation(location)
            
            if let address = address.first?.name {
                return .success(address)
            } else {
                return .failure(.reverseGeocodeError)
            }
        } catch {
            return .failure(.reverseGeocodeError)
        }
    }
}
