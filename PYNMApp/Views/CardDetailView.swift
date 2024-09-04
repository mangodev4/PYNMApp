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
                .frame(height: 350)
                .padding()
            
            Text(card.imageName)
                .font(.largeTitle)
            
            Text("000-0000-0000")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)

            
            Button("Save") {
//                let newImageName = "newSign"
//                viewModel.updateCardImage(id: card.id, newImageName: newImageName)
                viewModel.updateCardOpacity(id: card.id, opacity: 1.0)

            }
            .padding()
        }
        .navigationTitle("가게 정보")
    }
}
