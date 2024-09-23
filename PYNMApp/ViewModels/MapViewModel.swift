//
//  MapViewModel.swift
//  PYNMApp
//
//  Created by Yujin Son on 9/11/24.
//

import SwiftUI
import Combine
import MapKit

class MapViewModel: ObservableObject {
    @Published var places: [NMPlace] = []
    @Published var region: MKCoordinateRegion
//    @Published var currentIndex: Int = 0
    @Published var selectedCardIndex: Int = 0
    @Published var selectedPlace: NMPlace?
//    @Published var isShowModal = true

    init() {
         self.region = MKCoordinateRegion(
             center: CLLocationCoordinate2D(latitude: 37.503774633134, longitude: 127.048192060882),
             span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
         )
     }
     
        
        
        func loadPlaces() {
            DispatchQueue.main.async {
                self.places = sampleNMPlaces
            }
        }
    
    func updatePlace(to place: NMPlace) {
        self.selectedPlace = place
        withAnimation {
            self.region = MKCoordinateRegion(
                center: place.coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            )
        }
    }
        
        func movePlace() {
            withAnimation(Animation.linear(duration: 4.0)) {
                selectedCardIndex = (selectedCardIndex + 1) % places.count
                region.center = places[selectedCardIndex].coordinate
                region.span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
            }
        }
    }

