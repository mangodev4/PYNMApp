//
//  CardDetailView.swift
//  PYNMApp
//
//  Created by Yujin Son on 9/4/24.
//

import SwiftUI

struct CardDetailView: View {
    @ObservedObject var viewModel: CardListViewModel
    var card: Card
    
    var body: some View {
        VStack {
            Image(card.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 300)
                .padding()
            
            Button("Change Image") {
                let newImageName = "newSign"
                viewModel.updateCardImage(id: card.id, newImageName: newImageName)
            }
            .padding()
        }
        .navigationTitle("Card Detail")
    }
}
