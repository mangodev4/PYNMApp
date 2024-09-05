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
            ScrollView {
                LazyVStack(spacing: 10) {
                    ForEach(viewModel.cards) { card in
                        ZStack {
                            NavigationLink(destination: CardDetailView(viewModel: viewModel, card: card)) {
                                EmptyView()
                            }
                            .opacity(0)
                            
                            Image(card.imageName)
                                .resizable()
                                .scaledToFill()
                                .cornerRadius(8)
                            //                            .frame(height: 140)
                                .opacity(card.opacity)
                            //                            .padding()
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 3)
                    .padding(.horizontal, 5)
                    
                }
//                .buttonStyle(PlainButtonStyle())
//                .listRowInsets(EdgeInsets())
//                .listRowSeparator(.hidden)
            }
//            .listStyle(PlainListStyle())
            .navigationTitle("평양냉면")
        }
    }
}
