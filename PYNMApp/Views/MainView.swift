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
                    ZStack {
                        Image(card.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(height: 140)
                            .opacity(card.opacity)
//                            .padding()
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 2)
                }
                .buttonStyle(PlainButtonStyle())
            }
            .listStyle(PlainListStyle())
            .listRowSeparator(.hidden)
            .navigationTitle("평양냉면")
        }
    }
}
