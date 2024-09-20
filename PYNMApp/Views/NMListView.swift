//
//  NMListView.swift
//  PYNMApp
//
//  Created by Yujin Son on 9/12/24.
//

import SwiftUI

struct NMListView: View {
    @ObservedObject var viewModel = CardListViewModel()
    @StateObject var navigationManager = NavigationManager()
    
    var body: some View {
        NavigationStack(path: $navigationManager.path) {
            ScrollView {
                LazyVStack {
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
                            Text(card.imageName)
                        }
                        .frame(maxWidth: .infinity, maxHeight: 150)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 5)
                        .background(Color.clear)
                    }
                }
            }
//            .navigationDestination(for: Card.self) { card in
//                CardDetailView(viewModel: viewModel, card: card)
//                    .environmentObject(navigationManager)
//            }
        }
        .environmentObject(navigationManager)
    }
}


#Preview {
    NMListView()
}
