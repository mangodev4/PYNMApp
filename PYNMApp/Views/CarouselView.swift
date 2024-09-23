//
//  SheetTestView.swift
//  PYNMApp
//
//  Created by Yujin Son on 9/20/24.
//

import SwiftUI

struct CarouselView: View {
    @ObservedObject var viewModel = CardListViewModel()
    @ObservedObject var mapViewModel = MapViewModel()
    @State private var selectedIndex = 0

    
    var body: some View {
        VStack {
//            Spacer()
//            
//            Capsule()
//                .frame(width: 40, height: 6)
//                .foregroundColor(.gray)
//                .padding(.top, 8)
            TabView(selection: $selectedIndex) {
                ForEach(Array(viewModel.cards.enumerated()), id: \.element.id) { index, card in
                    VStack {
                        Image(card.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 350, height: 100)
                        Text(card.imageName)
                        Text("02-1234-1234")
                        Text("서울특별시 중구 창경궁로 62-29")
                    }
                    .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .frame(height: 200)
            .onChange(of: selectedIndex) { newIndex in
                if newIndex < sampleNMPlaces.count {
                    let selectedPlace = sampleNMPlaces[newIndex]
                    mapViewModel.updatePlace(to: selectedPlace)
                }
//                mapViewModel.movePlace()
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(16)
        .shadow(radius: 10)
        .transition(.move(edge: .bottom))
        .animation(.easeInOut)
    }
}

#Preview {
    CarouselView()
}
