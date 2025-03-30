//
//  MapView.swift
//  XBike
//
//  Created by Frank Travieso on 29/03/2025.
//

import SwiftUI
import GoogleMaps

struct MapView: UIViewRepresentable {
    @Binding var userLocation: CLLocationCoordinate2D
    @Binding var userPath: GMSMutablePath

    let mapView = GMSMapView()

    func makeUIView(context: Context) -> GMSMapView {
        mapView.camera = GMSCameraPosition.camera(withLatitude: userLocation.latitude,
                                                  longitude: userLocation.longitude,
                                                  zoom: Constants.Map.defaultZoom)

        mapView.isMyLocationEnabled = true

        return mapView
    }

    func updateUIView(_ mapView: GMSMapView, context: Context) {
        mapView.animate(toLocation: userLocation)

        let polyline = GMSPolyline(path: userPath)
        polyline.strokeColor = .orange
        polyline.strokeWidth = 3.0
        polyline.map = mapView
    }
}
