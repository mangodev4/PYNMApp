//
//  CardListViewModel.swift
//  PYNMApp
//
//  Created by Yujin Son on 9/4/24.
//

import Foundation
import Combine

class CardListViewModel: ObservableObject {
    
    @Published var cards: [Card] {
        didSet {
            saveCards()
        }
    }
    
    init() {
        self.cards = (1...20).map { Card(imageName: "sign\($0)") }
        //        self.cards = []
        
        DispatchQueue.main.async { [weak self] in
            self?.loadCards()
        }
    }
       
       func toggleBookmark(for id: UUID) {
           if let index = cards.firstIndex(where: { $0.id == id }) {
               cards[index].isBookmarked.toggle()
               saveCards()
           }
       }
    
    func updateCardImage(id: UUID, newImageName: String) {
        if let index = cards.firstIndex(where: { $0.id == id }) {
            cards[index].imageName = newImageName
        }
    }
    
    func updateCardOpacity(id: UUID, opacity: Double) {
        if let index = cards.firstIndex(where: { $0.id == id }) {
            cards[index].opacity = opacity
            saveCards()
        }
    }
    
    private func saveCards() {
//        let encoder = JSONEncoder()
        if let encodedData = try? JSONEncoder().encode(cards) {
            UserDefaults.standard.set(encodedData, forKey: "cards")
        }
    }

    private func loadCards() {
        if let savedData = UserDefaults.standard.data(forKey: "cards") {
            if let decodedCards = try? JSONDecoder().decode([Card].self, from: savedData) {
                self.cards = decodedCards
            }
        }
    }
}
