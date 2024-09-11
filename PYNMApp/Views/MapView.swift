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
    @State private var region: MKCoordinateRegion
    @State private var currentIndex = 0
    
    init() {
        _region = State(initialValue: MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 37.503774633134, longitude: 127.048192060882),
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        ))
    }
    
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $region, annotationItems: viewModel.places) { place in
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
        
        Button {
            withAnimation {
                currentIndex = (currentIndex + 1) % viewModel.places.count
                region.center = viewModel.places[currentIndex].coordinate
                region.span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
            }
        } label: {
            Text("Teleport")
        }
        .buttonStyle(OnboardingButtonStyle())
    }
}

#Preview {
    MapView()
}
