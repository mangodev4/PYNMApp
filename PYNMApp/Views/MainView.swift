//
//  MainView.swift
//  PYNMApp
//
//  Created by Yujin Son on 9/4/24.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel = CardListViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.cards) { card in
                NavigationLink(destination: CardDetailView(viewModel: viewModel, card: card)) {
                    Image(card.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                        .padding()
                }
            }
            .navigationTitle("Cards")
        }
    }
}
