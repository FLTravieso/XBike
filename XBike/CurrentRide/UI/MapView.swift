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
        mapView.camera = GMSCameraPosition.camera(withLatitude: -34.6037,
                                                  longitude: -58.3816,
                                                  zoom: 15.0)

        return mapView
    }

    func updateUIView(_ uiView: GMSMapView, context: Context) {
        
    }
}
