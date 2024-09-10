//
//  SignCard.swift
//  PYNMApp
//
//  Created by Yujin Son on 9/4/24.
//

import Foundation

struct Card: Identifiable, Hashable, Codable {
    let id = UUID()
    var imageName: String
    var opacity: Double = 0.3
}
