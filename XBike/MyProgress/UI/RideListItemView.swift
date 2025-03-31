//
//  RideListItemView.swift
//  XBike
//
//  Created by Frank Travieso on 30/03/2025.
//
import SwiftUI

struct RideListItemView: View {
    let rideItem: RideItem
    
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading) {
                Text(rideItem.time)
                    .font(.largeTitle)
                    .foregroundStyle(.black)

                Text(rideItem.startingPlace)
                    .font(.title2)
                    .foregroundStyle(.gray)

                Text(rideItem.finishingPlace)
                    .font(.title2)
                    .foregroundStyle(.gray)
            }

            Spacer()

            Text(rideItem.distance)
                .font(.title)
                .foregroundStyle(.black)
        }
        .padding(20)
    }
}
