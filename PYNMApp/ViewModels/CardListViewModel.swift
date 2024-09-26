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
            Card(imageName: "sign1", phoneNumber: "02-2265-0151", address: "서울특별시 중구 창경궁로 62-29"),
            Card(imageName: "sign2", phoneNumber: "02-2267-7784", address: "서울특별시 중구 장충동 장충단로 207"),
            Card(imageName: "sign3", phoneNumber: "031-877-2282", address: "경기도 의정부시 의정부동 평화로439번길 7"),
            Card(imageName: "sign4", phoneNumber: "02-717-1922", address: "서울특별시 마포구 숭문길 24"),
            Card(imageName: "sign5", phoneNumber: "02-2266-2611", address: "서울특별시 중구 서애로 26"),
            Card(imageName: "sign6", phoneNumber: "02-2266-7052", address: "서울특별시 종로구 낙원동 55-1"),
            Card(imageName: "sign7", phoneNumber: "1577-9963", address: "서울특별시 강남구 압구정로38길 14"),
            Card(imageName: "sign8", phoneNumber: "02-415-5527", address: "서울특별시 송파구 양재대로71길 1-4"),
            Card(imageName: "sign9", phoneNumber: "02-777-3131", address: "서울특별시 중구 을지로3길 24"),
            Card(imageName: "sign10", phoneNumber: "02-752-1945", address: "서울특별시 중구 세종대로11길 35"),
            Card(imageName: "sign11", phoneNumber: "02-2683-2615", address: "서울특별시 영등포구 국회대로76길 10"),
            Card(imageName: "sign12", phoneNumber: "02-457-8319", address: "서울특별시 광진구 자양로 199-1"),
            Card(imageName: "sign13", phoneNumber: "02-2614-2263", address: "서울특별시 구로구 오류제1동 13-55"),
            Card(imageName: "sign14", phoneNumber: "02-389-3917", address: "서울특별시 은평구 연서로 171"),
            Card(imageName: "sign15", phoneNumber: "02-753-7728", address: "서울특별시 중구 남대문시장4길 41-6 1층"),
            Card(imageName: "sign16", phoneNumber: "02-2267-5892", address: "서울특별시 중구 마른내로 21-1"),
            Card(imageName: "sign17", phoneNumber: "02-764-2835", address: "서울특별시 종로구 종로17길 40"),
            Card(imageName: "sign18", phoneNumber: "02-478-1117", address: "경기도 성남시 분당구 동판교로52번길 10 1층"),
            Card(imageName: "sign19", phoneNumber: "02-478-1117", address: "서울특별시 마포구 양화로 156"),
            Card(imageName: "sign20", phoneNumber: "02-478-1117", address: "경기도 평택시 평택동 55-24")
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
