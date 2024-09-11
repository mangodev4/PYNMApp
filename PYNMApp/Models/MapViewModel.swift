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
        // 샘플 데이터 추가
        places = [
            Place(name: "Garage", coordinate: CLLocationCoordinate2D(latitude: 37.503774633134, longitude: 127.048192060882)),
            Place(name: "Place 1", coordinate: CLLocationCoordinate2D(latitude: 40.83757722488077, longitude: 14.306896671048852)),
            Place(name: "Place 2", coordinate: CLLocationCoordinate2D(latitude: 40.83857722488077, longitude: 14.306896671048852)),
            // 나머지 17개 장소 추가
        ]
    }
}
