//
//  MapView.swift
//  PYNMApp
//
//  Created by Yujin Son on 9/11/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    let garage = CLLocationCoordinate2D(latitude: 40.83657722488077, longitude: 14.306896671048852)
    
        var body: some View {
            Map {
                Annotation("Garage", coordinate: garage) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .fill(.background)
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(.secondary, lineWidth: 5)
                        Image(systemName: "car")
                            .padding(8)
                    }
                }
            }
//            .mapControlVisibility(.hidden)
        }
    }

#Preview {
    MapView()
}
