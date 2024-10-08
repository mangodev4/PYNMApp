//
//  SignCard.swift
//  PYNMApp
//
//  Created by Yujin Son on 9/4/24.
//

import Foundation

struct Card: Identifiable, Hashable, Codable {
    let id: UUID
    var imageName: String
    var opacity: Double = 0.5
    var isBookmarked: Bool
    var phoneNumber: String
    var address: String
    
    init(imageName: String, opacity: Double = 1.0, isBookmarked: Bool = false, phoneNumber: String, address: String) {
        self.id = UUID()
        self.imageName = imageName
        self.opacity = opacity
        self.isBookmarked = isBookmarked
        self.phoneNumber = phoneNumber
        self.address = address
    }
}
