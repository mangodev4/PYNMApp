//
//  Places.swift
//  PYNMApp
//
//  Created by Yujin Son on 9/13/24.
//

import Foundation
import MapKit

struct NMPlace: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

let sampleNMPlaces: [NMPlace] = [
    NMPlace(name: "Garage", coordinate: CLLocationCoordinate2D(latitude: 37.503774633134, longitude: 127.048192060882)),
    NMPlace(name: "우래옥", coordinate: CLLocationCoordinate2D(latitude: 37.568218524634, longitude: 126.998714470746)),
    NMPlace(name: "평양면옥 장충본점", coordinate: CLLocationCoordinate2D(latitude: 37.563030058504, longitude: 127.006469531603)),
    NMPlace(name: "평양면옥 의정부", coordinate: CLLocationCoordinate2D(latitude: 37.503774633134, longitude: 127.048192060882)),
    NMPlace(name: "Place 1", coordinate: CLLocationCoordinate2D(latitude: 37.5085953316928, longitude: 127.059718502493)),
    NMPlace(name: "Place 2", coordinate: CLLocationCoordinate2D(latitude: 37.5073677154051, longitude: 127.047165945717)),
    NMPlace(name: "Place 3", coordinate: CLLocationCoordinate2D(latitude: 37.5032022121152, longitude: 127.049313250519)),
    NMPlace(name: "Place 4", coordinate: CLLocationCoordinate2D(latitude: 37.5035470555751, longitude: 127.047033596011))
    // 나머지 장소 추가
]
