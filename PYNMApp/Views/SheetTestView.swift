//
//  SheetTestView.swift
//  PYNMApp
//
//  Created by Yujin Son on 9/20/24.
//

import SwiftUI

struct SheetTestView: View {
    @ObservedObject var viewModel = CardListViewModel()
    
    var body: some View {
        VStack {
//            Spacer()
//            
//            Capsule()
//                .frame(width: 40, height: 6)
//                .foregroundColor(.gray)
//                .padding(.top, 8)
            TabView {
                ForEach(viewModel.cards) { card in
                    VStack {
                        Image(card.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 350, height: 100)
                        Text(card.imageName)
                        Text("02-1234-1234")
                        Text("서울특별시 중구 창경궁로 62-29")
                        

                    }
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .frame(height: 200)
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 10)
        .transition(.move(edge: .bottom))
        .animation(.easeInOut)
    }
}

#Preview {
    SheetTestView()
}
