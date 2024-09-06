//
//  CardListViewModel.swift
//  PYNMApp
//
//  Created by Yujin Son on 9/4/24.
//

import Foundation
import Combine

class CardListViewModel: ObservableObject {
    @Published var cards: [Card]
    
    init() {
        self.cards = (1...20).map { Card(imageName: "sign\($0)") }
    }
    
    func updateCardImage(id: UUID, newImageName: String) {
        if let index = cards.firstIndex(where: { $0.id == id }) {
            cards[index].imageName = newImageName
        }
    }
    
    func updateCardOpacity(id: UUID, opacity: Double) {
        if let index = cards.firstIndex(where: { $0.id == id }) {
            cards[index].opacity = opacity
        }
    }
}
