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
        ZStack {
            Color(.red)
                .edgesIgnoringSafeArea(.all)
            ZStack {
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .foregroundColor(.white)
                    .clipShape(RoundedCorners(topLeft: 30, topRight: 30))
                    .edgesIgnoringSafeArea(.bottom)
                
                VStack {
                    Spacer()
                    
                    Image(card.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 350)
                        .padding()
                    
                    Text(card.imageName)
                        .font(.largeTitle)
                    
                    Spacer()
                    
                    Text("000-0000-0000")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    
                    Spacer()
                    
                    Button("Save") {
                        //                let newImageName = "newSign"
                        //                viewModel.updateCardImage(id: card.id, newImageName: newImageName)
                        viewModel.updateCardOpacity(id: card.id, opacity: 1.0)
                        
                    }
                    .padding()
                }
            }
            .frame(maxHeight: .infinity)
        }
        //
    }
}
