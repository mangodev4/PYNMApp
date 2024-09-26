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
    var isBookmarked: Bool = false
}

let sampleNMPlaces: [NMPlace] = [
    NMPlace(name: "우래옥", coordinate: CLLocationCoordinate2D(latitude: 37.568218524634, longitude: 126.998714470746)),
    NMPlace(name: "평양면옥\n장충본점", coordinate: CLLocationCoordinate2D(latitude: 37.563030058504, longitude: 127.006469531603)),
    NMPlace(name: "평양면옥\n의정부", coordinate: CLLocationCoordinate2D(latitude: 37.730975443868, longitude: 127.047533160306)),
    NMPlace(name: "을밀대", coordinate: CLLocationCoordinate2D(latitude: 37.547492672434, longitude: 126.945531718956)),
    NMPlace(name: "필동면옥", coordinate: CLLocationCoordinate2D(latitude: 37.560393160651, longitude: 126.997004329544)),
    NMPlace(name: "을지면옥", coordinate: CLLocationCoordinate2D(latitude: 37.573659600000, longitude: 126.988612600000)),
    NMPlace(name: "한일관", coordinate: CLLocationCoordinate2D(latitude: 37.527824000000, longitude: 127.032491100000)),
    NMPlace(name: "봉피양\n벽제갈비", coordinate: CLLocationCoordinate2D(latitude: 37.510200900000, longitude: 127.126026400000)),
    NMPlace(name: "남포면옥", coordinate: CLLocationCoordinate2D(latitude: 37.567147300000, longitude: 126.981684600000)),
    NMPlace(name: "강서면옥", coordinate: CLLocationCoordinate2D(latitude: 37.562007100000, longitude: 126.973969000000)),
    NMPlace(name: "정인면옥", coordinate: CLLocationCoordinate2D(latitude: 37.530682700000, longitude: 126.921620300000)),
    NMPlace(name: "서북면옥", coordinate: CLLocationCoordinate2D(latitude: 37.545416800000, longitude: 127.085329800000)),
    NMPlace(name: "오류동\n평양냉면", coordinate: CLLocationCoordinate2D(latitude: 37.496931900000, longitude: 126.841308700000)),
    NMPlace(name: "만포면옥", coordinate: CLLocationCoordinate2D(latitude: 37.614129600000, longitude: 126.917461700000)),
    NMPlace(name: "부원면옥", coordinate: CLLocationCoordinate2D(latitude: 37.558436000000, longitude: 126.977609700000)),
    NMPlace(name: "평래옥", coordinate: CLLocationCoordinate2D(latitude: 37.564910300000, longitude: 126.990390000000)),
    NMPlace(name: "유진식당", coordinate: CLLocationCoordinate2D(latitude: 37.572030600000, longitude: 126.988306400000)),
    NMPlace(name: "성일면옥", coordinate: CLLocationCoordinate2D(latitude: 37.387072400000, longitude: 127.114215100000)),
    NMPlace(name: "평안도\n상원냉면", coordinate: CLLocationCoordinate2D(latitude: 37.556078700000, longitude: 126.923450300000)),
    NMPlace(name: "서울면옥", coordinate: CLLocationCoordinate2D(latitude: 36.992124800000, longitude: 127.085505300000))
    // 냉면집 20개 리스트
]
