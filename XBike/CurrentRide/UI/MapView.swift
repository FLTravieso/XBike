//
//  MapView.swift
//  XBike
//
//  Created by Frank Travieso on 29/03/2025.
//

import SwiftUI
import GoogleMaps

struct MapView: UIViewRepresentable {
    let mapView = GMSMapView()

    func makeUIView(context: Context) -> GMSMapView {
        mapView.camera = GMSCameraPosition.camera(withLatitude: Constants.Map.defaultLatitude,
                                                  longitude: Constants.Map.defaultLongitude,
                                                  zoom: Constants.Map.defaultZoom)

        return mapView
    }

    func updateUIView(_ uiView: GMSMapView, context: Context) {
        
    }
}
