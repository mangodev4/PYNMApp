//
//  MainView.swift
//  PYNMApp
//
//  Created by Yujin Son on 9/4/24.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel = CardListViewModel()
    @StateObject var navigationManager = NavigationManager()
    
    var body: some View {
        NavigationStack(path: $navigationManager.path) {
            ScrollView {
                LazyVStack(spacing: 10) {
                    ForEach(viewModel.cards) { card in
                        ZStack {
                            Button(action: {
                                navigationManager.navigateToCardDetail(card: card)
                            }) {
                                Image(card.imageName)
                                    .resizable()
                                    .scaledToFill()
                                    .cornerRadius(8)
                                    .opacity(card.opacity)
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 3)
                        .padding(.horizontal, 5)
                        
                    }
                }
            }
            .navigationTitle("평양냉면")
            .navigationDestination(for: Card.self) { card in
                CardDetailView(viewModel: viewModel, card: card)
                    .environmentObject(navigationManager)
            }
        }
        .environmentObject(navigationManager)
    }
}
