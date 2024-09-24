//
//  NMListView.swift
//  PYNMApp
//
//  Created by Yujin Son on 9/12/24.
//

import SwiftUI

struct NMListView: View {
    @ObservedObject var cardListViewModel = CardListViewModel()
    @StateObject var mapViewModel = MapViewModel()
    @StateObject var navigationManager = NavigationManager()
//    @EnvironmentObject var navigationManager: NavigationManager
    @Environment(\.presentationMode) var presentationMode


    
    var body: some View {
        NavigationStack(path: $navigationManager.path) {
            VStack {
                StickyHeader()
            ScrollView {
                LazyVStack {
                    ForEach(cardListViewModel.cards) { card in
                        VStack {
                            Image(card.imageName)
                                .resizable()
                                .scaledToFill()
                                .cornerRadius(8)
                                .opacity(card.opacity)
                            Text(card.imageName)
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: 150)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 5)
                    .background(Color.clear)
                }
            }
        }
            }
//            .navigationDestination(for: Card.self) { card in
//                NMMapView()
//                    .environmentObject(navigationManager)
//                    .onAppear {
//                        if let index = cardListViewModel.cards.firstIndex(where: { $0.id == card.id }) {
//                            mapViewModel.selectedCardIndex = index
//                        }
//                    }
//            }
        }
    }

// MARK: Sticky Header
struct StickyHeader: View {
    var body: some View {
        VStack {
            Spacer()
            Text("평양 냉면")
                .fontWeight(.bold)
            Text("서울 맛집 20선")
            Spacer()
            Divider()
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .frame(height: 50)
        .background(Rectangle().foregroundColor(.white))
    }
}

#Preview {
    NMListView()
}
