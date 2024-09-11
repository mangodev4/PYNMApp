//
//  MapView.swift
//  PYNMApp
//
//  Created by Yujin Son on 9/11/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @StateObject private var viewModel = MapViewModel()
    
//    let garage = CLLocationCoordinate2D(latitude: 40.83657722488077, longitude: 14.306896671048852)
    
        var body: some View {
            Map(coordinateRegion: .constant(MKCoordinateRegion(
                       center: CLLocationCoordinate2D(latitude: 37.503774633134, longitude: 127.048192060882),
                       span: MKCoordinateSpan(latitudeDelta: 0.003, longitudeDelta: 0.003)
                   )), annotationItems: viewModel.places) { place in
                       MapAnnotation(coordinate: place.coordinate) {
                           ZStack {
                               RoundedRectangle(cornerRadius: 5)
                                   .fill(Color.white.opacity(0.8))
                               RoundedRectangle(cornerRadius: 5)
                                   .stroke(Color.secondary, lineWidth: 2)
                               VStack {
                                   Image(systemName: "building.fill")
                                       .foregroundColor(.blue)
                                       .padding(5)
                                   Text(place.name)
                                       .font(.caption)
                                       .padding(5)
                               }
                           }
                       }
                   }
                   .onAppear {
                       viewModel.loadPlaces()
                   }
                   .edgesIgnoringSafeArea(.all)
               }
           }

#Preview {
    MapView()
}
