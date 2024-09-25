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
        
        self.cards = [
            Card(imageName: "sign1", address: "서울특별시 중구 창경궁로 62-29"),
            Card(imageName: "sign2", address: "서울특별시 중구 장충동 장충단로 207"),
            Card(imageName: "sign3", address: "경기도 의정부시 의정부동 평화로439번길 7"),
            Card(imageName: "sign4", address: "서울특별시 마포구 숭문길 24"),
            Card(imageName: "sign5", address: "서울특별시 중구 서애로 26"),
            Card(imageName: "sign6", address: "서울특별시 종로구 낙원동 55-1"),
            Card(imageName: "sign7", address: "서울특별시 강남구 압구정로38길 14"),
            Card(imageName: "sign8", address: "서울특별시 송파구 양재대로71길 1-4"),
            Card(imageName: "sign9", address: "서울특별시 중구 을지로3길 24"),
            Card(imageName: "sign10", address: "서울특별시 중구 세종대로11길 35"),
            Card(imageName: "sign11", address: "서울특별시 영등포구 국회대로76길 10"),
            Card(imageName: "sign12", address: "서울특별시 광진구 자양로 199-1"),
            Card(imageName: "sign13", address: "서울특별시 구로구 오류제1동 13-55"),
            Card(imageName: "sign14", address: "서울특별시 은평구 연서로 171"),
            Card(imageName: "sign15", address: "서울특별시 중구 남대문시장4길 41-6 1층"),
            Card(imageName: "sign16", address: "서울특별시 중구 마른내로 21-1"),
            Card(imageName: "sign17", address: "서울특별시 종로구 종로17길 40"),
            Card(imageName: "sign18", address: "경기도 성남시 분당구 동판교로52번길 10 1층"),
            Card(imageName: "sign19", address: "서울특별시 마포구 양화로 156"),
            Card(imageName: "sign20", address: "경기도 평택시 평택동 55-24")
            ]
        
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
