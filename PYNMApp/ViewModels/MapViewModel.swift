//
//  MapViewModel.swift
//  PYNMApp
//
//  Created by Yujin Son on 9/11/24.
//

import Combine
import MapKit

class MapViewModel: ObservableObject {
    @Published var places: [Place] = []
    
    func loadPlaces() {
        places = samplePlaces
    }
}
